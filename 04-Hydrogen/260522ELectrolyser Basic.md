
## Electrolysis Efficiency & Energy Loss

### 1. Overall Efficiency Range
- Modern electrolysis converts **60–80%** of electrical energy into usable hydrogen.
- Producing **1 kg of hydrogen** (energy content: ~33.3 kWh) requires **50–60 kWh** of electricity in commercial systems.
- The **theoretical minimum** energy needed is **~39.4 kWh/kg** → real systems use **30–50% more** due to losses.

---

### 2. Two Ways to Measure Hydrogen's Energy Content
| Measure | Includes | Impact on Efficiency |
|---------|----------|----------------------|
| **HHV (Higher Heating Value)** | Energy in water vapor | Higher % |
| **LHV (Lower Heating Value)** | Excludes water vapor energy | Lower % |

> Always check which standard is being cited when comparing electrolyzer efficiency.

---

### 3. Efficiency by Electrolyzer Type

| Type | Energy Consumption (kWh/kg H₂) | HHV Efficiency | Key Characteristics |
|------|-------------------------------|----------------|----------------------|
| **Alkaline** | 53–63 | ~70% | Mature, cheap, but slow response to power fluctuations |
| **PEM** | 52–58 | Similar to alkaline | Fast ramping, good for renewables, handles variable loads |
| **Solid Oxide** | 40–42 | Highest | High temp (700–850°C), uses heat + electricity, durability challenges |

> **DOE target for Solid Oxide (LHV stack)**: 98% efficiency; system-level: 93–95%.

---

### 4. Three Types of Energy Losses

| Loss Type | Cause | Key Note |
|-----------|-------|----------|
| **Kinetic (activation)** | Energy needed to start chemical reactions | Largest at low operating speeds; depends on catalyst |
| **Ohmic** | Electrical resistance in membrane/electrodes | Increases with higher current |
| **Mass transport** | Water can't reach reaction sites fast enough; gas bubbles block electrodes | Can account for **up to 28%** of total wasted energy |

> Raising temperature from 40°C to 80°C reduces mass transport losses by ~25%.

---

### 5. Impact of Renewable Power (Fluctuating Supply)
- Intermittent operation (clouds, wind changes) causes **frequent ramping up/down**.
- Rapid power swings accelerate **degradation of membrane & catalyst**.
- **Steady 50% capacity** is less damaging than constant jumping between 20–100%.
- Lab studies often oversimplify real-world cycling patterns; industrial-scale data is still limited.

---

### 6. Waste Heat Recovery
- Recovering waste heat can improve overall system efficiency.
- Using heat to **preheat inlet water** reduces electricity consumption by **2.5–5 kWh/kg** (3–5% efficiency gain).
- Under low-wind conditions, heat recovery increased total H₂ production by ~9%.
- **Solid oxide systems** benefit greatly from industrial or nuclear waste heat.

---

### 7. DOE Cost & Efficiency Targets (Hydrogen Shot)

| Target Year | Cost of Clean Hydrogen |
|-------------|------------------------|
| 2026 (interim) | $2/kg |
| 2031 | $1/kg |

**DOE target for high-temperature electrolyzers**: **35–36 kWh/kg** (compared to current 55–60 kWh/kg for low-temp systems).

---

### 8. Practical Takeaway
- Today's best commercial electrolyzers waste **roughly 1/3 to 1/2** of the electricity they consume.
- High-temperature solid oxide systems can significantly reduce waste, but **durability and cost** remain hurdles.
- The technology is already **commercially viable** today, with a clear path toward **>80% efficiency** within this decade.



电解槽

## 一、什么是极化曲线？

**极化曲线**（也称为 **I-V 曲线** 或 **电流-电压曲线**）是描述电解槽中 **电流密度**（A/cm²）与 **电压**（V）之间关系的特性曲线。

简单来说：**电流密度越高，所需电压也越高**。极化曲线直观地展示了在不同工作电流下，各种“过电位”（电压损失）造成了多少额外的能耗。

---

## 二、极化曲线的三个典型区域

| 区域 | 名称 | 产生原因 | 曲线形状 |
|:---:|:---|:---|:---:|
| **1** | **活化过电位区** | 电极表面反应动力学缓慢（需要能量启动反应） | 低电流时斜率陡峭 |
| **2** | **欧姆过电位区** | 电解液、隔膜、电极等对离子/电子流动的阻力 | 中间区域呈线性 |
| **3** | **浓差过电位区** | 反应物（水）供应不足，无法及时到达电极表面 | 高电流时斜率陡升，出现极限电流 |

### 示意图（电压 vs 电流密度）

