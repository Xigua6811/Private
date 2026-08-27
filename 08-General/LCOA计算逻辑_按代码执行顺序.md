# LCOA 计算逻辑：按代码执行顺序

本文只说明当前代码中的 **LCOA（Levelized Cost of Ammonia，平准化氨成本）** 计算，不按 UI 页面顺序组织，而是严格按后端代码实际发生的顺序组织。

全文分为两部分：

1. **物理计算**：配置如何变成逐年、逐时的发电、储能、制氢和制氨结果；
2. **财务计算**：物理结果如何变成 CAPEX、OPEX、替换成本、折现成本和最终 LCOA。

每一步均给出：输入、代码位置、代码含义、对应公式和输出。本文描述的是“当前实现”，不是对工艺模型的理想化推演。

---

## 0. 最终答案先看这里

当前代码的 LCOA 定义为：

$$
\boxed{
LCOA=
\frac{\displaystyle\sum_{y=0}^{N}\frac{C_y}{(1+r)^y}}
{\displaystyle\sum_{y=1}^{N}\frac{Q_{NH_3,y}^{ton}\times1000}{(1+r)^y}}
}

$$

其中：

- $N$：项目寿命，年；
- $r$：折现率；
- $C_y$：第 $y$ 年的实际现金成本；第 0 年为初始 CAPEX；
- $Q_{NH_3,y}^{ton}$：第 $y$ 年逐小时模拟得到的产氨量，ton；
- 分母乘以 1000，将 ton 转为 kg；
- 最终单位：`USD/kg_nh3`。

这里有三个必须先记住的结论：

1. 代码会对寿命期内的**每一年重新运行逐小时物理模拟**，不是只模拟一年后简单乘以寿命年数。
2. 分子是全项目折现成本，包括电源、储能、电解槽、合成氨、购电、水、运维和替换成本。
3. 分母只使用实际逐小时模拟产生的 NH3，并且产量也进行折现。

总入口位于：

- `main.py:17-62` — `run()`；
- 核心调用顺序位于 `main.py:36-51`。

```text
读取并校验 YAML
    ↓
逐寿命年、逐小时物理模拟
    ↓
汇总逐小时产量与能量流
    ↓
构造第 0 年至寿命末年的现金流
    ↓
折现成本与折现 NH3 产量
    ↓
LCOA = 折现总成本 / 折现 NH3 产量(kg)
    ↓
生成 CSV / JSON 输出
```

---

## 1. 符号和单位

| 符号 | 含义 | 单位 |
|---|---|---|
| $y$ | 寿命期年份，$y=1,2,\ldots,N$ | year |
| $t$ | 某一年内的离散时间步 | step |
| $\Delta t$ | `project.timestep_hours` | h/step |
| $E$ 或 $P\Delta t$ | 每时间步电量 | MWh/step |
| $Q_{H_2}$ | 氢气质量 | kg |
| $Q_{NH_3}$ | 氨产量 | ton 或 kg，按公式标注 |
| $SEC_{H_2}$ | 电解槽单位制氢电耗 | kWh/kg-H2 |
| $e_{NH_3}$ | 合成氨及 ASU 单位产氨电耗 | kWh/ton-NH3 |
| $r$ | 折现率 | fraction/year |
| $DF_y$ | 第 $y$ 年折现因子 | dimensionless |

代码中百分数字段一般通过 `percent_to_fraction()` 转成小数，例如 80 变成 0.8。辅助负荷的 `ratio_of_electrolyzer_capacity` 是直接按小数使用，例如 0.05 表示 5%，不是 5。

---

## 2. LCOA 输入总表

默认字段来自 `configs/general_config.yaml`，用户 YAML 只需要覆盖与项目不同的字段。加载后，默认配置和用户配置会进行深合并。

### 2.1 项目与计算控制输入

| YAML 输入 | 代码位置 | 当前含义 |
|---|---|---|
| `project.lcox_target` | `src/config/schema.py:100-134` | 设为 `LCOA` 后，路线同步为 `ammonia` |
| `project.product_route` | 同上 | LCOA 时自动同步为 `ammonia`，属于兼容标签 |
| `project.simulation_hours` | `src/engine/lifecycle_runner.py:150-155` | 每个寿命年最多模拟多少个时间步 |
| `project.timestep_hours` | 同上 | 每个时间步长度 $\Delta t$ |
| `costs.project_lifetime_years` | `src/engine/lifecycle_runner.py:41-44` | 项目寿命的优先字段 |
| `project.plant_duration_years` | 同上 | 当 costs 中寿命缺失时的回退字段 |
| `costs.discount_rate` | `src/economics/cost_summary.py:213-214` | DCF 折现率 $r$ |
| `project.output_folder` | `src/results/artifacts.py:32-42` | 结果输出根目录 |

项目寿命的取值优先级为：

$$
N=\max\left(\operatorname{int}(costs.project\_lifetime\_years\;\text{or}\;project.plant\_duration\_years),1\right)
$$

单年模拟步数为：

$$
T_{year}=\min\left(project.simulation\_hours,\operatorname{round}\left(\frac{8760}{\Delta t}\right)\right)
$$

### 2.2 电源侧输入

| 输入组 | 关键字段 | 代码使用位置 |
|---|---|---|
| PV | `pv_enabled`、容量、`solar_profile_path`、`profile_site_name`、performance、degradation、transmission | `src/engine/site_builder.py:38-69, 113-142`；`src/components/power_side.py:32-58` |
| 风电 | `wind_enabled`、容量、`wind_profile_path`、performance、degradation、transmission | `src/engine/site_builder.py:38-69, 113-142`；`src/components/power_side.py:32-68` |
| 主电网 | `grid_primary.enabled`、`max_import_mw`、`price_usd_per_mwh`、connection CAPEX、fixed cost | `src/components/power_side.py:75-96`；`src/economics/cost_summary.py:175-200, 243-383` |
| 备用电网 | `grid_backup.enabled`、`max_import_mw`、电价、fixed cost | `src/components/buffer_side.py:86-94, 128-140`；`src/economics/cost_summary.py:243-383` |

当前校验要求主电源二选一：

- 可再生能源主电源；或
- `grid_primary` 主电网。

二者不能同时启用。位置：`src/validation/validation.py:181-184`。

### 2.3 缓冲与储能输入

| 输入组 | 关键字段 | 当前作用 |
|---|---|---|
| BESS | 功率、能量或时长、charge/discharge efficiency、initial/min/max SOC、寿命、成本 | 小时充放电、年度替换和成本 |
| H2 storage | `capacity_kg`、initial/min/max SOC、`retention_hours`、成本 | 小时储氢充放和 H2 storage CAPEX/OPEX |
| 调度开关 | 是否允许主/备用电网给 BESS 充电，备用电网是否允许供应 flexible load | 只在相应调度分支使用 |

LCOA 若启用储氢，当前代码要求：

- 必须手动提供 `buffer_side.h2_storage.capacity_kg > 0`；
- 不能使用 `rolling_sum` 自动定容；
- `capacity_sizing_method` 应为 `design_duration`。

位置：`src/validation/validation.py:288-304`、`src/engine/site_builder.py:78-108`。

### 2.4 制氢、制氨、水和辅助负荷输入

| 输入组 | 关键字段 | 代码使用位置 |
|---|---|---|
| 电解槽 | 容量、`min_load_ratio`、SEC 模式/曲线、correction、oversizing、stack degradation/replacement | `src/components/usage_side.py:37-120`；`src/engine/lifecycle_runner.py:71-98, 190-224` |
| 水 | `water_kg_per_kg_h2`、水单价、water annual/variable OPEX | 物理量记录和财务水成本 |
| 氨装置 | TPD/KTA、`min_load_ratio`、H2 kg/ton、NH3 power/SEC、N2 kg/ton、ASU power/SEC | `src/components/usage_side.py:122-167` |
| 辅助负荷 | `fixed_mw`、`ratio_of_electrolyzer_capacity` | `src/components/usage_side.py:17-31`；仅 Priority LCOA 小时平衡实际分配 |

LCOA 选择后，代码自动完成以下依赖：

```text
h2_system.enabled = true
water_system.enabled = true
ammonia_system.enabled = true
ammonia_system.include_asu = true
project.product_route = ammonia
```

位置：`src/config/schema.py:100-148`。

### 2.5 调度输入

`dispatch_strategy.mode` 决定 LCOA 物理计算走哪一条路径：

| mode | 代码入口 | 含义 |
|---|---|---|
| `region_first` | `src/dispatch/strategies.py:341-448` | 先按主电源可用量划分 LCOA Region，再由 BESS/备用电网支撑 |
| `priority` | `src/dispatch/strategies.py:498-694` | 完全按照 YAML 中各优先级列表逐项消耗能源和物料 |

总分支位置：`src/dispatch/strategies.py:696-700`。

Priority 模式直接使用的列表包括：

- `minimum_load_priority`；
- `power_supply_priority_for_minimum_load`；
- `power_supply_priority_for_flexible_load`；
- `h2_supply_priority_for_ammonia`；
- `excess_power_priority`；
- `excess_h2_priority`。

Region First 主要使用 `power_supply_priority_for_region_base` 和少量允许备用电网/余氢处理的开关，并不逐项执行所有 Priority 列表。

### 2.6 财务输入

财务输入分两层：

1. `costs.*_capex_usd` 和 `costs.*_fixed_opex_usd_per_year`：组件级直接覆盖值；
2. 各组件的单位采购、安装、土地和 OPEX 参数：没有正数覆盖值时用于派生成本。

覆盖规则位于 `src/economics/cost_summary.py:20-24`：

$$
C_{used}=\begin{cases}
C_{override},&C_{override}>0\\
C_{derived},&C_{override}\le0
\end{cases}
$$

若组件没有启用，则对应组件成本直接为 0。

---

# 第一部分：物理计算

## 3. 步骤 P1：读取、合并、同步和校验配置

### 输入

- `configs/general_config.yaml` 默认配置；
- 用户指定的项目 YAML；
- YAML 所在目录与项目根目录。

### 代码位置

- `main.py:36-38`；
- `src/engine/config_loader.py:122-159` — `load_config()`；
- `src/config/schema.py:100-148` — `sync_runtime_config()`；
- `src/validation/validation.py:75-344` — `validate_config()`。

### 代码含义

执行顺序是：

1. 读取默认 YAML；
2. 读取用户 YAML；
3. 对嵌套字典进行深合并，用户值覆盖默认值；
4. 将 LCOA 同步为 ammonia route，并自动启用 H2、水、氨和 ASU；
5. 写入 `_paths.config_path/config_dir/project_root`；
6. 严格校验配置；校验失败则不进入模拟。

LCOA 的关键校验包括：

- `lcox_target` 与 `product_route` 一致；
- 时间步和模拟步数为正；
- 恰好启用一种主电源；
- 电解槽、水、氨装置和 ASU 已启用；
- 氨产能为正；
- ASU 至少有一种有效电耗输入；
- BESS、储氢、备用电网参数合法；
- 调度 mode 和优先级 token 合法。

### 输出

一个经过同步和校验的运行时 `cfg`。后续计算只读取这个运行时配置，不回到 UI 重新取值。

---

## 4. 步骤 P2：建立寿命期年度循环

### 输入

- 项目寿命 $N$；
- 每年模拟步数 $T_{year}$；
- 时间步长 $\Delta t$；
- 电解槽 stack replacement 配置。

### 代码位置

- `main.py:41-45`；
- `src/engine/lifecycle_runner.py:145-232` — `simulate_lifecycle()`；跨年缓冲状态传递位于 `:160-175, 227`。

### 代码含义

代码按下列顺序循环：

```text
for year = 1 ... N:
    深拷贝 cfg → cfg_year
    写入 current year
    写入当前 stack age 和 degradation
    重新 build_site(cfg_year)
    运行该年的所有小时
    计算当年 stack 是否替换
    把当年结果加入总表
```

这里不是：

$$
Q_{life}=Q_{one\ year}\times N
$$

而是：

$$
Q_{life}=\sum_{y=1}^{N}\sum_{t=1}^{T_{year}}Q_{y,t}
$$

因为 PV、风电和电解槽退化会随年份改变，替换事件也会改变后续年份的 stack age。

### 当前年度边界行为

每年都会重新 `build_site()`，但生命周期层会在第 2 年及以后恢复上一年末的缓冲状态。因此：

- PV/风电 profile 从头按取模重复；
- 第 1 年 BESS 和 H2 storage SOC 使用 YAML 的 `initial_soc_ratio`；
- 第 2 年及以后，BESS SOC 继承上一年末值；
- 第 2 年及以后，H2 storage 继承上一年末 FIFO lot、SOC 和每个 lot 的累计存放年龄；
- 电解槽 stack age 和累计运行信息由 lifecycle runner 跨年维护。

因此 BESS 和储氢在寿命期内是首尾连续的；只有项目第 1 年从用户配置的初始 SOC 开始。

### 输出

每个年份的一张小时结果表，随后拼接为全寿命 `hourly_df`，并加入：

- `YearIndex`；
- `hour_of_year`；
- 全寿命连续 `hour`；
- stack age/degradation；
- stack replacement event cost/reason。

---

## 5. 步骤 P3：读取可再生能源 profile 并建立组件

### 输入

- profile 文件；
- 站点列名；
- PV/风电容量；
- $\Delta t$；
- BESS、储氢、电解槽、氨装置和调度配置。

### 代码位置

- `src/engine/site_builder.py:38-69` — `_load_profile()`；
- `src/engine/site_builder.py:78-108` — 储氢容量；
- `src/engine/site_builder.py:113-149` — `build_site()`。

### 代码含义与公式

Excel 中 PV 读取第 1 个 sheet，风电读取第 2 个 sheet。指定 `profile_site_name` 时读取同名列；未指定时读取第一列。

profile 最大值不超过 1 时，按 capacity factor 处理：