```
电压 (V)
  ↑
2.5 ├─────────────────────────────────────────
    │                                    ┌───┐
2.0 ├────────────────────────────────────┘   │
    │                                ┌───┐    │
1.5 ├────────────────────────────────┘   │    │
    │                            ┌───┐     │    │
1.0 ├────────────────────────────┘   │     │    │
    │                    ┌───┐        │     │    │
0.5 ├────────────────────┘   │        │     │    │
    │              ┌───┐      │        │     │    │
0.0 ├───┬───┬───┬──┴───┴──┬───┴───┬───┴──┬──┴──┴──→ 电流密度 (A/cm²)
       0.0   0.5   1.0   1.5    2.0    2.5    3.0
        
       ←─活化极化─→← 欧姆极化 →←─浓差极化─→
```

---

## 三、三个区域的详细说明

### 区域1：活化极化（低电流密度时）

- **原因**：电化学反应需要克服一个“能量门槛”才能发生。就像推车上坡需要先用力一样，反应刚开始时需要额外电压来“激活”。
- **数学模型（Tafel 方程）**：

 $$ \eta_{act} = a + b \cdot \log(i)$$

  其中 \(i\) 为电流密度，\(a\)、\(b\) 为常数
- **实际意义**：电解槽在低负荷启动时效率较低，因为大部分电压都消耗在克服活化能上

### 区域2：欧姆极化（中等电流密度时）

- **原因**：离子在电解液/隔膜中移动时、电子在电极和导线中传导时，都会遇到阻力。这种阻力造成的电压损失遵循欧姆定律。
- **数学模型**：

  $$\eta_{ohmic} = i \cdot R$$

  其中 \(R\) 为总欧姆电阻（包括隔膜电阻、电极电阻、电解液电阻等）
- **实际意义**：这是电解槽最理想的工作区间，电压随电流线性增加，效率相对稳定

### 区域3：浓差极化（高电流密度时）

- **原因**：当电流很大时，电极表面附近的水被快速消耗，但溶液深处的水来不及扩散过来，导致“供不应求”。此时电压急剧上升，最终达到一个极限电流密度。
- **数学模型（近似）**：

$$  \eta_{conc} = \frac{RT}{nF} \ln\left(\frac{i_L}{i_L - i}\right)$$

  其中 \(i_L\) 为极限电流密度
- **实际意义**：应避免在这个区域长期运行，否则效率极差，而且可能导致电极损坏

---

## 四、理想 vs 实际的极化曲线

| 参数 | 理想电解槽 | 实际电解槽 |
|:---|:---|:---|
| 开路电压（最小理论电压） | ~1.23 V | ~1.23 V |
| 活化损失 | 0 | 存在（低电流时明显） |
| 欧姆损失 | 0 | 存在（隔膜电阻、电极电阻等） |
| 浓差损失 | 0 | 存在（高电流时明显） |
| 能量效率 | 100% | 60-80%（典型值） |

---

## 五、极化曲线有什么用？（工程意义）

| 应用场景 | 作用 |
|:---|:---|
| **电解槽设计** | 优化电极材料、隔膜厚度、催化剂负载量 |
| **运行控制** | 确定最佳工作电流密度（兼顾产氢速率和能耗） |
| **故障诊断** | 通过曲线变化判断问题：<br>• 欧姆区斜率增大 → 隔膜干燥或老化<br>• 活化区恶化 → 催化剂 degradation<br>• 极限电流下降 → 传质堵塞 |
| **系统匹配** | 将电解槽的极化曲线与风电/光伏的功率特性相匹配 |
| **制氢量计算** | 根据目标产氢量，确定所需的电压和功率 |

---

## 六、不同类型电解槽的极化曲线对比

| 电解槽类型 | 在 1 A/cm² 时的典型电压 | 欧姆区斜率特征 |
|:---|:---:|:---|
| **碱性电解槽** | 1.8-2.0 V | 中等（电解液电阻较高） |
| **PEM 电解槽** | 1.7-1.9 V | 较小（隔膜薄，电阻低） |
| **AEM 电解槽** | 1.8-2.1 V | 中等（新兴技术，仍在优化） |

---

## 七、如何测量极化曲线？

两种常用方法：

| 方法 | 做法 | 特点 |
|:---|:---|:---|
| **恒流法** | 逐级施加电流（如 0.1、0.2、0.5、1.0 A/cm²），测量稳定后的电压 | 最常用，接近实际运行 |
| **恒压法** | 逐级施加电压，测量电流 | 适用于快速扫描 |
| **EIS（电化学阻抗谱）** | 叠加小幅度交流信号，分离活化、欧姆、浓差贡献 | 可深入分析各部分的损失 |

---

一个可用的测试规则

国际常见套路是：

---

## 阶段1：baseline

- 初始极化曲线（IV）
- EIS测试

---

## 阶段2：稳定运行

- 固定电流密度（比如1–2 A/cm²）
- 连续运行1000h+

---

## 阶段3：周期检查（每500h）

- 极化曲线
- 气体纯度
- 电压分布

---

## 阶段4：动态测试（可选）

- load cycling（20–100%）

---

## 输出指标：

- 电压衰减率（μV/h）
- efficiency loss
- failure mode