$$
E^{base}_{profile,t}=CF_t\times Capacity_{MW}\times\Delta t
$$

profile 最大值大于 1 时，代码认为输入已经是 MW：

$$
E^{base}_{profile,t}=ProfileMW_t\times\Delta t
$$

如果 profile 长度小于模拟长度，小时计算时通过 `t % len(profile)` 循环使用。

### 输出

构建四个对象：

- `PowerSide`：可再生能源和主电网；
- `BufferSide`：BESS、备用电网和储氢；
- `UsageSide`：电解槽、制氨和辅助负荷；
- `ConfigurablePriorityDispatchStrategy`：小时调度。

---

## 6. 步骤 P4：初始化当年 BESS 和 H2 storage

### 代码位置

`src/components/buffer_side.py:28-45`。

### BESS 容量解析

能量容量优先顺序：

$$
E_{BESS}^{rated}=\begin{cases}
energy\_mwh,&>0\\
energy\_kwh/1000,&>0\\
P_{BESS}^{rated}\times duration,&\text{otherwise}
\end{cases}
$$

每时间步充放电功率上限对应的电量：

$$
E_{BESS,power\ limit}=P_{BESS}^{rated}\times\Delta t
$$

初始 SOC：

$$
SOC_{BESS,0}=E_{BESS}^{rated}\times initial\_soc\_ratio
$$

### H2 storage 初始化

LCOA 使用手动容量：

$$
SOC_{H_2,0}=Capacity_{H_2}\times initial\_soc\_ratio
$$

初始库存作为一个 `stored_hour = 0` 的批次放入 FIFO lot 列表。

---

## 7. 步骤 P5：开始某个时间步

### 代码位置

- 年内循环：`src/engine/simulation_engine.py:16-30`；
- 调度入口：`src/dispatch/strategies.py:696-700`；
- `PowerSide.start_hour()`：`src/components/power_side.py:24-30`；
- `BufferSide.start_hour()`：`src/components/buffer_side.py:47-54`。

### 代码含义

对每个 $t$：

1. 计算该时间步可再生能源发电；
2. 把可再生能源剩余量初始化为本步发电量；
3. 把本步主电网、备用电网、BESS、储氢流量初始化为 0；
4. 先处理过期的 H2 storage lot；
5. 根据 `dispatch_strategy.mode` 进入 Region First 或 Priority。

---

## 8. 步骤 P6：计算当步主电源可用量

### 8.1 可再生能源发电

代码位置：`src/components/power_side.py:32-68`。

#### PV

第 $y$ 年累计退化：

$$
d_{PV,y}=\min\left(d_{first}+(y-1)d_{subsequent},1\right)
$$

输电保留系数：

$$
f_{trans,PV}=\max(1-loss\_ratio\times distance_{PV},0)
$$

当步 PV 电量：

$$
E_{PV,y,t}=E^{base}_{PV,t}(1-d_{PV,y})PR_{PV}f_{trans,PV}
$$

#### 风电

当前实现的第 $y$ 年累计退化：

$$
d_{wind,y}=\min(y\times d_{wind,annual},1)
$$

当步风电电量：

$$
E_{wind,y,t}=E^{base}_{wind,t}(1-d_{wind,y})PR_{wind}f_{trans,wind}
$$

总可再生能源：

$$
E_{RE,y,t}=\max(E_{PV,y,t}+E_{wind,y,t},0)
$$

#### 注意

PV 第一年的退化是 `first_year_degradation`；风电第一年已经使用 $1\times annual\_degradation$，两者年度索引形式不同。

### 8.2 主电网

代码位置：`src/components/power_side.py:75-96`。

若有导入上限：

$$
E_{grid,primary,available,t}=\min\left(
Demand_t,
P_{grid,max}\Delta t-E_{grid,primary,used,t}
\right)
$$

同一时间步内的多个负荷共享这一个主电网导入上限。若 `max_import_mw is None`，代码按需求提供，不设上限。

---

## 9. 步骤 P7：预先计算制氢、制氨和辅助负荷的边界

这些函数会被两种调度模式反复调用。

### 9.1 电解槽功率边界

代码位置：`src/components/usage_side.py:37-50`。

$$
E_{EL,max}=P_{EL,rated}\Delta t
$$

$$
E_{EL,min}=E_{EL,max}\times min\_load\_ratio
$$

当前小时调度上限直接使用铭牌容量 $E_{EL,max}$。`max_load_ratio` 会被校验，但当前这两个函数没有用它进一步缩小最大功率。

### 9.2 SEC 与制氢量

代码位置：`src/components/usage_side.py:52-120`。

固定 SEC 模式：

$$
SEC_{H_2}=\frac{SEC_{nominal}}{correction\_factor}
$$

曲线模式先计算电解槽负荷率：

$$
LR_t=\operatorname{clip}\left(\frac{E_{EL,t}}{E_{EL,max}},0,1\right)
$$

曲线上的 SEC 值：

$$
SEC_i=SEC_{nominal}\times sec\_factor_i/correction\_factor
$$

其中 `sec_curve_sec_pct > 2` 时除以 100，否则直接作为小数。之后按配置做线性插值或多项式拟合。

未经退化修正的制氢量：

$$
Q^{raw}_{H_2,t}=\frac{E_{EL,t}}{SEC_{H_2,t}/1000}
$$

考虑 calendar degradation 后：

$$
Q_{H_2,t}=Q^{raw}_{H_2,t}\times(1-d_{stack,y})
$$

$$
d_{stack,y}=\min(stack\_age_y\times degradation\_rate,maximum\_degradation)
$$

固定运行小时替换模式不应用 output degradation，输出系数恒为 1。

反算某质量 H2 所需电量时：

$$
E_{EL,required}=Q_{H_2,required}\times SEC(E_{EL,max})/1000
$$

注意：反算使用满负荷点的 SEC，并且没有除以退化输出系数。因此在有退化时，“请求某质量 H2 的电量”和最终实际产氢量可能不完全一致。

### 9.3 水量

代码位置：`src/components/usage_side.py:65-74`。

$$
Q_{water,t}=Q_{H_2,t}\times water\_kg\_per\_kg\_H_2
$$

当前水模型只计算水量和水成本，不计算 `minimum_power_mw` 或 treatment power 对小时电力平衡的影响。

### 9.4 氨产能、最低负荷和原料氢

代码位置：`src/components/usage_side.py:122-138`。

若 TPD 有效，则优先使用 TPD；否则从 KTA 回退换算。每时间步最大产氨量：

$$
Q_{NH_3,max,t}=\frac{Capacity_{TPD}}{24}\Delta t
$$

最低产氨量：

$$
Q_{NH_3,min,t}=Q_{NH_3,max,t}\times min\_load\_ratio
$$

氢需求：

$$
Q_{H_2,need}=Q_{NH_3}\times h2\_kg\_per\_ton\_nh3
$$

### 9.5 合成氨和 ASU 电耗

代码位置：`src/components/usage_side.py:140-152`。

合成氨部分：

$$
e_{NH_3,process}=\begin{cases}
power\_kwh\_per\_ton\_nh3,&>0\\
ammonia\_plant\_sec\_kwh\_per\_kg\_nh3\times1000,&\text{otherwise}
\end{cases}
$$

ASU 部分：

$$
e_{ASU}=\begin{cases}
asu\_power\_kwh\_per\_ton\_nh3,&>0\\
asu\_sec\_kwh\_per\_kg\_n2\times n2\_kg\_per\_ton\_nh3,&\text{otherwise}
\end{cases}
$$

总电耗和所需电量：

$$
e_{NH_3,total}=e_{NH_3,process}+e_{ASU}
$$

$$
E_{NH_3,required}=Q_{NH_3}^{ton}\times\frac{e_{NH_3,total}}{1000}
$$

给定氢和电力时的实际产氨量：

$$
Q_{NH_3,t}=\min\left(
\frac{Q_{H_2,available,t}}{h2\_kg\_per\_ton},
\frac{E_{NH_3,available,t}}{e_{NH_3,total}/1000},
Q_{NH_3,max,t}
\right)
$$

### 9.6 辅助负荷

代码位置：`src/components/usage_side.py:17-31`。

$$
E_{aux,t}=\left(P_{fixed}+P_{EL,rated}\times ratio_{aux}\right)\Delta t
$$

该公式当前只在 Priority LCOA 调度中真正按负荷分配。Region First LCOA 分支没有调用辅助负荷分配。

---

## 10. 步骤 P8A：Region First 模式的 LCOA 小时调度

### 代码位置

- `src/dispatch/strategies.py:192-201` — Region 分类；
- `src/dispatch/strategies.py:341-438` — LCOA Region First 主逻辑；
- `src/dispatch/strategies.py:440-448` — route 分流。

### 10.1 建立 Region 阈值

先计算：

$$
E_{NH_3,full}=PowerRequired(Q_{NH_3,max})
$$

$$
E_{minimum}=PowerRequired(Q_{NH_3,min})
$$

$$
E_{EL,max}=P_{EL,rated}\Delta t
$$

电解槽设计功率：

$$
E_{H_2,design}=\frac{E_{EL,max}}{1+oversizing}
$$

两个组合阈值：

$$
E_{NH_3+designH_2}=E_{NH_3,full}+E_{H_2,design}
$$

$$
E_{maximum}=E_{NH_3,full}+E_{EL,max}
$$

然后只从 `power_supply_priority_for_region_base` 允许的主电源中查看最多 $E_{maximum}$ 的可用电量：

$$
E_{primary,available}=Available(primary\ sources,E_{maximum})
$$

因为当前校验不允许 renewable 和 grid_primary 同时作为主电源，实际运行中通常只会有一种主电源贡献。

### 10.2 划分 pre-storage Region

| Region | 条件 | 含义 |
|---|---|---|
| 1 | $E_{primary}\ge E_{maximum}$ | 氨装置满负荷 + 电解槽铭牌满功率 |
| 2 | $E_{primary}\ge E_{NH_3+designH_2}$ | 氨满负荷 + 至少设计制氢功率 |
| 3 | $E_{primary}\ge E_{NH_3,full}$ | 可满足氨装置满负荷电耗，剩余给电解槽 |
| 4 | $E_{primary}\ge E_{minimum}$ | 高于氨装置最低电耗，但不足满负荷 |
| 5 | $E_{primary}<E_{minimum}$ | 低于氨装置最低电耗 |

这个 Region 是**储能介入前**的 Region，写入：

- `pre_storage_operation_region`；
- `pre_storage_operation_region_name`；
- `available_primary_power_mwh`。

### 10.3 按 Region 设置主电源目标

| Region | 氨侧目标 | 电解槽目标 |
|---|---:|---:|
| 1 | $E_{NH_3,full}$ | $E_{EL,max}$ |
| 2 | $E_{NH_3,full}$ | $\min(E_{EL,max},E_{primary}-E_{NH_3,full})$ |
| 3 | $E_{NH_3,full}$ | $\max(E_{primary}-E_{NH_3,full},0)$ |
| 4/5 | $\min(E_{primary},E_{NH_3,full})$ | 0 |

主电源按“氨装置先、电解槽后”的顺序实际消耗：

```text
ammonia_power = supply_primary(ammonia_target)
electrolyzer_power = supply_primary(electrolyzer_target)
```

因此两者共享同一个主电源小时上限。

### 10.4 BESS 和备用电网支撑

Region 4：先尝试把氨侧从当前值补到 $E_{NH_3,full}$。

Region 5：先尝试把氨侧补到 $E_{minimum}$。

补电顺序固定为：

```text
BESS → grid_backup
```

若氨侧已经达到最低电耗，则继续用 BESS 支撑电解槽到 $E_{EL,max}$；备用电网是否能支撑 flexible 电解槽由 `allow_grid_backup_for_flexible_load` 决定。

### 10.5 产氢、储氢放氢和产氨

先由电解槽实际功率计算本步产氢：

$$
Q_{H_2,produced}=H2Production(E_{EL,actual})
$$

根据氨侧电力可支持的产氨量：

$$
Q_{NH_3,byPower}=\min\left(
Q_{NH_3,max},
\frac{E_{NH_3,actual}}{PowerRequired(1\ ton\ NH_3)}
\right)
$$

对应氢需求：

$$
Q_{H_2,needForPower}=Q_{NH_3,byPower}\times h2\_kg\_per\_ton
$$

若当步新产 H2 不够，H2 storage 补差额：

$$
Q_{H_2,fromStorage}=\min\left(
Q_{H_2,needForPower}-Q_{H_2,produced},
SOC_{H_2}-SOC_{H_2,min}
\right)
$$

可用氢：

$$
Q_{H_2,available}=Q_{H_2,produced}+Q_{H_2,fromStorage}
$$

氢侧可支持的产氨：

$$
Q_{NH_3,byH_2}=\frac{Q_{H_2,available}}{h2\_kg\_per\_ton}
$$

候选产量：

$$
Q_{NH_3,candidate}=\min(Q_{NH_3,byPower},Q_{NH_3,byH_2})
$$

Region First 对氨最低负荷采用硬切断：

$$
Q_{NH_3,actual}=\begin{cases}
0,&Q_{NH_3,candidate}<Q_{NH_3,min}\\
Q_{NH_3,candidate},&\text{otherwise}
\end{cases}
$$

达到最低负荷时：

$$
Q_{H_2,consumed}=Q_{NH_3,actual}\times h2\_kg\_per\_ton
$$

未使用氢形成 H2 pool，再按 `excess_h2_priority` 执行 storage、export、vent。

### 10.6 强制停机标记

若：

$$
E_{NH_3,actual}<E_{minimum}
$$

或产氨量为 0，则 `forced_shutdown = True`，并记录 minimum power/H2 unmet。

注意：当前代码将产氨量切为 0 时，不回滚此前已经消耗的氨侧电力、电解槽电力或储氢放氢；未消耗的 H2 进入余氢处理。

### 10.7 BESS 充电和弃电

在本步末尾：

1. 剩余可再生能源先给 BESS 充电；
2. 再有剩余则记录 curtailment。

Region First LCOA 的这一段是固定顺序，不读取 `excess_power_priority` 来重新排序。

### 10.8 Region First 的当前实现边界

这条分支当前没有把 `auxiliary_load` 放入功率平衡。因此 Region 阈值、最低负荷和最终小时用电中不包含辅助负荷。若项目需要辅助负荷按小时优先供电，应使用并核对 Priority 分支，或后续修改 Region First 实现。

---

## 11. 步骤 P8B：Priority 模式的 LCOA 小时调度

### 代码位置

- 通用按序供电：`src/dispatch/strategies.py:19-39`；
- H2 feed：`src/dispatch/strategies.py:99-148`；
- 余氢：`src/dispatch/strategies.py:150-181`；
- Priority 主逻辑：`src/dispatch/strategies.py:498-694`。

### 11.1 通用“一级一级使用”规则

对任意电力需求 $D$ 和优先级列表 $[s_1,s_2,\ldots]$：

$$
D_0=D
$$

$$
Used_i=\min(D_{i-1},Available_{s_i})
$$

$$
D_i=D_{i-1}-Used_i
$$

直到需求为 0 或所有电源用完。典型顺序可配置为：

```text
renewable → bess → grid_primary → grid_backup
```

各负荷是顺序执行的，所以先执行的负荷会先占用可再生能源、BESS SOC 和电网小时容量，后执行的负荷只能使用剩余资源。

### 11.2 按 `minimum_load_priority` 逐项满足最低负荷

代码严格按照 YAML 列表顺序执行。默认配置顺序是：

```text
1. ammonia_min_load
2. h2_feed_for_ammonia
3. electrolyzer_min_load
4. auxiliary_load
```

#### A. `ammonia_min_load`

$$
D_{NH_3,min}^{power}=PowerRequired(Q_{NH_3,min})
$$

再由 `power_supply_priority_for_minimum_load` 一级一级供电。

#### B. `h2_feed_for_ammonia`

$$
D_{H_2,min}=Q_{NH_3,min}\times h2\_kg\_per\_ton
$$

然后按 `h2_supply_priority_for_ammonia` 取氢。对默认顺序：

```text
h2_storage → current_electrolyzer_production
```

当执行到 `current_electrolyzer_production` 且当前 H2 pool 仍不足时，代码反算额外电解槽电量：

$$
D_{EL,extra}=PowerRequiredForH2(D_{H_2,remaining})
$$

并继续用 minimum power priority 取电制氢，但总电解槽功率不超过 $E_{EL,max}$。

#### C. `electrolyzer_min_load`

若前一步已为 H2 feed 运行过电解槽，此处只补到最低功率：

$$
D_{EL,min}=\max(E_{EL,min}-E_{EL,already},0)
$$

#### D. `auxiliary_load`

$$
D_{aux}=E_{aux,t}
$$

同样用 minimum power priority 逐级供电。

### 11.3 最低负荷缺口和停机标记

电力缺口：

$$
UnmetPower_{min}=\sum_j\max(D_j-Supplied_j,0)
$$

氢缺口：

$$
UnmetH2_{min}=\max(D_{H_2,min}-Supplied_{H_2,min},0)
$$

若有任一缺口且 `allow_shutdown_if_minimum_load_unmet = true`，代码设置 `forced_shutdown = True`。

当前 Priority 实现只设置停机标记，并不回滚前面已经发生的能源流；随后仍继续执行候选最低产氨和 excess power 循环。因此流程图中应把它画成“设置状态标志”，不能画成函数立即 return。

### 11.4 计算最低负荷阶段的实际产氨

如果已取得氨侧电力和氢：

$$
Q_{NH_3,minStage}=\min\left(
ProduceAmmonia(H2_{consumed,min},E_{NH_3,min,actual}),
Q_{NH_3,min}
\right)
$$

代码再按实际最低阶段产氨量重算 H2 consumed，并把氨侧电力最多保留到最低负荷需求。

### 11.5 按 `excess_power_priority` 处理剩余电力

对默认顺序：

```text
1. electrolyzer_flexible_load
2. bess_charge
3. curtailment
```

#### A. `electrolyzer_flexible_load`

先把电解槽从当前功率补到最大功率：

$$
D_{EL,flex}=E_{EL,max}-E_{EL,current}
$$

用 `power_supply_priority_for_flexible_load` 逐级供电并制氢。

之后若 H2 pool 大于 0，继续增加产氨：

$$
Q_{NH_3,room}=Q_{NH_3,max}-Q_{NH_3,current}
$$

$$
Q_{NH_3,H2limit}=\min\left(Q_{NH_3,room},\frac{H2_{pool}}{h2\_kg\_per\_ton}\right)
$$

按这个候选产量请求氨侧电力，再由 `produce_ammonia()` 同时受 H2、电力和最大产能约束。

若 `allow_grid_backup_for_flexible_load = false`，即使 flexible power priority 列表包含 `grid_backup`，通用供电函数也会跳过备用电网。

#### B. `bess_charge`

先用剩余可再生能源充 BESS。若相应开关开启，还可使用主电网或备用电网充电。

#### C. `curtailment`

把仍未利用的可再生能源记录为弃电。

无论列表是否显式包含 curtailment，循环结束后代码还会把剩余可再生能源全部计入 curtailment。

### 11.6 余氢处理

当步所有产氨完成后：

$$
H2_{excess}=H2_{pool}
$$

再按 `excess_h2_priority` 顺序处理：

```text
h2_storage → export → vent
```

LCOA 路线中：

- 存入 H2 storage 的量不是最终 H2 product；
- `h2_product_kg` 只记录 exported H2；
- LCOA 分母完全不使用 H2 product，只使用 NH3 produced。

### 11.7 Priority 模式 Region 标签

Priority 不是先按主电源划 Region 再调度，而是在小时能量流结束后，根据实际 ammonia power、电解槽功率、辅助负荷和 forced shutdown 反推 operation Region。

位置：`src/dispatch/strategies.py:451-496, 684-690`。

---

## 12. 步骤 P9：BESS、备用电网和储氢的状态方程

### 12.1 BESS 放电

代码位置：`src/components/buffer_side.py:74-84, 96-112`。

可从 SOC 取出的储内电量：

$$
E_{draw,max}=\min\left(
E_{powerLimit,remaining},
SOC_{t-1}-SOC_{min}
\right)
$$

负荷侧可收到：

$$
E_{deliver,max}=E_{draw,max}\eta_{dis}
$$

实际放电后：

$$
SOC_t=SOC_{t-1}-\frac{E_{delivered}}{\eta_{dis}}
$$

### 12.2 BESS 充电

代码位置：`src/components/buffer_side.py:114-126`。

可接收的输入电量：

$$
E_{charge,input}=\min\left(
E_{excess},
E_{chargePowerLimit,remaining},
\frac{SOC_{max}-SOC_{t-1}}{\eta_{ch}}
\right)
$$

$$
SOC_t=SOC_{t-1}+E_{charge,input}\eta_{ch}
$$

当前调度直接使用 `efficiency_charge` 和 `efficiency_discharge`，不直接使用 `roundtrip_efficiency`。

### 12.3 备用电网

代码位置：`src/components/buffer_side.py:86-94, 128-140`。

$$
E_{backup,available}=\min\left(
Demand,
P_{backup,max}\Delta t-E_{backup,used,t}
\right)
$$

同一时间步的多个负荷共享备用电网容量。

### 12.4 H2 storage 放氢、充氢和过期

代码位置：`src/components/buffer_side.py:142-199, 242-258`；跨年状态导出/恢复位于 `:201-240`。

放氢：

$$
Q_{discharge}=\min(Q_{need},SOC_{H_2,t-1}-SOC_{H_2,min})
$$

充氢：

$$
Q_{charge}=\min(Q_{excess},SOC_{H_2,max}-SOC_{H_2,t-1})
$$

库存按 FIFO lot 记录。若设置 `retention_hours`，当：

$$
CurrentHour-StoredHour>RetentionHours
$$

整个过期 lot 被作为 `h2_storage_loss_kg` 移除。

当前代码没有使用 `hourly_fixed_loss_kg`、`hourly_loss_ratio` 或 compressor power 去修改小时 H2/电力平衡；实际生效的是 lot retention expiry。

---

## 13. 步骤 P10：结束时间步、结束年度并汇总物理结果

### 代码位置

- 小时记录完成：`src/dispatch/strategies.py:238-247` 或 `:684-694`；
- 状态快照：`src/components/power_side.py:106-113`、`src/components/buffer_side.py:260-272`；
- 全寿命汇总：`src/engine/lifecycle_runner.py:101-142, 230-232`。

### 代码含义

每个时间步保存至少以下 LCOA 关键结果：

- renewable generation/used/curtailment；
- grid primary/backup import；
- BESS charge/discharge/SOC；
- electrolyzer power 和 H2 produced；
- H2 storage charge/discharge/loss/SOC；
- H2 consumed by ammonia、exported、vented；
- ammonia power、NH3 produced；
- minimum demand/supply/unmet；
- operation Region 和 forced shutdown。

Region First 中：

- `operation_region` 优先保存 pre-storage Region；
- `post_storage_operation_region` 保存储能与备用电网介入后的实际 Region。

Priority 中 Region 是调度结束后推导的，`operation_region` 和 post-storage Region 相同。

寿命期产氨量：

$$
Q_{NH_3,life}^{ton}=\sum_{y=1}^{N}\sum_t Q_{NH_3,y,t}^{ton}
$$

这个逐年逐时结果将直接进入财务现金流，不再使用名义 TPD 代替实际产量。

---

## 14. 步骤 P11：电解槽 stack 替换事件

### 代码位置

- 模式归一化：`src/engine/lifecycle_runner.py:71-76`；
- 替换成本：`src/engine/lifecycle_runner.py:79-88`；
- 年末触发：`src/engine/lifecycle_runner.py:190-224`。

### 替换成本

$$
C_{stack,replacement}=CAPEX_{electrolyzer}\times stack\_replacement\_fraction\_of\_capex
$$

### 模式 A：固定累计运行小时

电解槽功率大于 0 的时间步会计为运行。累计达到 `stack_lifetime_hours` 时，在该年最后一条小时记录中写入替换事件成本。

当前代码的累计值是“运行时间步数量”，没有乘 $\Delta t$。因此只有 $\Delta t=1$ 小时时，它才严格等同于运行小时。

### 模式 B：日历年退化阈值

年初输出退化：

$$
d_{stack,y}=\min(age_y\times rate,threshold)
$$

年末若：

$$
(age_y+1)\times rate\ge threshold
$$

则记录替换成本，并把 stack age 重置为 0；下一年按新 stack 运行。

---

# 第二部分：财务计算

## 15. 步骤 F1：由配置派生初始 CAPEX 和固定 OPEX

### 代码位置

`src/economics/cost_summary.py:112-203` — `_derived_capex_and_opex()`。

### 15.1 Renewable CAPEX

$$
C_{PV,purchase}=Capacity_{PV,kW}\times PV\ purchase\ cost_{/kW}
$$

$$
C_{PV,install}=Capacity_{PV,kW}\times PV\ installation\ cost_{/kW}
$$

风电同理。

输电 CAPEX：

$$
C_{trans}=Cost_{/km}\times(Distance_{PV}+Distance_{wind})
$$

只计入已启用技术的距离。

$$
C_{renewable}=C_{PV,purchase}+C_{PV,install}+C_{PV,land}
+C_{wind,purchase}+C_{wind,install}+C_{wind,land}+C_{trans}
$$

### 15.2 Grid connection CAPEX

$$
C_{gridConnection}=grid\_primary.grid\_connection\_capex\_usd
$$

若 `costs.grid_connection_capex_usd > 0`，则使用 override。

### 15.3 BESS CAPEX

$$
C_{BESS,purchase}=EnergyCapacity_{kWh}\times capex_{/kWh}
$$

$$
C_{BESS}=C_{purchase}+C_{installation}+C_{land}
$$

### 15.4 H2 storage CAPEX

LCOA 使用手动 `capacity_kg`：

$$
C_{H_2storage}=Capacity_{kg}\times PurchaseCost_{/kg}
+Capacity_{kg}\times InstallCost_{/kg}+Land
$$

### 15.5 电解槽 CAPEX

$$
C_{EL}=Capacity_{EL,kW}\times PurchaseCost_{/kW}
+Capacity_{EL,kW}\times InstallCost_{/kW}+Land
$$

### 15.6 Ammonia CAPEX

$$
C_{ASU,install}=C_{ASU,purchase}\times asu\_installation\_cost\_factor
$$

$$
C_{NH_3storage,install}=C_{NH_3storage,purchase}\times ammonia\_storage\_installation\_factor
$$

$$
C_{ammonia}=C_{plant,purchase}+C_{plant,install}
+C_{ASU,purchase}+C_{ASU,install}
+C_{NH_3storage,purchase}+C_{NH_3storage,install}
$$

### 15.7 Water 和 Other CAPEX

当前 `Water CAPEX` 固定为 0。其他一次性成本读取 `costs.other_capex_usd`。

### 15.8 派生固定 OPEX

Renewable：

$$
OPEX_{RE}=PV_{kW}\times PV\ OPEX_{/kW\cdot yr}
+Wind_{kW}\times Wind\ OPEX_{/kW\cdot yr}
+C_{trans}\times transmission\_opex\_fraction
$$

BESS、储氢和电解槽的派生固定 OPEX 只对各自 purchase cost 乘 OPEX fraction，不对安装和土地成本乘费率：

$$
OPEX_{component}=C_{purchase}\times opex\_fraction
$$

氨固定 OPEX：

$$
OPEX_{NH_3}=C_{plant,purchase}f_{plant}
+C_{ASU,purchase}f_{ASU}
+C_{storage,purchase}f_{storage}
$$

`ammonia.additional_annual_costs_usd` 被加入 Other Annual Cost。

---

## 16. 步骤 F2：建立第 0 年现金流

### 代码位置

`src/economics/cost_summary.py:243-326` — `build_lifecycle_cost_schedule()` 的 Year 0。

### 代码含义

第 0 年只放入：

- Renewable CAPEX；
- Grid Connection CAPEX；
- BESS CAPEX；
- H2 Storage CAPEX；
- Electrolyzer CAPEX；
- Ammonia CAPEX；
- Water CAPEX；
- Other CAPEX。

$$
C_0=\sum C_{CAPEX,component}
$$

$$
DF_0=1
$$

$$
PV(C_0)=C_0
$$

第 0 年产量为 0，不进入分母。

---

## 17. 步骤 F3：逐年读取真实物理结果

### 代码位置

`src/economics/cost_summary.py:328-383`。

对每年 $y=1\ldots N$，从 `hourly_df` 中按 `YearIndex` 取出该年数据，然后求和：

$$
Q_{H_2,y}=\sum_t Q_{H_2,y,t}
$$

$$
Q_{NH_3,y}^{ton}=\sum_t Q_{NH_3,y,t}^{ton}
$$

$$
E_{gridPrimary,y}=\sum_t E_{gridPrimary,y,t}
$$

$$
E_{gridBackup,y}=\sum_t E_{gridBackup,y,t}
$$

这一步把物理模拟和财务模型连接起来：电价成本取决于实际购电，H2/水/NH3 variable OPEX 取决于实际产量，而不是额定产能。

---

## 18. 步骤 F4：计算每年固定成本、变动成本和购电成本

### 18.1 固定 OPEX

第 $y$ 年固定成本包括：

- 派生或覆盖的 renewable/BESS/H2 storage/electrolyzer/ammonia fixed OPEX；
- `grid_primary.annual_fixed_cost_usd`；
- `grid_backup.annual_fixed_cost_usd`；
- `h2_system.annual_fixed_cost_usd`；
- `ammonia_system.annual_fixed_cost_usd`；
- `water_system.annual_fixed_cost_usd`；
- other/additional annual cost。

### 18.2 主电网购电成本

$$
C_{gridPrimary,y}=E_{gridPrimary,y}\times Price_{gridPrimary,/MWh}
$$

### 18.3 备用电网购电成本

$$
C_{gridBackup,y}=E_{gridBackup,y}\times Price_{gridBackup,/MWh}
$$

### 18.4 H2 variable OPEX

$$
C_{H_2,var,y}=Q_{H_2,produced,y}\times variable\_opex_{/kgH_2}
$$

这里按“所有实际制得的 H2”计费，包括最终被制氨消耗、储存、外售或放空的 H2。

### 18.5 水成本

$$
Q_{water,y}=Q_{H_2,produced,y}\times water\_kg\_per\_kg\_H_2
$$

$$
C_{water,y}=Q_{water,y}\times
(h2\ water\_cost_{/kg}+water\ variable\_opex_{/kg})
$$

### 18.6 Ammonia variable OPEX

$$
C_{NH_3,var,y}=Q_{NH_3,y}^{ton}\times variable\_opex_{/tonNH_3}
$$

### 18.7 年度总现金成本

$$
C_y=FixedOPEX_y+GridCost_y+VariableOPEX_y+Replacement_y
$$

第 1 年至第 $N$ 年不重复计初始 CAPEX。

---

## 19. 步骤 F5：BESS 和 stack 的实际替换成本

### 19.1 BESS 替换

代码位置：`src/economics/cost_summary.py:235-240, 323-383`。

替换成本优先级：

$$
C_{BESS,repl}=\begin{cases}
replacement\_cost\_usd,&>0\\
C_{BESS,CAPEX}\times replacement\_fraction\_of\_capex,&\text{otherwise}
\end{cases}
$$

替换周期：

$$
Period_{BESS}=round(lifetime\_years)
$$

当：

$$
y\bmod Period_{BESS}=0
$$

该年计入一次 BESS replacement。

### 19.2 电解槽 stack 替换

生命周期物理循环已经把真实触发的替换事件成本写入某年的最后一个时间步。财务模型按年求和：

$$
C_{stack,repl,y}=\sum_t stack\_replacement\_event\_cost_{y,t}
$$

因此当前财务模型使用实际事件，不使用年度 replacement reserve，也不做年化占位成本。

---

## 20. 步骤 F6：折现每年成本和 NH3 产量

### 代码位置

`src/economics/cost_summary.py:281-383`。

折现因子：

$$
DF_y=\frac{1}{(1+r)^y}
$$

折现成本：

$$
PV(C_y)=C_y\times DF_y
$$

折现 NH3 产量：

$$
PV(Q_{NH_3,y})=Q_{NH_3,y}^{ton}\times1000\times DF_y
$$

全寿命折现总成本：

$$
C_{PV,total}=\sum_{y=0}^{N}PV(C_y)
$$

全寿命折现 NH3 产量：

$$
Q_{NH_3,PV,total}^{kg}=\sum_{y=1}^{N}PV(Q_{NH_3,y})
$$

注意：代码同时折现成本和物理产量。这里不是只折现成本、分母使用未折现总产量。

---

## 21. 步骤 F7：生成成本分项表

### 代码位置

`src/economics/cost_summary.py:386-442` — `calculate_cost_breakdown()`。

现金流各列被映射为：

- `capex`；
- `fixed_opex`；
- `electricity`；
- `variable_opex`；
- `replacement`；
- `other_annual_cost`。

对每个 component 同时计算：

$$
NominalCost_k=\sum_y C_{k,y}
$$

$$
DiscountedCost_k=\sum_y C_{k,y}DF_y
$$

最后增加 `total_discounted_cost` 总行。这个总行是 LCOA 的分子来源。

---

## 22. 步骤 F8：计算最终 LCOA

### 代码位置

- `src/economics/lcox.py:94-173` — `calculate_lcox()`；
- ammonia route 分母选择位于 `src/economics/lcox.py:116-125`。

### 输入

- `cost_breakdown` 中的 total discounted cost；
- `summary_df.discounted_nh3_production_kg`；
- 未折现全寿命 `nh3_production_ton`。

### 公式

$$
\boxed{
LCOA_{USD/kg}=
\frac{C_{PV,total}^{USD}}
{Q_{NH_3,PV,total}^{kg}}
}
$$

正常生命周期路径会直接使用 `discounted_nh3_production_kg`。如果这个汇总字段缺失或小于等于 0，代码还有一个兼容性回退：

$$
Q_{denominator}=\frac{Q_{NH_3,simulated}^{kg}}
{project.simulation\_hours\times\Delta t/8760}
$$

只有回退后的分母仍小于等于 0 时：

```text
lcox_usd_per_unit = null / None
```

不会返回无穷大。

结果还记录：

$$
AnnualFinalProductOutput=
\frac{Q_{NH_3,life}^{kg}}{N}
$$

但这个平均年产量只是结果字段，不参与 LCOA 分母计算。

### LCOA 路线附带的 LCOH

LCOA 路线还会输出一个 additional LCOH：

$$
Additional\ LCOH=
\frac{同一个全项目折现总成本}
{折现 H2 produced}
$$

它不是“只含制氢岛成本的 LCOH”，因为分子仍然包含完整氨项目成本。主指标仍然是 LCOA。

---

## 23. 步骤 F9：生成输出文件

### 代码位置

- `main.py:49-60`；
- `src/results/artifacts.py:53-75`；
- `src/results/artifacts.py:90-106`。

与核对 LCOA 最直接相关的输出：

| 文件 | 用途 |
|---|---|
| `hourly_results.csv` | 检查每年每小时的能量流、H2、NH3、SOC、Region 和停机 |
| `summary_results.csv` | 检查全寿命未折现/折现产量和总成本 |
| `yearly_cost_schedule.csv` | 检查每年成本、产量、替换和折现 |
| `discounted_lifecycle_cost_schedule.csv` | 检查 DCF 现金流 |
| `cost_breakdown.csv` | 检查各成本 component 的名义值和现值 |
| `lcox_result.json` | 最终 LCOA 数值、单位、分子、分母和附加指标 |
| `operation_region_summary.csv` | 核对不同 Region 的时间分布 |

推荐审计顺序：

```text
hourly_results.csv
    → 按 YearIndex 汇总产氨与购电
yearly_cost_schedule.csv
    → 检查年度现金成本和折现产量
cost_breakdown.csv
    → 检查折现成本总和
lcox_result.json
    → 验证分子 / 分母 = LCOA
```

---

## 24. 可以直接照着画的流程图节点

### 24.1 物理流程

```text
P1 读取默认 YAML 和项目 YAML
P2 深合并配置
P3 LCOA 依赖同步：H2 + Water + NH3 + ASU
P4 严格校验
P5 确定寿命 N、每年步数和 Δt
P6 进入 year = 1...N
P7 写入 renewable year 和 stack age/degradation
P8 读取 PV/Wind profile，建立 Site
P9 初始化 BESS/H2 storage SOC
P10 进入 t = 1...Tyear
P11 计算该步 renewable / primary grid available
P12 初始化 BESS、backup grid、H2 storage 小时状态
P13 判断 dispatch mode
    ├─ Region First
    │   P14A 计算 LCOA Region 阈值
    │   P15A 计算 pre-storage Region
    │   P16A 主电源先供 NH3，再供 electrolyzer
    │   P17A BESS / backup grid 支撑
    │   P18A 产 H2、储氢放氢、产 NH3
    │   P19A 最低负荷硬切断与 forced shutdown
    │   P20A 余氢 → storage/export/vent
    │   P21A 剩余 RE → BESS → curtailment
    └─ Priority
        P14B 按 minimum_load_priority 逐项执行
        P15B 每项按 minimum source priority 逐级取电
        P16B H2 按 H2 priority 逐级取得
        P17B 记录缺口和 forced shutdown 状态
        P18B 计算 minimum-stage NH3
        P19B 按 excess_power_priority 执行 flexible EL/NH3、BESS、curtailment
        P20B 余氢 → storage/export/vent
P22 更新 SOC、导入、弃电、H2、NH3 和 Region 快照
P23 时间步结束；循环下一步
P24 年末判断 stack replacement
P25 拼接该年 hourly results；循环下一年
P26 汇总全寿命实际 NH3、H2、购电和替换事件
```

### 24.2 财务流程

```text
F1 读取成本 override 和组件单位成本
F2 派生 Renewable/Grid/BESS/H2 storage/EL/NH3 CAPEX
F3 派生年度 fixed OPEX
F4 建立 Year 0 CAPEX 现金流
F5 进入 year = 1...N
F6 从 hourly results 汇总该年 NH3、H2、主/备用电网电量
F7 计算年度 fixed OPEX
F8 计算购电、H2、水和 NH3 variable cost
F9 加入当年 BESS replacement 和实际 stack replacement
F10 得到 Total Cash Cost_y
F11 计算 DF_y = 1/(1+r)^y
F12 计算 Discounted Total Cost_y
F13 计算 Discounted NH3 kg_y
F14 汇总全寿命折现成本
F15 汇总全寿命折现 NH3 kg
F16 LCOA = 折现成本 / 折现 NH3 kg
F17 写出 cost schedule、breakdown 和 lcox_result
```

---

## 25. 当前实现中需要特别标记的边界

这些不是公式推导，而是按当前代码核对流程图时必须保留的事实：

1. **主电源互斥**：renewable primary 与 grid_primary 不能同时启用。
2. **Region First 不计辅助负荷**：Priority 才按 `auxiliary_load` 分配电力。
3. **水处理电耗未建模**：只计算水量和水成本。
4. **LCOA 储氢必须手动定容**：rolling window/rolling-sum 不允许用于 LCOA。
5. **储氢损失只实现 retention expiry**：配置中的每小时固定/比例损失和 compressor power 当前不参与平衡。
6. **BESS 使用 charge/discharge efficiency**：`roundtrip_efficiency` 当前不直接进入状态方程。
7. **BESS 和 H2 SOC 跨年连续**：第 1 年使用配置初值，第 2 年起继承上一年末状态；储氢 lot 的 retention age 也连续累计。
8. **固定寿命 stack 的运行小时按时间步计数**：非 1 小时时间步会与真实小时数不同。
9. **`max_load_ratio` 未限制当前电解槽最大调度功率**：当前最大值仍是铭牌容量乘时间步。
10. **Priority forced shutdown 是状态标记**：不会立刻回滚或 return。
11. **Region First 最低产氨硬切断后不回滚已取电**。
12. **LCOA 分子是完整项目成本**，分母是折现 NH3 kg；不是氨岛增量成本除以产氨量。
13. **额定 TPD 只设小时上限**，最终 LCOA 分母使用实际调度产氨量。
14. **财务是实际 DCF 现金流**，没有使用旧式 annualized cost 或 replacement reserve。

---

## 26. 最简人工复核公式

从输出文件人工复核时，只需完成以下四步。

### 第一步：每年实际产氨

$$
Q_{NH_3,y}^{ton}=\sum_{t\in y}hourly\_results[nh3\_produced\_ton]
$$

### 第二步：每年现金成本

$$
C_y=yearly\_cost\_schedule[Total\ Cash\ Cost]_y
$$

### 第三步：分别折现

$$
C_{PV}=C_0+\sum_{y=1}^{N}\frac{C_y}{(1+r)^y}
$$

$$
Q_{PV}=\sum_{y=1}^{N}\frac{Q_{NH_3,y}^{ton}\times1000}{(1+r)^y}
$$

### 第四步：相除

$$
\boxed{LCOA=C_{PV}/Q_{PV}}
$$

结果应与 `lcox_result.json` 中：

- `metric = LCOA`；
- `unit = kg_nh3`；
- `total_discounted_cost_usd`；
- `discounted_final_product_output`；
- `lcox_usd_per_unit`

完全对应。
