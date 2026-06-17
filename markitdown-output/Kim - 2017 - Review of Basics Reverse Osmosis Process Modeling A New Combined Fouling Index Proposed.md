Review of Basics Reverse Osmosis Process Modeling: A new 7
1
combined fouling index proposed
0
2
-
8
Albert S. Kim
2
Civil and Environmental Engineering, University of Hawaii at Manoa, Honolulu, Hawaii 968-22,
8
USA
0
,
l
a
n
Abstract r
u
Seawater desalination is currently considered to be one of thoe primary technologies
J
to resolve the global water scarcity problem. A basic understanding of membrane
(cid:28)ltration phenomena is signi(cid:28)cant not only for further teechnological development but
n
also for integrated design, optimal control, and long-term maintenance. In this vein,
a
the present work reviews the major transport and (cid:28)ltration models, speci(cid:28)cally re-
r
lated to reverse osmosis phenomena, provides tbheoretical insights based on statistical
m
mechanics, and discusses model-based physical meanings as related to their practical
implications. e
M
Keywords: Reverse Osmosis; Concentration Polarization; Solution-di(cid:27)usion model;
combined fouling index (CFI); Modi(cid:28)ed Fouling Index (MF); Membrane Process
n
Modeling i
d
e
1. Introduction t
p
The (cid:28)rst commeercial reverse osmosis (RO) membrane was developed by two re-
c
searchers, Loeb and Sourirajan in early 1960 in the Department of Engineering, Uni-
c
versity of Caliafornia, Los Angeles (UCLA). After the pioneering work, RO technology
has been rapidly developed and widely applied in a variety of separation and (cid:28)ltration
,
m
(cid:28)elds, especially for seawater desalination. Fig. 1(a) shows original photo images of
thepriototypedesalinationcellusingfabricatedcelluloseacetatemembranes[1]. Their
K
project entitled (cid:16)Sea Water Demineralization by Means of Semipermeable Membrane(cid:17)
.was carried out under the sponsorship of the Statewide Water Resources Center pro-
S
gram in Sea Water Conservation Research. S. Loeb and S. Sourirajan were listed as
tproject leaders, and the other four personnel include Lloyd Graham, A. Noeggerath,
r
e R. Sayano, and M. Accomazzo. The report was signed by Prof. J. M. English, vice-
b chairman of research, in the Department of Engineering, UCLA. Fig. 1(b) shows the
l
(cid:16)life test assembly(cid:17) which contains the desalination cell and circulating and pressuriz-
A
ing pumps. The life test indicates the (cid:28)ltration experiment, which operated 24 hours
per day for two months. The feed solution was 5.25 percent of seawater (generated
within the system), and the applied pressure was 1500 psi (=103.4 bar). During the
Preprint submitted to Membrane Journal August 28, 2017

(cid:28)rst seven days (period 1) from the fall of 1959, water (cid:29)ux and permeate concentra- 7
2 2 1
tion were measured as 6.4 gal/ft day (=10.87 liter/m h, LMH) and 0.042 percent.
0
From the second to the fourth week (period 2), water (cid:29)ux decreased from 5.6 to 5.2
2
6.4 gal/ft 2 day and the permeate concentration remained as 0.040± 0.003 percent. -
8
In period 1 and 2, the rejection ratios were calculated as 99.20 and 99.24 percent,
2
2
respectively. In period 3 of four weeks, the average (cid:29)ux was 4.75 gal/ft day w-ith
8
98.97 percent of rejection. Finally, the total cost was estimated as $0.60 per 1,000
0
3
gallons, i.e., $0.16/m , which is cheaper than the present water production rate by
‡ ‡ ,
Sorek plant, in Israel, currently producing 624,000 m /day (26,000 m /lhour) [2]. In
a
the 1960 report, Loeb and Sourirajan’s future work includes standardization of (cid:28)lm-
n
fabricating techniques, fabrication cost estimation, and investigation of separation
r
mechanisms, which have been vigorously conducted by subseuquent researchers till
o
date. The fabricated membrane is later explicitly called Loeb-Sourirajan membrane,
J
and the more detailed story can be found elsewhere [3, 4].
e
Various mechanisms and models were suggested to explain the RO phenomena.
n
The sieving mechanism [5] indicates that the separation occurs because of the di(cid:27)er-
a
ence between molecular sizes of solvent and solurtes. The wetted-surface mechanism
b
[6, 7] treats the membrane as very wettable material so that water tends to cling to
m
the membrane surface. The solution-di(cid:27)usion model [8, 9] followed by the solution-
di(cid:27)usion-imperfection model [10] assumees that both solvent and solutes dissolve in
M
the homogeneous nonporous surface layer of the membrane and then di(cid:27)use with-
out signi(cid:28)cant solvent-solute interactions. The preferential sorption & capillary (cid:29)ow
n
mechanism [5, 11, 12] proposes a critical pore size, twice (or smaller than) the water
i
layer thickness on the membrane surface, to allow only solvent transport through
d
the membrane. Among these models for RO processes, the solution-di(cid:27)usion model
e
was most widely acceptetd for explanation and prediction. Transport of solvent and
p
solutes was universally explained using the transmembrane chemical potential and
e
transition from thce solution-di(cid:27)usion to the pore (cid:29)ow was investigated [13]. Later,
c
the solution-di(cid:27)usion model was reformulated as a pressure-driven di(cid:27)usion process
a
using rigorous thermodynamic boundary conditions, which led to nonlinear responses
,
at high pressure and the coupling between solvent and solutes was considered using
m
the Maxwell-Stefan formulation for multi-component di(cid:27)usion [14].
i
KAlthough the models as mentioned earlier were used to fundamentally explain the
RO phenomena, they mostly dealt with speci(cid:28)c mass transport mechanisms across
.
Sthe polymer membrane, of which thermodynamic state is assumed to be quite close
to the pure static equilibrium. To the best of my knowledge, non-equilibrium ther-
t
r modynamics is still at a nascent stage in theoretical statistical physics. The front-end
e
improvement is a theory to investigate the thermoelectric phenomena, such as trans-
b
ference phenomena in electrolytes and heat conduction in an anisotropic medium,
l
A
viewed as coupled, irreversible phenomena [15, 16]. A thermodynamic system was
relaxed from the pure equilibrium to one where the microscopic reversibility could be
assumed. This means that an irreversible system of non-equilibrium can be viewed
2

as a collection of a number of small local subregions, having individual processes, in 7
1
which the time-reversal is guaranteed. The time-reversal indicates that an evolving
0
system from its initial condition returns to the initial state if time t is reversed to −t.
2
In other words, an average rate of an individual process is equal to the average rate -
8
of its reverse process. In his work, Onsager described the irreversible process using
2
the entropy change rate. A phenomenological driving force was de(cid:28)ned as a pa-rtial
8
derivative of the entropy with respect to speci(cid:28)c (cid:29)uxes (of multi-species or heat).
0
The (cid:28)rst irreversible transport (IRT) model was developed to explain the transfer
,
of non-electrolytes through membranes by applying Onsager’s reciprocall theorem to
a
the membrane separations by Kedem and Katchalsky [17], followed by Spiegler and
n
Kedem[18]. Theseirreversibletransportmodelsrequireempiricallydeterminingafew
r
model parameters, which is a practical trade-o(cid:27) to use more reualistic models. Most
o
membrane systems are thermodynamically open to the ambient environment. If one
J
of the systems is in a thermodynamic state that is quite close to a static equilibrium,
e
then the irreversible model parameters often converge to those of limiting values
n
of the pure equilibrium. In this case, irreversible thermodynamic (cid:28)ltration models
a
become mathematically identical to the solution-dri(cid:27)usion model regarding functional
b
interdependences between the solvent and solute (cid:29)uxes and their relationship with
m
the e(cid:27)ective driving force.
More rigorous theoretical investigationeof RO processes using the non-equilibrium
M
thermodynamicsorsimplysteady-statethermodynamicsisnecessarytodevelopnext-
generation membrane technology. Currently, there are a number of excellent articles
n
that provide well summarized technical information and future perspectives of RO
i
technology [19(cid:21)27]. Continuing in this vein, the current work will deal with in-depth
d
and detailed analysis of the solution-di(cid:27)usion model in various aspects as applied to
e
processsimulationswithtalimitedliteraturereviewandprovidetheoreticalderivations
p
for the fouling phenomena on the RO membrane. Fundamental studies and reviews
e
on the future memcbrane technologies in various aspects can be found elsewhere [28(cid:21)
c
32]. This paper aims to provide a clear picture of the RO membrane as a platform of
a
coupled thermo- and (cid:29)uid dynamic phenomena and contribute to a solid curriculum
,
for membrane engineering.
m
i
K
2. Theory and Simulation Review
.2.1. Basic RO process modeling
S
2.1.1. Mass balance equations
t
r Fig. 2 shows the RO schematic, consisting of ten thermodynamic and (cid:29)uid dy-
e
namicvariables. Hydraulicpressure∆P isappliedtothefeedstreamofconcentration
b
l C f and results in feed (cid:29)ow rate Q f . A portion of the feed stream passes through the
A
RO membrane characterized by solvent permeability A, solute permeability B, and
surface area A . This product stream is called permeate stream having concentra-
m
tion C (usually much lower than C ) and out(cid:29)ow rate Q . The concentrate (often
p f p
3

|     |     |     |     |     |     | C   |     | C   |     |     | 7   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
called retentate) stream has concentration c (higher than f due to the solvent
1
permeation) (cid:29)owing with its out(cid:29)ow rate Q . The study objective of this basic RO
c
0
modeling is to calculate output concentrations and (cid:29)ow rates in terms of input and
2
operating conditions. Here we de(cid:28)ne two representative parameters used to evaluate -
8
the performance of RO membranes: rejection ratio (which we will later call observed
2
|     | rejection) |     |     |     |     |     |     |     |     | -   |     |
| --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |            |     |     |     |     | C   |     |     |     | 8   |     |
p
|     |     |     |     |     | R   | = 1− |     |     | 0(1) |     |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | --- | ---- | --- | --- |
C
f
,
|     | and | recovery | ratio |     |     |     |     |     | l   |     |     |
| --- | --- | -------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
a
Q
p
|     |     |     |     |     |     | Y = |     | n   |     | (2) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | Q   |     | r   |     |     |     |
f
u
which express the quality and quantity of the solvent product, respectively.
o
For both solvent and solute mass transport, the inputJrate is equal to a sum of
|     | two | output | rates: |     |     |     |     |     |     |     |     |
| --- | --- | ------ | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
e
n
|     |     |     |     |     | Q   | = Q +Q |     |     |     | (3) |     |
| --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
|     |     |     |     |     | f   | p      | c   |     |     |     |     |
a
|     |     |     |     | C   | Q   | = C Q | +rC Q |     |     | (4) |     |
| --- | --- | --- | --- | --- | --- | ----- | ----- | --- | --- | --- | --- |
|     |     |     |     |     | f f | p     | p c c |     |     |     |     |
b
Solvent (cid:29)ux [m/sec], i.e., the collected volumme of water transported through the mem-
brane per unit time per unit membrane surface area, is described as
e
M
Q
p
|     |     |     |     | J   | =   | = A(∆P | −∆π) |     |     | (5) |     |
| --- | --- | --- | --- | --- | --- | ------ | ---- | --- | --- | --- | --- |
w A
nm
where ∆π = π − π is the osmiotic pressure di(cid:27)erence between the feed (π ) and
|     |     |     | f p |     |     |     |     |     |     | f   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
the permeate (π ) streams.dSolute (cid:29)ux, i.e., the solvent (cid:29)ux multiplied by permeate
p
|     | concentration |     | [mg/l·m/sece] | is expressed |     | as  |     |     |     |     |     |
| --- | ------------- | --- | ------------- | ------------ | --- | --- | --- | --- | --- | --- | --- |
t
p
|     |     |     |     |     | J = | B (C −C | )   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- |
|     |     |     |     |     | s   | f       | p   |     |     | (6) |     |
e
|     |     |     | c   |     | =   | C J |     |     |     | (7) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | p w |     |     |     |     |     |
c
a
Substituting Eq. (2) in (4) allows us to express the retentate concentration using feed
|     | and | permea,te | concentrations | and | recovery | ratio: |     |     |     |     |     |
| --- | --- | --------- | -------------- | --- | -------- | ------ | --- | --- | --- | --- | --- |
m
|     |     |          |               |     |         | C −C         | Y   |     |     |     |     |
| --- | --- | -------- | ------------- | --- | ------- | ------------ | --- | --- | --- | --- | --- |
|     |     |          |               |     |         | f            | p   |     |     |     |     |
|     |     | i        |               |     | C       | =            |     |     |     | (8) |     |
|     |     | K        |               |     | c       | 1−Y          |     |     |     |     |     |
|     | The | permeate | concentration | of  | Eq. (7) | is rewritten | as  |     |     |     |     |
.
S
|     |     |     |     |     | J   |     | C        |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- |
|     |     |     |     |     | s   |     | f        |     |     |     |     |
| t   |     |     |     | C   | =   | =   |          |     |     | (9) |     |
|     |     |     |     | p   | J   | A   |          |     |     |     |     |
| r   |     |     |     |     | w   | 1+  | (∆P −∆π) |     |     |     |     |
B
e
b and (cid:29)ow rates of the permeate and retentate streams are then represented using Q
f
l
|     | and | Y:  |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
A
|     |     |     |     |     | Q   | = Q Y |     |     |     | (10) |     |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ---- | --- |
p f
|     |     |     |     |     | Q   | = Q (1−Y) |     |     |     | (11) |     |
| --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- | ---- | --- |
c f
4

7
Note that we initially had total ten variables (shown in Fig. (2)), of which subset
1
consists of six knowns: {∆P,A,B,A ,C ,Q }. The four balance equations (3)(cid:21)(8)
|     |     |     |     |     |     | m   | f f |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
of solvent and solute transfer rates make the RO process modeling mathematically
2
|     | solvable. |     |     |     |     |     |     |     |     |     |     | -   |
| --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
8
2
|     | 2.1.2. | Analytic | solutions |     | with | van’t Ho(cid:27)-type |     | osmotic | pressure |     |     |     |
| --- | ------ | -------- | --------- | --- | ---- | --------------------- | --- | ------- | -------- | --- | --- | --- |
-
8
If the osmotic pressure is linearly proportional to the solute concentration, then
0
|     | its transmembrane |     |     | di(cid:27)erence |     | is  |     |     |     |     |     |     |
| --- | ----------------- | --- | --- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- |
,
l
|     |     |     |     |     |     | ∆π = | b (C | −C ) |     |     | a   | (12) |
| --- | --- | --- | --- | --- | --- | ---- | ---- | ---- | --- | --- | --- | ---- |
f p
n
where b is a proportionality. In van’t Ho(cid:27)’s equation, we have br= RT, where R is
u
the gas constant and T is the absolute temperature of the membrane system. (J. H.
o
van’t Ho(cid:27) was recognized by the Nobel Prize committee forJhis discovery of (cid:16)the laws
of chemical dynamics and osmotic pressure in solutions(cid:17) and received the (cid:28)rst Nobel
e
|     | Prize | in Chemistry |     | in 1901.) |     | Substitution | of  | (12) intno | (9) | gives |     |     |
| --- | ----- | ------------ | --- | --------- | --- | ------------ | --- | ---------- | --- | ----- | --- | --- |
a
|     |     |     |     |     |     | (cid:104)(cid:113) |     |     | (cid:105) |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------------ | --- | --- | --------- | --- | --- | --- |
1+C2/Cr2
|     |     |     |     |     | C   | = C |     |     | −1  |     |     | (13) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     |     |     | p α |     | βbα |     |     |     |      |
m
where
|     |     |     |     |     |     | BA−1e+∆P |     | −bC |     |     |     |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- |
f
|     |     |     |     |     |     | C = M |     |     |     |     |     | (14) |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | ---- |
α
2b
and
|     |     |     |     |     |     | n   | (cid:114) |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- |
BC
|     |     |     |     |     |     | iC  |     | f   |     |     |     |      |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     |     |     |     | =   |     |     |     |     | (15) |
β
|     |     |     |     |     | d   |     | Ab  |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Note that C and C havee a unit of solute concentration. For simplicity, let’s set
|     |     |     | α   | β   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
t
ψ = C /C . If ψ (cid:28) 1 p, then one can approximate the terms in the parenthesis of Eq.
β α
|     | (13) | using the | Tayloer | expansion |     | as  |     |     |     |     |     |     |
| --- | ---- | --------- | ------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
c
|     |     |           | c      |      | (cid:20) |           |     | (cid:21)        |      |      | (cid:18) (cid:19)2 |      |
| --- | --- | --------- | ------ | ---- | -------- | --------- | --- | --------------- | ---- | ---- | ------------------ | ---- |
|     |     | (cid:112) |        |      |          | 1         |     | (cid:0) (cid:1) |      | 1    | 1 C                |      |
|     |     |           | 1a+ ψ2 | −1 = | 1+       | ψ2 +···+O |     | ψ4              | −1 ≈ | ψ2 = | β                  | (16) |
|     |     |           |        |      |          | 2         |     |                 |      | 2    | 2 C                |      |
α
,
m
where O(ψ4) indicates the remaining terms of ψ4 and higher, and simplify the func-
i
|     | tioKnal | form | of C as |     |     |     |     |     |     |     |     |     |
| --- | ------- | ---- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
p
C2
C
|     |     |     |     |     | C   | ≈ β = |      | f   |     |     |     |      |
| --- | --- | --- | --- | --- | --- | ----- | ---- | --- | --- | --- | --- | ---- |
|     | .   |     |     |     | p   |       |      |     |     |     |     | (17) |
|     | S   |     |     |     |     | 2C    | 1+ A | (∆P | −π  | )   |     |      |
|     |     |     |     |     |     | α     |      |     | f   |     |     |      |
B
twhich is equivalent to Eq. (9) with a condition of C (cid:28) C , and hence indicating
|     |     |     |     |     |     |     |     |     | p   | f   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
r
∆π ≈ π . However, note that Eq. (9) is only an implicit solution for C , because ∆π
| e   |     | f   |     |     |     |     |     |     |     |     | p   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
b includes C itself. For an accurate calculation, C of Eq. (17) needs to be used to
|     |     | p   |     |     |     |     |     | p   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
l
calculate ∆π in Eq. (12). An iterative method should continue until C in Eq. (9)
| A   |     |     |     |     |     |     |     |     |     |     | p   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
convergestoaspeci(cid:28)cconstantvalue. TheaccuratecalculationofC isimportantnot
p
only for RO but also for NF, in which C is comparable with C . In this case, higher-
|     |     |     |     |     |     |     | p   |     |     | f   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
order terms in Eq. (16) must be important for such low-rejection (cid:28)ltration processes,
5

|     |     |     |     |     |     |     |     | C (cid:28) C |     |     | 7   |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- | --- |
in which the straightforward approximation of p f in RO is questionable. As
1
the exact solution of Eq. (13) has a perfect closure form, calculations of C , Q (or
c p
0
J ), and Q are straightforward using C of Eq. (13) without any approximation or
| w         |     | c           |     |     |     |     | p   |     |     |     | 2   |
| --------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| numerical |     | iterations. |     |     |     |     |     |     |     |     | -   |
8
2
| 2.1.3. | Causes |     | and e(cid:27)ects |     |     |     |     |     |     |     |     |
| ------ | ------ | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- | --- |
-
|     |     |     |     |     |     |     | C Q | C   |     | 8   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Fig. 3 shows how output variables p , p and c change with respect to input
0
variables of ∆P, Q and C , while A, B and A are assumed to be invariant during
|     |     |     | f   |     | f   |     |     | m   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
operations. Calculation of Q is straightforward using the solvent ma,ss balance.
|     |     |     |     |     | c   |     |     |     | l   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
a
While one of the three input variables changes with the other two remaining (cid:28)xed,
n
variations of output variables with respect to the solely changing input variable are
r
analyzedasfollowsusingEqs. (8)(cid:21)(10). Fundamentalaspectsofuthesolution-di(cid:27)usion
o
| model | will | be  | discussed | in  | the later | sections. |     |     |     |     |     |
| ----- | ---- | --- | --------- | --- | --------- | --------- | --- | --- | --- | --- | --- |
J
|     |     |     | ∆P. |     |     | C   |     | Q   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
E(cid:27)ect of pressure First, we let f and f remain e constant and increase only
appliedpressure∆P. Thistypeofanalysisismathemnaticallyequivalenttocalculating
| partial |     | derivatives | of  | C , Q | and | C with | respect | tao ∆P. |     |     |     |
| ------- | --- | ----------- | --- | ----- | --- | ------ | ------- | ------- | --- | --- | --- |
|         |     |             |     | p     | p   | c      |         |         |     |     |     |
r
b
(a) In most RO cases of a high rejection ratio close to 1.0, B (cid:28) J must be a good
|     |     |     |     |     |     |     | m   |     | w   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
approximation in RO processes. (Note that B and J have the same unit of
w
e
velocity [m/s].) As J is proportio nal to ∆P, the permeate concentration C
|     |     |     |               |     | w        | M   |     |     |     |     | p   |
| --- | --- | --- | ------------- | --- | -------- | --- | --- | --- | --- | --- | --- |
|     | of  | Eq. | (9) decreases |     | with ∆P: |     |     |     |     |     |     |
|     |     |     |               |     | C        | n1  |     | B/A |     |     |     |
p
|     |     |     |     |     | i=  |     |     | ≈        |     | (18) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | ---- | --- |
|     |     |     |     |     | C   | 1+J | /B  | (∆P −∆π) |     |      |     |
|     |     |     |     |     | df  |     | w   |          |     |      |     |
If concentration polarization e is negligible above the membrane surface, one can
t
approximate ∆πp≈ π , C (cid:28) C , and hence C ∝ 1/∆P. One may apply a
|     |     |     |     |     | f p |     | f   | p   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
higher pressuree to decrease the permeate concentration C , to be obtained by
p
c
increasing water (cid:29)ux J through the membrane. If the feed concentration is
|     |     |     | c   |     | w   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
close toathe seawater concentration having the osmotic pressure about 400 (cid:21) 500
psi, then a decrease in C with respect to ∆P is not as much as that of brackish
|     |     | ,   |     |     | p   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | m   |     |     |     |     |     |     | ∆P, |     |     |     |
w ater of a few thousand mg/l. As one increases the enhanced pressure
piushes more water to the membrane to have a higher permeate (cid:29)ux, J . In this
w
K
case, the convective solute transport (roughly equal to C J ) increases at the
f w
membrane surface. As the membrane rejects solute ions , C increases from
| .   |     |     |     |     |     |     |     |     | m   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
S
C , providing a higher osmotic pressure di(cid:27)erence between the feed side and the
f
t permeate side of membrane surface, i.e., ∆π (= π −π ) > ∆π (= π −π ).
|     |     |     |     |     |     |     |     | m m | p f | f p |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
r
The increase in ∆π is a partial feedback from increased ∆P, so that a decrease
e m
b in C is lessened by the C phenomena, which is fundamentally inevitable.
|     |     | p   |     |     | p   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
l
(b) The permeate (cid:29)ow rate is conceptually equivalent to the permeate (cid:29)ux, because
A
the available membrane surface area A is usually (cid:28)xed. (See Eq. (5).) This
m
indicates that the variation of Q with respect to ∆P is the same as that of
p
|     | J   |     |     |     |     |     |     | ∆π  | ∆P, | J   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
w . Here, we assume for simplicity that is insensitive to and w is not
6

|     |     |     |     | ∆P  | ≤   | ∆π. |     |     |     |     |     |     | Q   |     | 7   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
meaningful for As indicated in Fig. 3(b), the onset of non-zero p
1
occurs when ∆P exceeds ∆π. After that, Q monotonously increases with ∆P
p
0
and the slope is equal to A·A from Eq. (5). In reality, measured Q resides
|     |     |     |     |     |     |     | m   |     |     |     |     | p   |     | 2   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
below the linear line, because the C increases the osmotic pressure di(cid:27)erence -
p
8
and therefore decreases the e(cid:27)ective pressure, ∆P = ∆P −∆π .
|     |     |     |     |     |     |     |     |     |     | eff |     | m   | 2   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(c) As C decreases with respect to ∆P, more solutes are rejected by the m-em-
p
8
brane. Overall, the amount of solutes retained per unit volume, i.e., retentate
0
concentration C , increases with ∆P. For high rejection of C (cid:28) C , we can
|     |     |     |     | c   |     |     |     |     |     |     |     | p f |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
,
|     |     | neglect | C   | Y = C | (1−R)Y |     | in the | numerator |     | of Eq. 8: |     | l   |     |     |     |
| --- | --- | ------- | --- | ----- | ------ | --- | ------ | --------- | --- | --------- | --- | --- | --- | --- | --- |
|     |     |         | p   |       | f      |     |        |           |     |           |     | a   |     |     |     |
n
C
|     |     |     |     |     |     |     |     | C ≈ | f   |     | r   |     | (19) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- |
c
|     |     |     |     |     |     |     |     |     | 1−Y |     | u   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
o
Note that Y is proportional to Q ∝ J ∝ ∆P .JC is therefore linearly
|     |     |     |     |     |     |     |     | p   | w   | eff | c   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
proportional to ∆P if and only if the recovery ratio is small (i.e., Y (cid:28) 1). To
e
|     |     | validate | this, | one | can | use Taylor’s |     | series | of C | wnith respect | to  | Y:  |     |     |     |
| --- | --- | -------- | ----- | --- | --- | ------------ | --- | ------ | ---- | ------------- | --- | --- | --- | --- | --- |
c
a
|     |     |     |     |     |     |     |     | (cid:0) |     | (cid:0) (cid:1)(cid:1) |     |     |      |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | ---------------------- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     | C   | ≈ C | 1+Y     | +rO | Y2                     |     |     | (20) |     |     |
|     |     |     |     |     |     |     | c   | f       |     |                        |     |     |      |     |     |
b
m
Otherwise, the higher-order terms become signi(cid:28)cant and C must non-linearly
c
|     |     | increase | with | ∆P. |     |     |     | e   |     |     |     |     |     |     |     |
| --- | --- | -------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
M
|     | E(cid:27)ect | of feed | (cid:29)ow | rate | Q . |     |     |     |     |     |     |     |     |     |     |
| --- | ------------ | ------- | ---------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
f
n
(d) The feed (cid:29)ow rate Q usually does not signi(cid:28)cantly change the characteristics of
|     |     |     |     |     | f   | i   |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
the permeate stream, unless ∆P depends on Q . The permeate concentration
|     |     |                       |     |     | d   |      |     |     |     | f   |     |     |     |     |     |
| --- | --- | --------------------- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | is pseudo-independent |     |     |     | of Q | .   |     |     |     |     |     |     |     |     |
ef
(e) In the same vein,tthe permeate (cid:29)ow rate is indi(cid:27)erent to the feed (cid:29)ow rate
p
because Q primarily depends on the applied pressure ∆P. The amount of
p e
water that pcasses in the longitudinal direction (tangentially to the membrane
c
surface) in the feed stream does not noticeably change the permeate (cid:29)ux J or
|     |     |     | a   |     |     |     |     |     |     |     |     |     | w   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Q
|     |     | permeate |     | (cid:29)ow rate | p   | .   |     |     |     |     |     |     |     |     |     |
| --- | --- | -------- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
,
(f) Bmecause Q = Q +Q , for a constant Q , Q increases with Q . Eq. (19) can
|     |     |         |           | f   | p   | c   |     |     | p c |     |     | f   |     |     |     |
| --- | --- | ------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | be then | rewritten |     | as  |     |     |     |     |     |     |     |     |     |     |
i
K
|     |     |         |     |           |           |     |      |       | (cid:18) | (cid:19) |     |     |      |     |     |
| --- | --- | ------- | --- | --------- | --------- | --- | ---- | ----- | -------- | -------- | --- | --- | ---- | --- | --- |
|     |     |         |     |           |           |     | Q    |       |          | Q        |     |     |      |     |     |
|     |     |         |     |           |           | C = | C    | f = C | 1+       | p        |     |     |      |     |     |
|     |     |         |     |           |           | c   | f    | f     |          |          |     |     | (21) |     |     |
|     | .   |         |     |           |           |     | Q    |       |          | Q −Q     |     |     |      |     |     |
|     | S   |         |     |           |           |     |      | c     |          | f p      |     |     |      |     |     |
| t   |     | to show | C   | gradually | decreases |     | with | Q     | or Q     |          |     |     |      |     |     |
|     |     |         |     | c         |           |     |      | c     | f        |          |     |     |      |     |     |
r
e
|     | E(cid:27)ect | of feed | concentration |     |     | C . |     |     |     |     |     |     |     |     |     |
| --- | ------------ | ------- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| b   |              |         |               |     |     | f   |     |     |     |     |     |     |     |     |     |
l
(g) When the applied pressure is much higher than the feed osmotic pressure, C is
A p
linearly proportional to C ; in other words, C /C = constant. When the feed
|     |     |     |     |     |     | f   |     |     |     | p f |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
applied pressure is comparable with the osmotic pressure, C versus C curve
|     |     |     |     |     |     |     |     |     |     |     | p   |     | f   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
shows a non-linearly increasing trend, which is above the linear line. Eq. 9
7

|     |     |     |     |     |     | C   |     |     |     | ∆π  |     | C   |     | 7   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
indicates that the increase in f secondarily contributes to m , increases m ,
1
and (cid:28)nally reduces ∆P and J . As a consequence, the solvent and solute
|     |     |     |     | eff |     | w   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
(cid:29)uxes decrease and increase, respectively, with respect to C , and therefore the
|     |          |               |     |            |     |     |     |     |     | f   |     |     | 2   |     |
| --- | -------- | ------------- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | permeate | concentration |     | increases. |     |     |     |     |     |     |     |     | -   |     |
8
(h) When ∆P and Q are (cid:28)xed, Q linearly decreases with respect to the feed
|     |                |     |     | f   |     | p   |     |     |     |     |     | 2   |     |     |
| --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | concentration: |     |     |     |     |     |     |     |     |     |     | -   |     |     |
8
0
|     |     |     | Q   | = A | J ∝ | ∆P −∆π | = ∆P | +bC | −bC |     |     | (22) |     |     |
| --- | --- | --- | --- | --- | --- | ------ | ---- | --- | --- | --- | --- | ---- | --- | --- |
|     |     |     |     | p m | w   |        | m    |     | p   | m   |     |      |     |     |
,
l
a
|     | The | permeate | (cid:29)ow | rate vanishes |     | when | π = ∆P | +π  | ≈ ∆P. |     |     |     |     |     |
| --- | --- | -------- | ---------- | ------------- | --- | ---- | ------ | --- | ----- | --- | --- | --- | --- | --- |
|     |     |          |            |               |     |      | m      |     | p     |     |     |     |     |     |
n
(i) When recovery is small, i.e., Y (cid:28) 1 or Q (cid:28) Q , the retentate concentration
|     |     |     |     |     |     |     | p   | f   |     | r   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C does not change signi(cid:28)cantly from the feed concentratioun level, i.e., C ∼ C .
|     | c   |     |     |     |     |     |     |     |             |     |     | c   | f   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- |
|     | C   |     |     | ∆P  |     |     |     | π   | Yodecreases |     |     | Q   |     |     |
As f increases when is (cid:28)nitely higher than f , because p
monotonously decreases with C . Therefore, the slope J of C versus C plotted
|     |     |     |     |     |     | f   |     |     |     | c   | f   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
from Eq. (8) also decrease with C : 1/(1−Y) ≈e1+Y +Y2+Y3+··· . Note
f
n
that (1−Y)−1 > 1 indicates C is uncondition ally higher than C , except for
|     |     |     |     |     |     | c   |     |     |     |     | f   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
a
|     | the | zero-recovery |     | case. The | slope | of Fig. | 3 can | be calculated |     | as  |     |     |     |     |
| --- | --- | ------------- | --- | --------- | ----- | ------- | ----- | ------------- | --- | --- | --- | --- | --- | --- |
r
b
|     |     |     |     |     | ∂C  |      | m0 1−Y |      |     |     |     |      |     |     |
| --- | --- | --- | --- | --- | --- | ---- | ------ | ---- | --- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     | c =  |        |      |     |     |     | (23) |     |     |
|     |     |     |     |     | ∂C  | [1−Y | +Y     | C ]2 |     |     |     |      |     |     |
|     |     |     |     |     |     | f e0 | 1      | f    |     |     |     |      |     |     |
M
where Y = A A∆P/Q and Y = A Ab/Q . Using parameter values in Fig. 3
|     |     | 0   | m   | f   |     | 1 m | f   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
gives the Y value higher th an 1.0, which provides a negative value of ∂ Cc, and
|     |     |     | 0   |     | n   |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
∂ C f
therefore Fig. 3(i) shows tihe gradually decreasing behavior of C with respect
c
|     | to C | .   |     | d   |     |     |     |     |     |     |     |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
f
e
t
| 2.2.   | Concentration |     | Polarization p |     |     |     |     |     |     |     |     |     |     |     |
| ------ | ------------- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2.2.1. | Phenomena     |     | e              |     |     |     |     |     |     |     |     |     |     |     |
c
Fig. 4 shows a schematic of di(cid:27)usive and convective transport of solutes near the
c
membrane suraface. During the RO/NF (cid:28)ltration process, pressurized feed stream of
concentration C (cid:29)ows in a tangential (x-) direction to the membrane with velocity u.
,f
m
Solutesarerejectedbythemembrane, whereassolvent(water)moleculespassthrough
the miembrane. The permeate concentration C is therefore much lower than the feed
|     | K   |     |     |     |     |     | p   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C
concentration f in proper operations. The hydraulic pressure gradient between the
.bulk and permeate stream generates the solvent (cid:29)ow across the membrane, which
S
is de(cid:28)ned as the permeate (cid:29)ux J , i.e., the volume of solvent passing through the
w
tmembrane per unit membrane surface area: a unit of J is [m 3 /m 2 s], equivalent to
w
r
[m/s] or [µm/s]. As the transverse solvent (cid:29)ow brings solutes down to the membrane
e
b surface, solutes are retained on the membrane surface where concentration C is
m
l
higher than C . This phenomenon of the uneven or biased concentration distribution
A f
near the membrane surface is called the concentration polarization (CP), and the
region where the CP occurs is called the CP layer. δ denotes the thickness of the
p
C
| CP  | layer above | which | the | concentration |     | remains | f . |     |     |     |     |     |     |     |
| --- | ----------- | ----- | --- | ------------- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
8

7
|     | 2.2.2. Mass | balance |     |     |     |     |     |     |     |
| --- | ----------- | ------- | --- | --- | --- | --- | --- | --- | --- |
1
Solutes are transported from the bulk phase toward the membrane by two mass
0
transfer mechanisms, i.e., convection and di(cid:27)usion, which are balanced as 2
-
|     |     |     |     |     |       | (cid:18) | ∂C (cid:19) |       | 8     |
| --- | --- | --- | --- | --- | ----- | -------- | ----------- | ----- | ----- |
|     |     |     |     |     | J C − | −D       |             | = J C | (224) |
|     |     |     |     |     | w     |          |             | w p   |       |
|     |     |     |     |     |       |          | ∂y          |       | -     |
8
|     | J   | C   |     |     |     |     |     | tow0ard |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- |
Here, w is the convective transport of solutes from the bulk phase the
membrane. Within the concentration polarization layer, 0 < y < δ ,,the solute
p
l
concentrationC(y)decreaseswithrespecttoy sothat−D∂C ispositivaeandindicates
∂y
the magnitude of di(cid:27)usive transport of solutes from the membrane surface n to the bulk
r
|     | phase. Therefore, |     | speci(cid:28)c | boundary |     | conditions |     | are: |     |
| --- | ----------------- | --- | -------------- | -------- | --- | ---------- | --- | ---- | --- |
u
o
|     |     |     |     |     | C(y | =   | 0) = | C   | (25) |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | ---- |
m J
|     |     |     |     |     | C(y | =   | δ ) = | C e | (26) |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | ---- |
|     |     |     |     |     |     |     | p     | f   |      |
n
The CP layer of thickness δ is usually much smalaler than the channel height of the
p
r
feed (cid:29)ow. Within the CP layer, it is appropriate to approximate that the permeate
b
(cid:29)ux J is constant with respect to y andmthe concentration is independent of the
w
axial position x of the membrane surface. Then, the partial derivative of ∂C/∂y in
e
Eq. (24) becomes its ordinary di(cid:27)ereMntial, i.e., dC/dy. Integration of Eq. (24) with
respect to y using boundary conditions of Eqs. (25) and (26) yields
n
|     |     |     |     |     | C   | −C  |         |     |      |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- | ---- |
|     |     |     |     |     | im  |     | p       |     |      |
|     |     |     |     |     |     |     | = eJw/k | f   | (27) |
|     |     |     |     | dC  |     | −C  |         |     |      |
|     |     |     |     |     |     | f   | p       |     |      |
e
where k = D/δ is the mtass transfer coe(cid:30)cient, indicating how quickly solutes back-
|     | f   |     | p p |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
di(cid:27)use from the membrane to the bulk phase. (See Appendix A.1 for the detailed
e
|     |     |     |     |     | δ   |     | k   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
derivation of Eq.c(27).) Usually, p (or f ) is unknown and often estimated using
empirical correlations, c because a coupled mass transfer equation using varying cross-
a
(cid:29)ow velocity is hard to solve. The right-hand side of Eq. (27) is interpreted as the
ratio of excessive , concentrations at the membrane surface to that of the bulk phase.
m
|     | In RO/NF, | this | ratio is | about | 2(cid:21)3. |     |     |     |     |
| --- | --------- | ---- | -------- | ----- | ----------- | --- | --- | --- | --- |
i
K
|     | 2.2.3. Rejection |     | ratios |     |     |     |     |     |     |
| --- | ---------------- | --- | ------ | --- | --- | --- | --- | --- | --- |
.From Eq. (27), the solute concentration on the membrane surface is rewritten as
S
| t   |     |     |     |     |     |       |       | eJw/k   |      |
| --- | --- | --- | --- | --- | --- | ----- | ----- | ------- | ---- |
|     |     |     |     | C   | =   | C +(C | −C    | ) f     | (28) |
| r   |     |     |     |     | m   | p     | f     | p       |      |
| e   |     |     |     |     | =   | C +C  | R     | eJw/k f | (29) |
|     |     |     |     |     |     | p     | f obs |         |      |
b
l
R
A where obs is the observed rejection ratio, de(cid:28)ned as
C
p
|     |     |     |     |     |     | R = | 1−  |     | (30) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     |     |     | obs |     | C   |      |
f
9

7
which indicates the fraction of solutes retained by the membrane. The permeate
1
|     | concentration |     | can be | calculated |     | using R | :   |     |     |     |     |
| --- | ------------- | --- | ------ | ---------- | --- | ------- | --- | --- | --- | --- | --- |
obs
0
2
|     |     |     |     |     |     | C = C | (1−R | )   |     |     | (31) |
| --- | --- | --- | --- | --- | --- | ----- | ---- | --- | --- | --- | ---- |
|     |     |     |     |     |     | p     | f    | obs |     |     | -    |
8
|     | and now | we can | eliminate |     | C in | Eq. (29) | to  | derive |     |     | 2   |
| --- | ------- | ------ | --------- | --- | ---- | -------- | --- | ------ | --- | --- | --- |
p
-
8
C
|     |     |     |     |     | m   |       | (cid:0) | eJw/k | (cid:1) | 0(32) |     |
| --- | --- | --- | --- | --- | --- | ----- | ------- | ----- | ------- | ----- | --- |
|     |     |     |     |     |     | = 1+R |         | f     | −1      |       |     |
|     |     |     |     |     | C   |       | obs     |       |         |       |     |
f
,
l
a
|     | For the perfect |     | rejection | (R  | =   | 1.0), C | reduces | to  |     |     |     |
| --- | --------------- | --- | --------- | --- | --- | ------- | ------- | --- | --- | --- | --- |
|     |                 |     |           |     | obs |         | m       |     |     |     |     |
n
r
|     |     |     |     |     |     | C = | C eJw/k | f   |     |     | (33) |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- | ---- |
|     |     |     |     |     |     | m   | f       |     | u   |     |      |
o
as a product of C and the exponential factor. In addition to R , the intrinsic
|     |           |                  | f   |     |     |     |     |     | J obs |     |     |
| --- | --------- | ---------------- | --- | --- | --- | --- | --- | --- | ----- | --- | --- |
|     | rejection | is de(cid:28)ned | as  |     |     |     |     |     |       |     |     |
e
C
|     |     |     |     |     |     |      | p   |      | n)  |     |      |
| --- | --- | --- | --- | --- | --- | ---- | --- | ---- | --- | --- | ---- |
|     |     |     |     |     | R   | = 1− |     | (> R |     |     | (34) |
|     |     |     |     |     |     | int  | C   | obs  |     |     |      |
|     |     |     |     |     |     |      | m   | a    |     |     |      |
r
|     | Substitution | of  | Eq. (28) | in  | (34) | derives |     |     |     |     |     |
| --- | ------------ | --- | -------- | --- | ---- | ------- | --- | --- | --- | --- | --- |
b
m
|     |     |     |     | C   |     |        | eJw/k f |        |       |     |      |
| --- | --- | --- | --- | --- | --- | ------ | ------- | ------ | ----- | --- | ---- |
|     |     |     |     | m   | =   |        |         |        | > 1.0 |     |      |
|     |     |     |     |     |     |        | e       |        |       |     | (35) |
|     |     |     |     | C   | R   | + (1−R |         | )eJw/k |       |     |      |
|     |     |     |     | f   |     | int M  |         | int    | f     |     |      |
which requires known values of J , k , and R . In normal RO processes, measured
|     |     |     |     |     |     | w f |     | int |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
n
J is about a few µm/s, k can be estimated using empirical correlations, and R
|     | w   |     |     |     | f i |     |     |     |     |     | int |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
R
is often close to 1.0. If the intrinsic rejection int is close to zero, the right-hand side
d
converges to one. No concentration polarization occurs and the concentration has
e
an even distribution alontg the y-direction, i.e, C (cid:119) C . Similarly, if the membrane
|     |     |     |     |     |     |     |     | m   | f   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
p
resistanceistoohigh(e.g.,almostimpermeablewhendeleteriouslyfouled),thesolvent
e
|     | (cid:29)ux becomes | very | small, | i.e., | J   | → 0. | Hence, | we calculate | that: |     |     |
| --- | ------------------ | ---- | ------ | ----- | --- | ---- | ------ | ------------ | ----- | --- | --- |
|     |                    |      | c      |       | w   |      |        |              |       |     |     |
c
(cid:16) (cid:17)
|     |     | a   |     |     | eJw/k |         |     | Jw  |     |     |      |
| --- | --- | --- | --- | --- | ----- | ------- | --- | --- | --- | --- | ---- |
|     |     |     |     |     |       | f ≈ 1+O |     | ≈   | 1.0 |     | (36) |
k
f
,
|     | or equivmalently |     | C (cid:119) | C . |     |     |     |     |     |     |     |
| --- | ---------------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |                  |     | m           | f   |     |     |     |     |     |     |     |
i
K
|     | 2.3. Solution-di(cid:27)usion |     |           | model |       |           |     |     |     |     |     |
| --- | ----------------------------- | --- | --------- | ----- | ----- | --------- | --- | --- | --- | --- | --- |
|     | 2.3.1. Governing              |     | equations |       | based | on Fick’s | law |     |     |     |     |
.
S
Solvent Transport. We assume that water transport through the normal membranes
tis by di(cid:27)usion through a single phase and write transport equation of water:
r
e
| b   |     |     |     |     |     | J = | −D  | ∇C  |     |     | (37) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     |     |     | w   | w   | w   |     |     |      |
l
A whereC andD areconcentrationanddi(cid:27)usivityofwaterdissolved inthemembrane
w w
[33]. We accept the Henrian approximation that in an isothermal environment
|     |     |     |     |     | µ   | = RT | lnC | +µ   |     |     |      |
| --- | --- | --- | --- | --- | --- | ---- | --- | ---- | --- | --- | ---- |
|     |     |     |     |     |     | w    |     | w wo |     |     | (38) |
10

|     |     | µ   |     |     |     |     |     |     |     | µ   |     |     |     |     | 7   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
where w is the chemical potential of the water and wo is an isothermal constant
1
|     | independent |     | of  | C . | Substitution |     | of  | Eq. (38) | in (37) | gives |     |     |     |     |     |
| --- | ----------- | --- | --- | --- | ------------ | --- | --- | -------- | ------- | ----- | --- | --- | --- | --- | --- |
w
0
2
|     |     |     |     |     |     |     | D   | C   | D C  | ∆µ  |     |     |      |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     |     | w   | w   | w    | w   | w   |     |      | -   |     |
|     |     |     |     |     |     | J = |     | ∇µ  | ≈    |     |     |     | (39) |     |     |
|     |     |     |     |     |     | w   | RT  |     | w RT | δ   |     |     |      | 8   |     |
m
2
-
which represents the solvent (cid:29)ux driven by the chemical potential gradient ∇8µ (cid:126) (cid:39)
w
∆µ /δ , where ∆µ is the chemical potential di(cid:27)erence across the mem0brane of
|     |     | w m |     |     | w   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
thickness δ . In pressure-driven membrane separation processes, the chemical poten-
|     |     |     | m   |     |     |     |     |     |     |     |     | ,   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
l
tial of water may be governed by the applied pressure and water conacentration and
|     | can | be expanded |     | as  |     |     |     |     |     |     |     | n   |     |     |     |
| --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
r
|     |     |     |     |     |     | (cid:18) | ∂µ  | (cid:19) | (cid:18) ∂µ | (cid:19) | u   |     |      |     |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | -------- | ----------- | -------- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     |          | w   |          |             | w        |     |     |      |     |     |
|     |     |     |     |     | dµ  | =        |     | dC       | +           |          | doP |     | (40) |     |     |
|     |     |     |     |     | w   |          |     |          | w           |          |     |     |      |     |     |
|     |     |     |     |     |     |          | ∂C  |          | ∂P          |          |     |     |      |     |     |
|     |     |     |     |     |     |          | w   | P,T      |             | Cw,TJ    |     |     |      |     |     |
e
|     | Integration |     | of  | Eq. | (40) across |     | the membrane |     | gives |     |     |     |     |     |     |
| --- | ----------- | --- | --- | --- | ----------- | --- | ------------ | --- | ----- | --- | --- | --- | --- | --- | --- |
n
|     |     |     |     |     |     | (cid:90) | (cid:18) | (cid:19) | (cid:90)a(cid:18) |     | (cid:19) |     |     |     |     |
| --- | --- | --- | --- | --- | --- | -------- | -------- | -------- | ----------------- | --- | -------- | --- | --- | --- | --- |
|     |     |     |     |     |     |          | ∂µ       |          |                   | ∂µ  |          |     |     |     |     |
|     |     |     |     | ∆µ  | =   |          | w        |          | dC +r             |     | w        | dP  |     |     |     |
|     |     |     |     |     | w   |          |          |          | w                 |     |          |     |     |     |     |
|     |     |     |     |     |     |          | ∂C       |          | b∂P               |     |          |     |     |     |     |
|     |     |     |     |     |     |          |          | w P,T    |                   |     | Cw,T     |     |     |     |     |
m
|     |     |     |     |     |     | (cid:90) | (cid:18) | (cid:19) |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | -------- | -------- | -------- | --- | --- | --- | --- | --- | --- | --- |
∂µ
|     |     |     |     |     | =   |     | w   |     | dC +v¯ | ∆P  |     |     | (41) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     |     |     | ew  | w      |     |     |     |      |     |     |
∂C
wMP,T
If the applied pressure is equal to the osmotic pressure di(cid:27)erence (∆P = ∆π), then
n
mass (cid:29)uxes are zero since the chemical potential has zero gradient. Hence, we obtain
i
|     |     |     |     |     |     | d(cid:90) | (cid:18) | (cid:19) |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --------- | -------- | -------- | --- | --- | --- | --- | --- | --- | --- |
∂µ
|     |     |     |     |     |     |     |     | w   | dC = −v¯ | ∆π  |     |     | (42) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | ---- | --- | --- |
|     |     |     |     |     |     | e   |     |     | w        | w   |     |     |      |     |     |
∂C
|     |     |     |     |     | t   |     |     | w P,T |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
p
|     | and | therefore |     |     | e   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
c
|     |     |     |     |     |     |     | ∆µ  | = v¯ | (∆P −∆π) |     |     |     | (43) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | -------- | --- | --- | --- | ---- | --- | --- |
|     |     |     |     | c   |     |     | w   | w    |          |     |     |     |      |     |     |
¯ a
where V is the molar volume of the solvent. Substitution of Eq. (43) in (39) gives
w
the solvent,(cid:29)ux
m
|     |     |     |     |     |     | D C | v¯  |          |     |      |      |     |      |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | ---- | ---- | --- | ---- | --- | --- |
|     |     |     |     |     | J = | w   | w w | (∆P −∆π) | =   | A(∆P | −∆π) |     | (44) |     |     |
w
|     |     | i   |     |     |     | RTδ |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | K   |     |     |     |     |     | m   |     |     |     |     |     |     |     |     |
where
|     |     |     |     |     |     |     |     | D   | C v¯  |     |     |     |      |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ---- | --- | --- |
|     | .   |     |     |     |     |     |     |     | w w w |     |     |     |      |     |     |
|     | S   |     |     |     |     |     |     | A = |       |     |     |     | (45) |     |     |
RTδ
m
t
iscalledthesolventpermeabilityhavingaunitof[m/s·atm],whichisoftenassumedto
r
e be independent of ∆P. Eq. (44) indicates that the water (cid:29)ux through the membrane
b
is proportional to the e(cid:27)ective pressure, i.e. the ∆P and ∆π. The origin of this
l
| A   | conclusion |     | is from | the | thermodynamic |     |          | relationship: |     |     |     |     |     |     |     |
| --- | ---------- | --- | ------- | --- | ------------- | --- | -------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
|     |            |     |         |     |               |     | (cid:18) | ∂µ (cid:19)   |     |     |     |     |     |     |     |
w
|     |     |     |     |     |     |     |     |     | = v¯ |     |     |     | (46) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- | --- |
w
∂P
Cw,T
11

7
|     |     | or equivalently |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1
|     |     |     |     |     |     | µ = | v¯ ∆P | +f (C ,T) |     |     | (47) |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | --------- | --- | --- | ---- | --- |
|     |     |     |     |     |     | w   | w     | w         |     |     |      |     |
0
|     |     |     | f   |     |     |     | C   | T.  |     |     |     | 2   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
where is an arbitrary function of w and Comparison of Eqs. (47) and (40)
-
gives a self-consistent result in terms of speci(cid:28)c dependence of µ on ∆P, C , and8
w w
|     |     | T.  |     |     |     |     |     |     |     |     | 2   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
-
8
Solute Transport. The transmembrane solute di(cid:27)usion is also assumed to be Fickian:
0
D
|     |     |     |     |     |     |      |      | s   |       | ,   |      |     |
| --- | --- | --- | --- | --- | --- | ---- | ---- | --- | ----- | --- | ---- | --- |
|     |     |     |     |     | J   | = −D | ∇C ≈ | ∆C  | = B∆C | l   | (48) |     |
|     |     |     |     |     | s   | s    | s    | s   | s     | a   |      |     |
δ
m
n
where J , D , and C are the mass (cid:29)ux, di(cid:27)usivity, and concentrartion of the solute,
|     |     |     | s   | s s |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
u
respectively, in the membrane. The phenomenological solute transport coe(cid:30)cient can
o
|     |     | be  | de(cid:28)ned | as  |     |     |     |     |     |     |     |     |
| --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |               |     |     |     |     | D   | J   |     |     |     |
s
|     |     |     |     |     |     |     | B = |     |     |     | (49) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |
e
δ
|     |     |     |     |     |     |     |     | m   | n   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
which is called the solute permeability. It is often assumed that D is independent of
|     |     |     |     |     |     |     |     | a   |     | s   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
the solute concentration, but maybe varies with tremperature. In Eq. (48), ∆C indi-
s
b
cates the transmembrane concentration di(cid:27)erence, measured on the exterior surfaces
m
|     |     | of the | membrane. |     |     |     |     |     |     |     |     |     |
| --- | --- | ------ | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
e
M
|     |     | 2.3.2. | Solvent | and solute | (cid:29)uxes |     |     |     |     |     |     |     |
| --- | --- | ------ | ------- | ---------- | ------------ | --- | --- | --- | --- | --- | --- | --- |
The solvent (cid:29)ux J is proportional to the e(cid:27)ective pressure, of which the osmotic
w
n
|     |     | pressure | di(cid:27)erence | can | be more | accurately |     | represented | as: |     |     |     |
| --- | --- | -------- | ---------------- | --- | ------- | ---------- | --- | ----------- | --- | --- | --- | --- |
i
d
|     |     |     |     |     |     |     | ∆π = π | −π  |     |     | (50) |     |
| --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     |     |        | m p |     |     |      |     |
e
t
The van’t Ho(cid:27) equatpion indicates that the (absolute) osmotic pressure is linearly
proportional to theesolute concentration, unless the concentration is too high near
c
the solubility limit. In this case, the solution-di(cid:27)usion model is equivalent to the
c
|     |     | osmotic | pressaure | model | and | then we | have:    |     |          |     |      |     |
| --- | --- | ------- | --------- | ----- | --- | ------- | -------- | --- | -------- | --- | ---- | --- |
|     |     |         |           |       |     |         | (cid:18) |     | (cid:19) |     |      |     |
|     |     |         | ,         |       |     |         |          | C C |          |     |      |     |
|     |     |         | m         |       |     |         |          | m p |          |     |      |     |
|     |     |         |           |       |     | ∆π      | = π      | −   |          |     | (51) |     |
|     |     |         |           |       |     |         | f        | C C |          |     |      |     |
|     |     |         |           |       |     |         |          | f f |          |     |      |     |
i
K
and hence using Eq. 32 we make a relationship between the thermodynamic variable
.∆π and the hydrodynamic variable J through the mass transfer coe(cid:30)cient k.
|     |     | S   |     |     |     |     | w   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
eJw/k
|     | t   |     |     |     |     | ∆π  | = π R | f   |     |     | (52) |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ---- | --- |
f obs
r
e
|     |     | By  | substituting | Eq. (52) | in  | 44, we | obtain |     |     |     |     |     |
| --- | --- | --- | ------------ | -------- | --- | ------ | ------ | --- | --- | --- | --- | --- |
b
l
|     |     |     |     |     |     |       | (cid:0) | eJw/k | (cid:1) |     |      |     |
| --- | --- | --- | --- | --- | --- | ----- | ------- | ----- | ------- | --- | ---- | --- |
| A   |     |     |     |     |     | J = A | ∆P −π   | R     | f       |     | (53) |     |
|     |     |     |     |     |     | w     |         | f obs |         |     |      |     |
whichneedstobesolvediterativelyforJ withanestimatedvalueofk . Phenomeno-
|     |     |     |     |     |     |     | w   |     |     | f   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
logically, the permeate (cid:29)ux increases if the applied pressure increases. The enhanced
12

7
permeate (cid:29)ux contributes additionally to the convective solute transport toward the
1
membrane surface, which brings more solutes on the membrane surface and hence
0
increases C . The osmotic pressure on the membrane surface π therefore increases
|     |     | m   |     |     |     |     |     | m   |     | 2   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
exponentially with J (See Eq. 52). As a consequence, the net pressure, the driving -
w
8
force of the solute permeation, does not increase as much as ∆P increases, because
2
the concentration polarization causes the reduction of the driving force as indic-ated
8
in Eq. 52. Since J is on both sides of Eq. (53), a nonlinear or iterative solver is
|     |     | w   |     |     |     |     |     | 0   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
required to calculate J . If the mass transfer coe(cid:30)cient is larger than the permeate
w
,
(cid:29)ux or l
|     |     |     |     |     |     | (cid:18) (cid:19)2 |            | a   |     |     |
| --- | --- | --- | --- | --- | --- | ------------------ | ---------- | --- | --- | --- |
|     |     |     |     | J   |     | J                  |            |     |     |     |
|     |     |     |     | w   |     | w                  |            |     |     |     |
|     |     |     |     | < 1 | and |                    | (cid:28) 1 | n   |     |     |
|     |     |     |     | k   |     | k                  |            |     |     |     |
|     |     |     |     | f   |     | f                  |            | r   |     |     |
u
|     | then we | can expand | the exponential |     | form in | Eq. 52 | as  |     |     |     |
| --- | ------- | ---------- | --------------- | --- | ------- | ------ | --- | --- | --- | --- |
o
(cid:32) (cid:33)
|     |     |     |     |     |     | J2  | J   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
J
|     |     |     |     | eJw/k f (cid:119) | 1+ w | +O  | w   |     | (54) |     |
| --- | --- | --- | --- | ----------------- | ---- | --- | --- | --- | ---- | --- |
e
|     |     |     |     |     | k   | k2  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | f   |     | nf  |     |     |     |
a
In this case, we derive an analytic expression for the permeate (cid:29)ux:
r
b
|     |     |     |     | J = | A (∆P  | −π R | )   |     | (55) |     |
| --- | --- | --- | --- | --- | ------ | ---- | --- | --- | ---- | --- |
|     |     |     |     | w   | eff mf |      | obs |     |      |     |
|     |     |     | C   |     |        |      |     | A   |      |     |
under the in(cid:29)uence of the p , where theee(cid:27)ective solvent permeability eff is calcu-
|     | lated as |     |     |     | M   |     |     |     |     |     |
| --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
A
|     |     |     |     | A =  |     | (<  | 1)  |     | (56) |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- |
|     |     |     |     | eff  |     | k−1 |     |     |      |     |
|     |     |     |     | n1+π | R   |     |     |     |      |     |
f obs f
i
Eq. (55) explains the solvent permeation giving a di(cid:27)erent picture from that of Eq.
d
(53). π R indicates the osmotic pressure di(cid:27)erence between the feed and permeate
|     | f   | obs |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
e
streams. The e(cid:27)ective stolvent permeability A , which is smaller than A, includes
eff
p
the resistance for solvent permeation from the membrane and the CP layer. When
e
the concentration polarization is negligible and so its thickness is very small, i.e.,
c
δ → 0, then thce mass transfer coe(cid:30)cient k diverges, because a (cid:28)nite concentration
|     | p   |     |     |     | f   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | a   |     |     |     |     | k−1 |     |     |     |
di(cid:27)erence exis ts within a CP layer of zero thickness → 0. The e(cid:27)ective solvent
f
|     | permeabilit,y | A converges | to  | A as the | CP  | layer disappears. |     |     |     |     |
| --- | ------------- | ----------- | --- | -------- | --- | ----------------- | --- | --- | --- | --- |
meff
In the solution-di(cid:27)usion model, the driving force for the solute (cid:29)ux is the concen-
i
traKtion di(cid:27)erence between the membrane surface and the permeate stream. Replacing
|     | ∆C in | Eq. (48) by | C −C | gives |     |     |     |     |     |     |
| --- | ----- | ----------- | ---- | ----- | --- | --- | --- | --- | --- | --- |
|     | s     |             | m    | p     |     |     |     |     |     |     |
.
S
|     |     |     |     | J = | B (C | −C ) |     |     | (57) |     |
| --- | --- | --- | --- | --- | ---- | ---- | --- | --- | ---- | --- |
|     |     |     |     | s   | m    | p    |     |     |      |     |
t
where B has the same unit of J [m/s]. We rewrite Eq. (57),using Eq. 29, as
| r   |     |     |     | w   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
e
eJw/k
| b   |     |     |     | J = | BC R | f   |     |     | (58) |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- |
|     |     |     |     | s   | f    | obs |     |     |      |     |
l
A which implies that J increases exponentially with respect to J . Note that the solute
|     |     |     | s   |     |     |     |     | w   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:29)ux must be equal to the permeate concentration multiplied by the permeate (cid:29)ux:
|     |     |     | J   | = C J | = C | (1−R | )J  |     |      |     |
| --- | --- | --- | --- | ----- | --- | ---- | --- | --- | ---- | --- |
|     |     |     |     | s p   | w f | obs  | w   |     | (59) |     |
13

J 7
Rigorously, s in Eq. (58) indicates the solute (cid:29)ux through the membrane interior
1
driven by the external concentration di(cid:27)erence, C − C . Eq. (59) is based on the
|     |     |     |     |     |     |     |     | m   | p   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
global mass balance implying that the solute molecules are uniformly mixed in the
2
permeate stream after they have passed through the membrane. -
8
2
| 2.3.3. | Parameter |     | estimation |     |     |     |     |     |     |     |
| ------ | --------- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- |
-
Solvent permeability. The solvent permeability A is an intrinsic material const8ant of
0
a speci(cid:28)c membrane and so needs to be experimentally measured. When the feed
stream of zero concentration (C = 0) is (cid:28)ltered using an RO membrane,,we have
|     |     |     |     |     | f   |     |     |     | l   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
a
J0
w n
|     |     |     |     |     |     | A   | =   |     |     | (60) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
∆P r
u
where J0 indicates the permeate (cid:29)ux of zero feed concentratoion. Using pure water,
w
J0
a series of (cid:28)ltration experiments can be conducted to meJasure with respect to
w
∆P as schematically shown in Fig. 5. The slope of the e (cid:29)ux vs. pressure line can be
|     |     |     |     |     |     |     |     | toncalculate |     | A.  |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- |
calculated using a simple linear regression method the must probable
a
Solute permeability. Here, we simply assume thatrB is also a constant within typical
b
rangesofthesoluteconcentrationandappliedpressureofnormalROprocesses. From
m
| Eqs. | (53), | 58 and | (59), | we obtain: |     |     |     |     |     |     |
| ---- | ----- | ------ | ----- | ---------- | --- | --- | --- | --- | --- | --- |
e
|     |     |     |     |       |     | AM∆P | −J  | (1−R | )J    |      |
| --- | --- | --- | --- | ----- | --- | ---- | --- | ---- | ----- | ---- |
|     |     |     | R   | eJw/k | =   |      | w   | =    | obs w | (61) |
|     |     |     | obs |       | f   |      |     |      |       |      |
|     |     |     |     |       |     | Aπ   |     |      | B     |      |
f
n
| which | leads | to  |     |     |     |     |     |     |     |     |
| ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
i
|     |     |     |     |     |     | B   | π J0  |     |     |      |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | ---- |
|     |     |     |     |     |     |     | w     | w   |     |      |
|     |     |     |     | d   |     | =   |       |     |     | (62) |
|     |     |     |     |     |     | A   | J0 −J |     |     |      |
|     |     |     |     |     |     |     | w     | w   |     |      |
e
where π = π (1−R t) is the osmotic pressure of the permeate stream and J0 −J
|     | p   | f   | pobs |     |     |     |     |     |     | w w |
| --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
J0
indicates the permeate (cid:29)ux lost from the pure water (cid:29)ux due to the concentration
|               |     |     | e   |     |     |     |     |     | w   |     |
| ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| polarization. |     |     | c   |     |     |     |     |     |     |     |
c
Low (cid:29)ux limiat. When the permeate (cid:29)ux is low due to small e(cid:27)ective pressure, the
following a,pproximations can be made. The intrinsic rejection R converges to the
int
m
observed rejection, R → R , because the CP must be negligible on the membrane
|          |     |     | int         | obs |       |         |        |            |     |      |
| -------- | --- | --- | ----------- | --- | ----- | ------- | ------ | ---------- | --- | ---- |
| surfacie | C   | → C | , and hence |     | π →   | π . The | solute | (cid:29)ux | is  |      |
| Km       |     |     | f           |     | m     | f       |        |            |     |      |
|          |     |     |             |     | J = C | J =     | B (C   | −C         | )   | (63) |
|          |     |     |             |     | s     | p w     | 0      | f          | p   |      |
.
S
which gives
| t   |     |     |     |     |     |     | 1−R |     |     |      |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     |     | B   | = J |     | obs |     | (64) |
| r   |     |     |     |     |     | 0   | w   |     |     |      |
R
e obs
b where the subscript 0 indicates no or negligible concentration polarization. Then, B
l
| of Eq. | (61) | can | be expressed |     | as: |     |     |     |     |     |
| ------ | ---- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
A
|     |     |     |     |     |     | B = B | e−Jw/k | f   |     | (65) |
| --- | --- | --- | --- | --- | --- | ----- | ------ | --- | --- | ---- |
0
| J    | /k (cid:28) | 1,   | B         |     |     | B    |            |       |     |     |
| ---- | ----------- | ---- | --------- | --- | --- | ---- | ---------- | ----- | --- | --- |
| If w | f           | then | converges |     | to  | 0 of | the dilute | limit |     |     |
14

7
Mass transfer coe(cid:30)cient. In system design and performance evaluation of RO pro-
1
cesses, estimation of the mass transfer coe(cid:30)cient k is of great importance. A number
f
0
of experiments can be conducted and accumulated data can be used to create empir-
2
ical correlations for later use. Here, k can be represented using the solvent (cid:29)ux Eq. -
f
8
|     | (53) and | the solute | (cid:29)ux Eq. | (58), which | are |     |     |     |
| --- | -------- | ---------- | -------------- | ----------- | --- | --- | --- | --- |
2
-
|     |     |     |     | 1   | 1 J0 | −J    |     | 8     |
| --- | --- | --- | --- | --- | ---- | ----- | --- | ----- |
|     |     |     |     |     |      | w w   |     |       |
|     |     |     |     | =   | ln   |       |     | 0(66) |
|     |     |     |     | k   | J Aπ | R     |     |       |
|     |     |     |     | f   | w    | f obs |     |       |
,
l
and a
|     |     |     |     | 1 1 | (1−R | ) J   |     |      |
| --- | --- | --- | --- | --- | ---- | ----- | --- | ---- |
|     |     |     |     |     |      | obs w | n   |      |
|     |     |     |     | =   | ln   |       |     | (67) |
r
|     |     |     |     | k J |     | BR  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | f w |     | obs | u   |     |
respectively. Values of k estimated using the above two equaotions should be compa-
f
|     | rable within | a tolerable | error. |     |     |     | J   |     |
| --- | ------------ | ----------- | ------ | --- | --- | --- | --- | --- |
e
n
|     | 2.3.4. | Empirical correlations |     |     |     |     |     |     |
| --- | ------ | ---------------------- | --- | --- | --- | --- | --- | --- |
a
When a feed solution is physico-chemically characterized and a module geometry
r
v
is given, the cross(cid:29)ow speed is almost the obnly controllable parameter to change
|     |     |     |     | k   | dimmensionless |     |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --- | --- |
the mass transfer coe(cid:30)cient f . For analysis, Sherwood number is
represented as a function of Reynolds and Schmidt numbers and the aspect ratio of
e
the channel geometry. (See AppendixMA.2 for details.) Table 1 shows exponent values
of a, b, c, and d in Eq. (A.9). For laminar (cid:29)ow, a of a rectangular channel is slightly
higher than that of a cylindricanl tube, while all other exponents are equally 1/3.
i
In(cid:29)uences of Re, Sc, and modu le geometry on the k must be similar in cylindrical
f
d
and rectangular channels and a represents the e(cid:27)ect of the cross-section shape. For
e
turbulent (cid:29)ow, a, b, and c are same for the cylindrical and rectangular channels and
t
|     |     | d = 0. | Dpue |     |     |     |     |     |
| --- | --- | ------ | ---- | --- | --- | --- | --- | --- |
interestingly to the complex nature of the turbulent (cid:29)ow (cid:28)eld, the e(cid:27)ect
e
of hydraulic diameter vanishes, as the wetted surface area in the turbulence fails to
c
|     | provide | a controcllable | impact | on the mass | transfer. |     |     |     |
| --- | ------- | --------------- | ------ | ----------- | --------- | --- | --- | --- |
a
|     | 2.3.5. | Long membrane | modules |     |     |     |     |     |
| --- | ------ | ------------- | ------- | --- | --- | --- | --- | --- |
,
m
Fig. 6 shows a schematic of cross(cid:29)ow RO (cid:28)ltration. For a short membrane, the
|     | retentiate | concentration | is  |     |      |     |     |     |
| --- | ---------- | ------------- | --- | --- | ---- | --- | --- | --- |
|     | K          |               |     |     | C −C | Y   |     |     |
f p
|     |     |     |     | C = |     |     |     | (68) |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- |
c
1−Y
.
S
which implicitly neglects the concentration variation in the longitudinal direction, as
tshown in Fig. 2. For a long membrane, Eq. (68) holds its validity only if C is
p
r
|     | replaced | by its length-averaged |     | value: |     |     |     |     |
| --- | -------- | ---------------------- | --- | ------ | --- | --- | --- | --- |
e
b
(cid:90)
| l   |     |     |     |     | 1 L |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
¯
| A   |     |     |     | C = | C   | (x)dx |     | (69) |
| --- | --- | --- | --- | --- | --- | ----- | --- | ---- |
|     |     |     |     | p   | L   | p     |     |      |
0
15

|     |       | C (x) |      |                |     |               |     |     | x (0 < x | < L). |       |         | 7   |
| --- | ----- | ----- | ---- | -------------- | --- | ------------- | --- | --- | -------- | ----- | ----- | ------- | --- |
|     | where | p     | is a | local permeate |     | concentration |     |     | at       | A     | local | average |     |
1
|     | concentration |     | of C | (x) is denoted |     | as  |     |     |     |     |     |     |     |
| --- | ------------- | --- | ---- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
p
0
2
|     |     |     |     |     |     |           | 1 (cid:90) x |                       |     |     |     |      |     |
| --- | --- | --- | --- | --- | --- | --------- | ------------ | --------------------- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     | ¯(cid:48) |              |                       |     |     |     | -    |     |
|     |     |     |     |     |     | C =       | C            | (x(cid:48))dx(cid:48) |     |     |     | (70) |     |
|     |     |     |     |     |     | p         |              | p                     |     |     |     | 8    |     |
x
|     |     |     |     |     |     |     | 0   |     |     |     |     | 2   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
-
Then, the retentate concentration of Eq. (68) can be rewritten as 8
0
¯
|     |     |     |     |     |     |     | C   | −C Y |     |     |     |      |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     | C   | = f | p    |     |     | ,   | (71) |     |
|     |     |     |     |     |     | c   |     |      |     |     | l   |      |     |
|     |     |     |     |     |     |     | 1−Y |      |     |     | a   |      |     |
n
|     |     | Y   |     |     |     |     |     |     | Y = Q /Q |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- |
where is the (global) recovery ratio de(cid:28)ned as p f . r
u
Mean osmotic pressure in the bulk phase. To apply the solutioon-di(cid:27)usion model for a
long membrane module, a longitudinally mean osmotic pr J essure π¯ needs to be used
to calculate the mean transmembrane osmotic pressuere: ∆π = π¯ − π . A good
p
n
|     | approximation, |     | especially |     | for membrane |     | array | design, | can be |     |     |     |     |
| --- | -------------- | --- | ---------- | --- | ------------ | --- | ----- | ------- | ------ | --- | --- | --- | --- |
a
|     |     |     |     |     |     |     | π   | +π  | r   |     |     |      |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     |     | f   | bc  |     |     |     |      |     |
|     |     |     |     |     |     | π¯  | =   |     |     |     |     | (72) |     |
m 2
where π = π(C ). Note that Eq. (72) deoes not include the e(cid:27)ect of the concentra-
|     |     | c   | c   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
M
tion polarization phenomena in the transverse direction. This forceful decoupling of
mass balance equations in the transverse and longitudinal direction allows analytical
n
solutions, which are later combined using empirical correlations. The mass trans-
i
fer coe(cid:30)cient k , estimated using an empirical correlation, implicitly includes e(cid:27)ects
|     |     |     | f   |     | d   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
of the membrane length and the channel cross-section in addition to the transport
e
|     | mechanisms. |     |     | t   |     |     |     |     |     |     |     |     |     |
| --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
p
Mulder’s theory. Noew we apply the same analysis at x = l. For a partial membrane
c
of length x fromc 0, C and C of a full membrane are replaced by their partial values
|     |           |                |                | c   | p    |     |     |     |     |     |     |     |     |
| --- | --------- | -------------- | -------------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | C(cid:48) | and C(cid:48), | reaspectively, | to  | give |     |     |     |     |     |     |     |     |
|     | c         | p              |                |     |      |     |     |     |     |     |     |     |     |
,
|     |     | m   |     |     |     |     | C −C(cid:48)Y(cid:48) |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- |
f
|     |     |     |     |     |     | C(cid:48) | =   | p   |     |     |     | (73) |     |
| --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- | ---- | --- |
c
|     |     | i   |     |     |     |     | 1−Y(cid:48) |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- |
K
where Y(cid:48) is a local recovery ratio for the partial membrane of length x. To solve this,
.
|     | Swe | need an | additional | relationship |     | such | as  |     |     |     |     |     |     |
| --- | --- | ------- | ---------- | ------------ | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
t
C(cid:48)
| r   |     |     |     |     |     |     |     | (cid:104)C(cid:48)(cid:105) |     |     |     |      |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --------------------------- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     |     | =   |                             |     |     |     | (74) |     |
| e   |     |     |     |     |     | 1−R |     | c                           |     |     |     |      |     |
b
l
|     | for | which | Mulder [34] | assumed |     | that |     |     |     |     |     |     |     |
| --- | --- | ----- | ----------- | ------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
A
|     |     |     |     |     |                             |     | 1 (cid:90) Y(cid:48) |                 |     |     |     |      |     |
| --- | --- | --- | --- | --- | --------------------------- | --- | -------------------- | --------------- | --- | --- | --- | ---- | --- |
|     |     |     |     |     | (cid:104)C(cid:48)(cid:105) | =   |                      | C(cid:48) (Y)dY |     |     |     | (75) |     |
|     |     |     |     |     |                             | c   | Y(cid:48)            | c               |     |     |     |      |     |
0
16

7
| Substitution | of Eq. | (73) and | (75) | in (74) | gives |     |     |     |     |     |
| ------------ | ------ | -------- | ---- | ------- | ----- | --- | --- | --- | --- | --- |
1
|     |     |           |                |     |          |     | (cid:90) Y(cid:48) |     |      | 0   |
| --- | --- | --------- | -------------- | --- | -------- | --- | ------------------ | --- | ---- | --- |
|     |     | C(cid:48) | ·(1−Y(cid:48)) | =   | C −(1−R) |     | C(cid:48)dY        |     | (76) | 2   |
f
|     |     | c   |     |     |     |     |     | c   |     | -   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
8
|     |     |     |     | C(cid:48). |     |     |     |     | Y(cid:48)2 |     |
| --- | --- | --- | --- | ---------- | --- | --- | --- | --- | ---------- | --- |
which is an integral equation for We di(cid:27)erentiate Eq. (76) with respect to to
|      |     |     |     | c          |     |            |     |     | -   |     |
| ---- | --- | --- | --- | ---------- | --- | ---------- | --- | --- | --- | --- |
| have |     |     |     |            |     |            |     |     | 8   |     |
|      |     |     |     | dC(cid:48) |     | dY(cid:48) |     |     |     |     |
0
|     |     |     |     |           | c = R       |     |     |     | (77) |     |
| --- | --- | --- | --- | --------- | ----------- | --- | --- | --- | ---- | --- |
|     |     |     |     | C(cid:48) | 1−Y(cid:48) |     |     |     |      |     |
|     |     |     |     | c         |             |     |     | ,   |      |     |
l
a
| and integrate | it such | that |     |     |     |     |     |     |     |     |
| ------------- | ------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
n
|     |     |     | (cid:90) | Cc dC(cid:48) | (cid:90) | Y dY(cid:48) |     | r   |      |     |
| --- | --- | --- | -------- | ------------- | -------- | ------------ | --- | --- | ---- | --- |
|     |     |     |          |               | c = R    |              |     | u   | (78) |     |
|     |     |     |          | C(cid:48)     |          | 1−Y(cid:48)  |     | o   |      |     |
|     |     |     | C        | f c           |          | 0            |     |     |      |     |
J
to obtain
e
·(1−Y)−R
|     |     |     |     | C = | C   |     | n   |     | (79) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |
|     |     |     |     | c   | f   |     |     |     |      |     |
a
Substitution of (79) into (71) represents the mean permeate concentration:
r
b
1−m(1−Y)1−R
¯
|     |     |     | C   | = C |     |     |     |     | (80) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |
|     |     |     |     | p   | f   | Y   |     |     |      |     |
e
M
|     |     |     | C   | R,  | Y.  |     |     | Y   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
represented as a function of f , and In this approach, implicitly includes
impacts of A,A and ∆P, and R contains the rejecting role of B.
m
n
Examples in the Appendix A.3indicate that Mulder’s theory is valid when the
i
rejectionratioishigh,suchasstandardROprocesses. Thekeyequations(79)and(80)
d
stem from the partial mases balance Eqs. (74) and (75). The solution-di(cid:27)usion model
uses speci(cid:28)c permeabilitty values of A and B, to iteratively calculate the permeate
p
concentration. As the CP is incorporated into the solution-di(cid:27)usion model, C is
|     |     | e   |     |     |     |     |     |     | m   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
considered highercthan C , but does not explicitly include variation of C in the
|     |     |     | f   |     |     |     |     | p   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
c
longitudinal direction (from the inlet to the exit of the membrane module). An
a
empiricalcorrelationforthemasstransfercoe(cid:30)cientk
f implicitlyincludesthelength-
averagemd dimensionless , numbers, and perhaps so does C . Therefore, combination
m
of the solution-di(cid:27)usion model and k estimated using an empirical correlation is
f
i
| conKceptually | equivalent | to  | Mulder’s | intuitive |     | assumption: |     |     |     |     |
| ------------- | ---------- | --- | -------- | --------- | --- | ----------- | --- | --- | --- | --- |
¯(cid:48)
| .   |     |     | C   |     | 1 (cid:90) Y(cid:48) |           |     |     |     |     |
| --- | --- | --- | --- | --- | -------------------- | --------- | --- | --- | --- | --- |
| S   |     |     |     | p   |                      | C(cid:48) |     |     |     |     |
|     |     |     |     | =   |                      | (Y)dY     |     |     |     |     |
|     |     |     | 1−R |     | Y(cid:48)            | c         |     |     |     |     |
| t   |     |     |     |     | 0                    |           |     |     |     |     |
r
Usually, vendors provide a rejection ratio for a membrane, measured at a reference
e
b condition, which in this case can be used as an intrinsic constant similar to A or B.
l
Mulder’s theory allows us to practically estimate the product permeate concentration
A
| using R | and Y without | dealing |     | with speci(cid:28)c |     | transport | models. |     |     |     |
| ------- | ------------- | ------- | --- | ------------------- | --- | --------- | ------- | --- | --- | --- |
In section 2.1, a membrane is characterized using ten variables. Of these, six
|     | A,B, A | ∆P, | C   | Q   |     |     |     |     |     |     |
| --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
variables of m , f and f usually are known. The four remaining ones
17

7
are calculated using the same number of equations, which are global mass balances
1
of Eqs. (3) and (4), and solvent and solute (cid:29)uxes of Eqs. (5) and (6), respectively. In
0
Mulder’s approach, the membrane is treated as a black box of known R and Yso that
2
the variable set includes eight elements {R,Y,C Q ,C ,Q ,C ,Q } when R, Y, C , -
|     |     |     |     |     |     | f, f | p p c c |     | f   |
| --- | --- | --- | --- | --- | --- | ---- | ------- | --- | --- |
8
and Q are known, then de(cid:28)nitions of R and Y, and global mass balance equations
|     |     | f   |     |     |     |     |     |     | 2   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
of solutes and solvent will be used to calculate the same total number of unknow-ns,
8
|     | such as      | {C ,Q ,C  | ,Q }.     |     |     |     |     |     |     |
| --- | ------------ | --------- | --------- | --- | --- | --- | --- | --- | --- |
|     |              | p p       | c c       |     |     |     |     | 0   |     |
|     | 2.4. Coupled | Governing | Equations |     |     |     |     | ,   |     |
l
a
An accurate governing equation without a forceful decoupling between the trans-
n
|     | verse and | longitudinal | directions | is  |     |     |     |     |     |
| --- | --------- | ------------ | ---------- | --- | --- | --- | --- | --- | --- |
r
|     |     |     |      | (cid:18) | (cid:19) |     | u   |     |     |
| --- | --- | --- | ---- | -------- | -------- | --- | --- | --- | --- |
|     |     |     | ∂C ∂ | ∂C       |          | ∂C  | ∂C  |     |     |
o
|     |     |     | =     | D   | −u(y) | −v  | (x)   |     | (81) |
| --- | --- | --- | ----- | --- | ----- | --- | ----- | --- | ---- |
|     |     |     | ∂t ∂y | ∂y  |       | ∂x  | w J∂y |     |      |
where the solute di(cid:27)usivity D is often assumed to be ceonstant and the longitudinal
n
di(cid:27)usion is discarded by indicating ∂2C/∂x2 (cid:28) ∂2C/ ∂y2. Within the CP layer, the
a
cross(cid:29)ow velocity is often represented as a linear shear (cid:29)ow with respect to y:
r
b
|     |       |     |     |     | u(y) = m | γy       |     |     | (82) |
| --- | ----- | --- | --- | --- | -------- | -------- | --- | --- | ---- |
|     | where |     |     |     | e        |          |     |     |      |
|     |       |     |     |     | (cid:20) | (cid:21) |     |     |      |
M∂u
|     |     |     |     | γ   | =   |     |     |     | (83) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
∂y
y=0
n
is a shear rate on the membrane surface. The mathematical rigor of the coupled gov-
i
erning equation is closely related to the exponential dependence of the concentration
d
near membrane surface onethe permeate (cid:29)ux (see Eq. (27))[35, 36]. The only nu-
merical solution seemedtto be available for the 2D convection and di(cid:27)usion of solutes
p
on the membrane surface. A general solution of Eq. (81) was developed using Airy
e
functions, but coec(cid:30)cients were obtained by numerical integrations [37]. This work
c
discovered that an in(cid:29)ection point of the concentration pro(cid:28)le exists in the longitu-
a
dinal cross(cid:29)ow direction. Even if these analytic approaches provide a fundamental
,
insightmof cross(cid:29)ow membrane (cid:28)ltration, they are still restricted to solute migration
on the (cid:29)at, slip-less surface in the linear shear (cid:28)eld of Eq. (82). It is formidably
i
di(cid:30)Kcult to develop an analytic solution of the 2D governing equation if one or some
of the followings are considered: the presence of spacers, transient hydraulic pressure
.
Sfor pulsing, curved channels, and parabolic or nonlinear (cid:29)ow (cid:28)elds.
t
|     | 2.5. Fouling | indexes | and scaling | potential |     |     |     |     |     |
| --- | ------------ | ------- | ----------- | --------- | --- | --- | --- | --- | --- |
r
| e   | 2.5.1. | Modi(cid:28)ed fouling | index | (MFI) | for colloidal | fouling |     |     |     |
| --- | ------ | ---------------------- | ----- | ----- | ------------- | ------- | --- | --- | --- |
b
When colloidal particles deposit on the membrane surface (typically, but not lim-
l
A itedto, MForUFmembranes), theresistance-in-seriesmodelrepresentsthepermeate
(cid:29)ux
∆P
J =
|     |     |     |     | w   |      |      |     |     | (84) |
| --- | --- | --- | --- | --- | ---- | ---- | --- | --- | ---- |
|     |     |     |     |     | η (R | +R ) |     |     |      |
|     |     |     |     |     | m    | c    |     |     |      |
18

R 7
where c is the resistance of the cake layer, i.e., temporarily or permanently built de-
1
posit layer of solid materials such as nano- or colloidal particles, (deformable) macro-
0
molecules or combined forms. In the dead-end (cid:28)ltration or at the initial stage of the
2
cross(cid:29)ow (cid:28)ltration, R continuously increases with respect to time. Moreover, often -
c
8
causing noticeable declining trends of the permeate (cid:29)ux, the speci(cid:28)c cake resistance
2
|     | is de(cid:28)ned | as  |     |     |     | -   |
| --- | ---------------- | --- | --- | --- | --- | --- |
8
|     |     |     |     | r = | R /δ  | (85) |
| --- | --- | --- | --- | --- | ----- | ---- |
|     |     |     |     | c   | c c 0 |      |
which is independent on the cake thickness δ if the cake layer has a uniform mass
|     |     |     |     |     | c , |     |
| --- | --- | --- | --- | --- | --- | --- |
l
density. In principle, the speci(cid:28)c resistance is an inverse of the hydraulaic permeability
κ−1,
κ, i.e., r = which is generally a function of particle size, panrticle shape, and
c
byra
cake porosity. If particulate materials are perfectly removed membrane, the
u
amount of particle mass transported from the bulk (feed) phase to the membrane
o
surface is equal to the particle mass accumulated on the mJembrane surface, which is
|     | mathematically | written | as  |     |     |     |
| --- | -------------- | ------- | --- | --- | --- | --- |
e
|     |     |     |     | φ V = | φ A δ n | (86) |
| --- | --- | --- | --- | ----- | ------- | ---- |
|     |     |     |     | f     | c m c   |      |
a
where φ and φ are particle volume fractions in the feed solution and of the cake
|     |     | f c |     |     | r   |     |
| --- | --- | --- | --- | --- | --- | --- |
layer, respectively, and V is the permeate voblume, i.e., the solvent volume passed
amrea
through the membrane having the surface A . Substitution of (86) in (85) gives
m
e
|     |     |     |     | R = | αV  | (87) |
| --- | --- | --- | --- | --- | --- | ---- |
Mc
where α = φ r /φ A is the proportionality between the cake resistance and the
|     |     | f c c | m   |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- |
n
permeate volume. Eq. (87) indicates that the cake resistance increases as water is
i
(cid:28)ltered by the membrane. By de(cid:28)nition, the permeate (cid:29)ux is written as
d
|     |     |     | e   |     | 1 dV |      |
| --- | --- | --- | --- | --- | ---- | ---- |
|     |     |     | t   | J = |      | (88) |
|     |     |     | p   | w   | A dt |      |
m
e
as it is proportioncal to the volume of produced solvent per unit time , i.e., dv/dt.
|     | Substitution | of c(87) | and (88) in | (84) provides |     |     |
| --- | ------------ | -------- | ----------- | ------------- | --- | --- |
a
|     |     |     |     | 1 dV | ∆P  |      |
| --- | --- | --- | --- | ---- | --- | ---- |
|     |     | ,   |     | =    |     | (89) |
m
|     |     |     | A   | dt η | (R +αV) |     |
| --- | --- | --- | --- | ---- | ------- | --- |
|     |     |     |     | m    | m       |     |
i
whKich is simply the (cid:28)rst order ordinary di(cid:27)erential equation of the (cid:28)ltered volume V,
|     | rewritten | as  |     |     |     |     |
| --- | --------- | --- | --- | --- | --- | --- |
.
|     | S   |     | η (R | +αV)dV | = ∆PdtA | (90) |
| --- | --- | --- | ---- | ------ | ------- | ---- |
m m
tin an integrable form. Integration of this equation using the initial condition of
r
|     | V (t = | 0) = 0 gives |     |     |     |     |
| --- | ------ | ------------ | --- | --- | --- | --- |
e
b
t
l
|     |     |     |     | = C | +C V | (91) |
| --- | --- | --- | --- | --- | ---- | ---- |
| A   |     |     |     | V   | 1 2  |      |
where
ηR
m
|     |     |     |     | C = |      | (92) |
| --- | --- | --- | --- | --- | ---- | ---- |
|     |     |     |     | 1   | A ∆P |      |
m
19

|     |     |        | y-intercept |     | t/V    | V   |      |     |     |     |     |     | 7   |
| --- | --- | ------ | ----------- | --- | ------ | --- | ---- | --- | --- | --- | --- | --- | --- |
|     |     | is the |             | of  | versus |     | plot | and |     |     |     |     |     |
1
|     |     |     |     |     |     |     |     | ηφ r |     |     |     | 0   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- |
f c
|     |     |     |     |     |     | C   | =   |     | ≡   | MFI |     | (93) 2 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- |
2
|     |     |     |     |     |     |     | 2φ  | A2 ∆P |     |     |     | -   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
c m
8
2
is the slope, which is de(cid:28)ned as modi(cid:28)ed fouling index (MFI) [38, 39]. This MFI
-
fraction8φ
cannot be easily calculated using Eq. (93), because the cake volume c is
neither known nor (easily) measurable and r is a complex non-linear functi0on of φ .
|     |     |     |     |     |     |     |     |     | c   |     |     | c   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Theoretical calculation of MFI is challenging, because φ strongly depend,s on inter-
c
l
particle and particle-membrane interactions and r is a complex, non-alinear function
c
|     |     | of φ | .   |     |     |     |     |     |     |     | n   |     |     |
| --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
c
r
u
|     |     | 2.5.2. | Combined | fouling | index | (CFI) |     |     |     |     |     |     |     |
| --- | --- | ------ | -------- | ------- | ----- | ----- | --- | --- | --- | --- | --- | --- | --- |
o
When the feed solution contains both salt ions of high cJoncentration and colloidal
particles,thepermeate(cid:29)uxmaybeexpressedasacombinationoftheosmoticpressure
e
|     |     | model | and the | resistance-in-series |     |     | model: |     |     | n   |     |     |     |
| --- | --- | ----- | ------- | -------------------- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
a
∆P −∆π
rm
|     |     |     |     |     |     |     | J = |      |     |     |     | (94) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     |     | w   |      | b   |     |     |      |     |
|     |     |     |     |     |     |     |     | η (R | +R  | )   |     |      |     |
|     |     |     |     |     |     |     |     | m    | m   | c   |     |      |     |
where∆π (= π −π )isthetransmemberaneosmoticpressuredi(cid:27)erenceinthepres-
|     |     |     | m   | m   | f   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
laMyer
sure of CP. Consider that the cake exists inside the concentration polarization
|     |     |     |     |     | δ   | > δ |     | δ   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
layer of salt ions, i.e., p c , where p is the thickness of the salt concentration
|     |     | polarization | layer | above | the | membrane | n   | surface. | Then | we  | de(cid:28)ne |     |     |
| --- | --- | ------------ | ----- | ----- | --- | -------- | --- | -------- | ---- | --- | ------------ | --- | --- |
i
d
|     |     |     |     |     |     |     | δ   | = δ | −δ  |     |     | (95) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- |
|     |     |     |     |     |     |     |     | s p | c   |     |     |      |     |
e
t
which is the partial thpickness of the concentration polarization layer above the cake
layer, within whichethe tangential cross (cid:29)ow velocity is assumed to be negligible.
c
The surface of the cake layer may provide the no-slip boundary condition, which is
c
similar to thea(bare) membrane surface without the particle deposition. Then, the
mass balance Eq. (24) can be employed using the solute di(cid:27)usivity changing with
,
|     |     | respectmto | y:  |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:40)
|     |     |     |     |     |     |     | D          |     | δ < | y < δ |     |      |     |
| --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- | ----- | --- | ---- | --- |
|     |     |     | i   |     |     |     | 0          | for | c   | p     |     |      |     |
|     |     | K   |     |     | D   | =   |            |     |     |       |     | (96) |     |
|     |     |     |     |     |     |     | D (cid:15) | for | 0 < | y < δ |     |      |     |
|     |     |     |     |     |     |     | 0τ         |     |     | c     |     |      |     |
.
|     | Swhere |     | (cid:15) (= 1−φ | )   |     |     |     |     | τ   |     |     |     |     |
| --- | ------ | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
c is the cake porosity and is the di(cid:27)usive tortuosity. In Eq. (24),
|     |     | dy/(C | −C ) | is multiplied |     | on both | sides | to  | give |     |     |     |     |
| --- | --- | ----- | ---- | ------------- | --- | ------- | ----- | --- | ---- | --- | --- | --- | --- |
|     | t   |       | p    |               |     |         |       |     |      |     |     |     |     |
r
| e   |     |     |     |     | (cid:90) C |     |     | (cid:90) δc |      | (cid:90) δp−δc |      |      |     |
| --- | --- | --- | --- | --- | ---------- | --- | --- | ----------- | ---- | -------------- | ---- | ---- | --- |
|     |     |     |     |     | f          | dC  |     | J           | τ    |                | J    |      |     |
| b   |     |     |     |     |            |     | = − |             | w dy | −              | w dy | (97) |     |
| l   |     |     |     |     | C          | −C  |     | D           | ε    |                | D    |      |     |
|     |     |     |     |     | Cm         | p   |     | 0           | 0    | δc             | 0    |      |     |
A
|     |     | which | is solved | as  |     |      |     |     |             |      |          |      |     |
| --- | --- | ----- | --------- | --- | --- | ---- | --- | --- | ----------- | ---- | -------- | ---- | --- |
|     |     |       |           |     |     | C    | −C  |     | J (cid:16)τ |      | (cid:17) |      |     |
|     |     |       |           |     |     | ln f | p   | = − | w           | δ +δ |          | (98) |     |
|     |     |       |           |     |     |      |     |     |             | c    | s        |      |     |
|     |     |       |           |     |     | C    | −C  |     | D (cid:15)  |      |          |      |     |
|     |     |       |           |     |     | m    |     | p   | 0           |      |          |      |     |
20

φ 7
The cake volume fraction c is often assumed to be a random close packing ratio of
1
0.64 [40, 41], and the di(cid:27)usive tortuosity τ is in principle greater than 1.0, varying
0
with φ and the internal structure of the cake layer. For a thick cake layer, the
c 2
concentration polarization above the cake layer does not signi(cid:28)cantly contribute to -
8
the permeate (cid:29)ux. So, one can approximate Eq. (98) by removing δ as
|     |     |     |     |     |     |     |     |     |     |     |     | s   | 2   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
-
|     |     |     |     |     |     |      |     | (cid:18) |              | (cid:19) |     |     |       |
| --- | --- | --- | --- | --- | --- | ---- | --- | -------- | ------------ | -------- | --- | --- | ----- |
|     |     |     |     |     |     | C −C |     |          | J δ          |          |     |     | 8     |
|     |     |     |     |     |     | m    | p   |          | w            | c        | ej  |     |       |
|     |     |     |     |     |     |      | =   | exp      |              | =        |     |     | 0(99) |
|     |     |     |     |     |     | C −C |     |          | D (cid:15)/τ |          |     |     |       |
|     |     |     |     |     |     | f    | p   |          | 0            |          |     |     |       |
,
l
|     | where | we  | de(cid:28)ne | a dimensionless |     |     | permeate | (cid:29)ux |     |     |     | a   |     |
| --- | ----- | --- | ------------ | --------------- | --- | --- | -------- | ---------- | --- | --- | --- | --- | --- |
n
|     |     |     |     |     |     |     |     | J   |     |     |     | r   |       |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
|     |     |     |     |     |     |     |     | j = | w   |     |     |     | (100) |
u
k
|     |     |     |     |     |     |     |     |     | c   |     | o   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
J
and
D
|     |     |     |     |     |     |     |     |     | 0          | e   |     |     |       |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- | --- | ----- |
|     |     |     |     |     |     |     |     | k = |            |     |     |     | (101) |
|     |     |     |     |     |     |     |     | c δ | τ/(cid:15) | n   |     |     |       |
c
a
which is interpreted as the di(cid:27)usive mass-transfer coe(cid:30)cient of solute ions in the cake
r
layer of porosity ε. The denominator of Eq. (b101), δ τ/(cid:15), can be considered as the
c
m
e(cid:27)ective path length of di(cid:27)using solutes within the cake layer, which is longer than
|     | that | in  | the void | space. |     |     |     | e   |     |     |     |     |     |
| --- | ---- | --- | -------- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
M
Substitution of Eq. (99) in (94) g ives the (cid:28)nal equation to solve for j:
ej
|     |     |     |     |     |     |     | n∆P | −π  | R     |     |     |     |       |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | ----- |
|     |     |     |     |     |     |     | j = |     | f obs |     |     |     | (102) |
i
|     |     |     |     |     |     |     |     | k η (R | +R  | )   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | c      | m   | c   |     |     |     |
d
|     | Similar |     | to the | previous | caese, | we  | assume | j < | 1 to | use |     |     |     |
| --- | ------- | --- | ------ | -------- | ------ | --- | ------ | --- | ---- | --- | --- | --- | --- |
t
p
|     |     |     |     |     |     |     |      |        | (cid:0) | (cid:1) |     |     |       |
| --- | --- | --- | --- | --- | --- | --- | ---- | ------ | ------- | ------- | --- | --- | ----- |
|     |     |     |     |     |     |     | ej = | 1+j +O | j2      |         |     |     | (103) |
e
c
|     |     |     |     | c   |     |     |     |     |     | j   | (k  | A )−1dV/dt |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- |
and substitute E q. (103) with (102). We then replace by c m and use
a
|     | Eq. | (87) | to give |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ---- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
,
|     |     |     | m   | (cid:20) |     |     |     | (cid:21) |     |     |     |     |     |
| --- | --- | --- | --- | -------- | --- | --- | --- | -------- | --- | --- | --- | --- | --- |
π R
f obs
|     |     |     |     | η   | R + |     | +αV | dV  | = (∆P | −π  | R )A  | dt  | (104) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | ----- | --- | ----- |
|     |     | i   |     |     | m   |     |     |     |       |     | f obs | m   |       |
|     |     | K   |     |     |     | k η |     |     |       |     |       |     |       |
c
.Integration of both sides using an initial condition of V = 0 at t = 0 provides
S
|     |     |     |     |          |          | (cid:32) |     | (cid:33) |          |      |          |     |     |
| --- | --- | --- | --- | -------- | -------- | -------- | --- | -------- | -------- | ---- | -------- | --- | --- |
|     |     |     |     | (cid:18) | (cid:19) | 1+πˆ     |     | J        | (cid:18) |      | (cid:19) |     |     |
| t   |     |     |     |          | ηR       |          | f   | w 0      |          | ηφ r |          | 1   |     |
|     |     |     | t   | =        | m        |          |     | k c V    | +        | f    | c        | V2  |     |
r
|     |     |     |     |     | A dP |     | 1−πˆ |     |     | 2φ A2 | ∆P  | (1−πˆ ) |     |
| --- | --- | --- | --- | --- | ---- | --- | ---- | --- | --- | ----- | --- | ------- | --- |
| e   |     |     |     |     | m    |     |      | f   |     | c m   |     | f       |     |
b
l
|     | simpli(cid:28)ed |     | to  |     |     |     |     |     |     |     |     |     |     |
| --- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
A
|     |     |     |     |     |     |     | (cid:32) | Jw0 | (cid:33) |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | -------- | --- | --- | --- | --- |
|     |     |     |     |     | t   |     | 1+πˆ     |     |          | MFI |     |     |     |
f kc
|     |     |     |     |     |     | = C |     |      | +   |       | V   |     | (105) |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | ----- | --- | --- | ----- |
|     |     |     |     |     | V   |     | 1   | 1−πˆ |     | (1−πˆ | )   |     |       |
|     |     |     |     |     |     |     |     | f    |     |       | f   |     |       |
21

where 7
π R 1
f obs
πˆ = (106)
f 0
∆P
2
indicates the ratio of the osmotic pressure of the net concentration π f R obs to the -
8
applied pressure ∆P. Now, we can take the proportional constant of Vin Eq. (105)
2
to de(cid:28)ne the combined fouling index (CFI) as
-
8
MFI 0
CFI = (107)
1−πˆ f ,
l
a
The absence of the salt ions in the feed stream can be considered bny setting πˆ
f
= 0
which makes CFI converge to MFI and Eq. (105) equal to (91). rIn this case, appli-
u
cations are limited to MF or UF processes. The fouling tendency of RO desalination
o
can be quanti(cid:28)ed using the CP factor β, de(cid:28)ned as
J
β = C /C e (108)
m f
n
a
which can be calculated using the measured permeate (cid:29)ux J and the empirically-
r w
determined mass transfer coe(cid:30)cient k in Eq.b(27). In addition to β, CFI can be
f
used to estimate the combined fouling tenmdency in the presence of both ionic and
particulate species. Note that CFI is alweays larger than MFI. For example, if ∆P is
set as twice seawater osmotic pressurMe π , then we calculate π = 2π /π = 2 and
sw (cid:101)f sw sw
CFI = 2 MFI using Eq. (107). Related experimental and modeling studies can be
found elsewhere [42(cid:21)45]. n
i
d
3. Concluding Remarks
e
t
In this study, I brpie(cid:29)y reviewed the fundamentals of reverse osmosis processes,
based on the solutioen-di(cid:27)usion model. Speci(cid:28)c variations of output variables such as
c
concentrations and out(cid:29)ow rates of the permeate and brine streams are characterized
c
with respect ato the input and operating parameters. Transverse variations of the
solute concentration are reviewed by solving the decoupled convection-di(cid:27)usion equa-
,
m
tion. Mulder’s theory is discussed to explain the longitudinal variations of permeate
(cid:29)ux, wihichprimarilycontrolstherejectionandrecoveryratios. Thesolution-di(cid:27)usion
K
model was also reviewed using principles and concepts of statistical mechanics. Fi-
.nally, the degree of combined fouling (by both ionic solutes and particulate materials)
S
is quanti(cid:28)ed using a novel combined fouling index (CFI) as an extension of the mod-
ti(cid:28)ed fouling index (MFI).
r
e In environmental engineering, which is the discipline closest to mother nature, a
b holistic understanding of transport phenomena at the basic level of thermodynamics,
l
statistical mechanics, and (cid:29)uid mechanics is as important as practically dealing with
A
designing, optimizing, and maintaining speci(cid:28)c processes. Hopefully, this incomplete
manuscript can be a stepping stone for future membrane engineers, who may resolve
the impending global water shortage.
22

7
1
0
2
-
8
2
-
8
0
,
l
a
n
r
u
o
J
e
n
a
r
(a) (b)
b
m
Figure 1. (a) Assembling (cid:28)lm packages in prototype desalination cell and (b) life test assembly
(Figure 3 and 8 of Ref. [1], respectively. Reprinteed.)
M
n
i
d
e
t
p
e
c
c
a
,
m
i
K
.
S
t
r
e Figure 2. A schematic of the RO process.
b
l
A
23

7
1
0
2
-
8
2
-
8
0
,
l
a
n
r
u
o
J
e
n
a
r
b
m
e
M
n
i
Figure 3. Theoretical causes and e(cid:27)ects in basic RO modeling. Parameters used are T = 25◦C,
d
A = 150m2, A = 1.36×10−7m/s psi, B = 5.0×10−8 m/s, Q = 864 m 3 /day, C = 35g/l,
m e f f
∆P = 800psi. Three variabltes of ∆P, Q
f
and C
f
are selected as independent variable in the (cid:28)rst,
second and third rows, repspectively. Variations of C , Q and C are calculated with respect to one
p p c
independent variable wehile the rest two are kept constant.
c
c
a
,
m
i
K
.
S
t
r
e
b
l
A
24

7
1
0
2
-
8
2
-
8
0
,
l
a
n
r
u
o
J
e
n
a
r
Figure 4. Schematic of concentration pro(cid:28)le acbross the membrane in the cross(cid:29)ow.
m
e
M
n
i
d
e
t
p
e
c
c
a
,
m
i
K
.
S
t
r
e
Figure 5. Schematic of the pure water (cid:29)ux with respect to the applied pressure.
b
l
A
25

7
1
0
2
-
8
2
-
8
0
,
l
a
n
r
u
o
J
e
n
Figure 6. RO schematic with loacal balance.
r
b
m
e
M
n
i
d
e
t
p
e
c
c
a
(cid:29)ow geometry a b c d
,
m
laminar tube 1.62 1/3 1/3 1/3
i laminar rectangular 1.85 1/3 1/3 1/3
K
turbulent tube 0.44 3/4 1/3 0
. turbulent rectangular 0.44 3/4 1/3 0
S
Table 1. Exponents of the mass transfer coe(cid:30)cient in terms of channel geometry and (cid:29)ow regions
t
r
e
b
l
A
26

7
| Appendix |     | A. Appendix |     |     |     |     |     |     |     |     |     |     |
| -------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1
| Appendix | A.1. | Proof | of  | Eq. | (27) |     |     |     |     |     |     | 0   |
| -------- | ---- | ----- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
2
The permeate (cid:29)ux J , the permeate concentration C , and the solute di(cid:27)usivity -
|     |     |     |     | w   |     |     |     |     | p   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
8
D are constant. Eq. (24) is rewritten, using the net or excessive concentration
2
| C(cid:48) = C | −C  |        |     |     |     |            |     |     |     |     |     |     |
| ------------- | --- | ------ | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- |
|               |     | p , as |     |     |     |            |     |     |     |     | -   |     |
|               |     |        |     |     |     | dC(cid:48) |     |     |     |     | 8   |     |
C(cid:48)
|     |     |     |     |     |     | D   | = −J |     |     |     | 0(A.1) |     |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | ------ | --- |
|     |     |     |     |     |     | dy  |      | w   |     |     |        |     |
,
Because only C(cid:48) is a sole function of y, one rewrites Eq. (A.1) as l
a
n
|     |     |     |     |     |     | dC(cid:48) |     | J   |     |     |       |     |
| --- | --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | ----- | --- |
|     |     |     |     |     |     |            |     | w   |     | r   |       |     |
|     |     |     |     |     |     |            | = − | dy  |     |     | (A.2) |     |
|     |     |     |     |     |     | C(cid:48)  |     | D   |     | u   |       |     |
o
| Integration |     | of Eq. | (A.2) | gives |     |     |     |     | J   |     |     |     |
| ----------- | --- | ------ | ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
e
J
|     |     |     |     |     |             |     | w   | n          |     |     |       |     |
| --- | --- | --- | --- | --- | ----------- | --- | --- | ---------- | --- | --- | ----- | --- |
|     |     |     |     |     | lnC(cid:48) | = − | y   | +consta nt |     |     | (A.3) |     |
|     |     |     |     |     |             |     | D   | a          |     |     |       |     |
r
of which the constant is determined using thebboundary condition of Eq. (25):
m
|     |     |     |     |     | ln[C | −C  | ] = | constant |     |     |       |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | -------- | --- | --- | ----- | --- |
|     |     |     |     |     |      | m   | ep  |          |     |     | (A.4) |     |
M
The boundary condition of Eq. (26) on the top of the CP layer provides
n
J
|     |     |     |     |      | i   |     | w   |             |     |     |       |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | ----------- | --- | --- | ----- | --- |
|     |     |     |     | ln[C | −C  | ]   | = − | δ +constant |     |     | (A.5) |     |
|     |     |     |     |      | f   | p   |     | p           |     |     |       |     |
|     |     |     |     |      | d   |     | D   |             |     |     |       |     |
e
| Substitution |     | of Eq. | (A.4t) | in  | (A.5) | generates |     |     |     |     |     |     |
| ------------ | --- | ------ | ------ | --- | ----- | --------- | --- | --- | --- | --- | --- | --- |
p
|     |     |     |     |     |      |     |       | (cid:20) (cid:21) |     |     |       |     |
| --- | --- | --- | --- | --- | ---- | --- | ----- | ----------------- | --- | --- | ----- | --- |
|     |     |     | e   |     | C    | −C  |       | J                 |     |     |       |     |
|     |     |     |     |     | m    | p   |       | w                 |     |     |       |     |
|     |     |     | c   |     |      |     | = exp | +                 |     |     | (A.6) |     |
|     |     |     |     |     | C −C |     |       | D/δ               |     |     |       |     |
|     |     | c   |     |     | f    | p   |       | p                 |     |     |       |     |
a
inwhichthesolutedi(cid:27)usivityperCPlayerthickness,D/δ
m ,referstothemasstransfer
,
coe(cid:30)cie m ntk ofthesamedimensionofthepermeate(cid:29)uxJ . SubstitutionofEq. (A.4)
|     | f   |     |     |     |     |     |     |     | w   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
in (A.i3) gives the solute concentration C(y) as a function of the distance from the
K
| membrane | surface |     | y:     |     |     |          |     |          |     |     |       |     |
| -------- | ------- | --- | ------ | --- | --- | -------- | --- | -------- | --- | --- | ----- | --- |
| .        |         |     |        |     |     | (cid:20) |     | (cid:21) |     |     |       |     |
| S        |         |     | C(y)−C |     |     |          | J y |          |     |     |       |     |
|          |         |     |        |     | p   |          | w   |          |     |     |       |     |
|          |         |     |        |     | =   | exp      | −   | for 0    | < y | < δ | (A.7) |     |
|          |         |     | C      | −C  |     |          | D   |          |     | p   |       |     |
| t        |         |     |        | m   | p   |          |     |          |     |     |       |     |
r
e The concentration exponentially increases from C at the CP layer boundary to C
|     |     |     |     |     |     |     |     | f   |     |     | m   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
b
| on the | membrane |     | surface. |     |     |     |     |     |     |     |     |     |
| ------ | -------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
l
A
27

7
|     | Appendix | A.2. | Dimensionless |     |     | number | analysis |     |     |
| --- | -------- | ---- | ------------- | --- | --- | ------ | -------- | --- | --- |
1
The performance of a membrane is typically estimated using the recovery and
0
rejection ratios, which are primarily determined by A and B, respectively, which are 2
-
intrinsic material properties of the membrane. On the other hand, the mass transfer
8
coe(cid:30)cient k is strongly dependent on (cid:29)uid dynamics and module geometry. 2In
f
repre-sent
engineering and applied sciences, dimensionless numbers are often used to
8
correlations between representative physical quantities. The Sherwood num0ber (Sh)
|     | includes | the | mass | transfer | coe(cid:30)cient |     | such as |     |     |
| --- | -------- | --- | ---- | -------- | ---------------- | --- | ------- | --- | --- |
,
l
a
|     |     |     |     |     | k d | convectivemasstransferate |     |     |       |
| --- | --- | --- | --- | --- | --- | ------------------------- | --- | --- | ----- |
|     |     |     |     | Sh  | = f | h =                       |     |     | (A.8) |
n
|     |     |     |     |     | D   | diffusivemasstransferrate |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------------------- | --- | --- | --- |
r
u
implying the signi(cid:28)cance of the convection over the di(cid:27)usion of solutes, where d is
|     |     |     |     |     |     |     |     | o   | h   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
the hydraulic diameter. The Sherwood number is often repJresented as a function of
|     | Reynolds | (Re) | and | Schmidt | (Sc) | numbers: |     |     |     |
| --- | -------- | ---- | --- | ------- | ---- | -------- | --- | --- | --- |
e
n
|     |     |     |     |     |     |     | (cid:18) d (cid:19)d |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------------------- | --- | --- |
ha
|     |     |     |     |     |     | Sh = aRebScc |     |     | (A.9) |
| --- | --- | --- | --- | --- | --- | ------------ | --- | --- | ----- |
Lr
b
m
where L is the membrane (or channel) length, and a−d are constants. Here, d /L can
h
(cid:29)oew
be considered as the aspect ratio of the channel. The Reynolds number measures
M
a ratio of inertial to viscous forces for given (cid:29)ow conditions, which is de(cid:28)ned as
|     |     |     |     |     |     | nvd   | vρd |     |        |
| --- | --- | --- | --- | --- | --- | ----- | --- | --- | ------ |
|     |     |     |     |     |     |       | h h |     |        |
|     |     |     |     |     |     | iRe = | =   |     | (A.10) |
|     |     |     |     |     |     |       | ν η |     |        |
d
where v is the (cid:29)ow speed e , ρ is the (cid:29)uid density, and η and ν are the absolute and
t
kinematic viscosities,prespectively. In the case of (cid:29)ow through a straight pipe with a
circular cross-sectioen, (cid:29)uid motion will be laminar at Re < 2000, whereas at Re >
c
4000, the (cid:29)ow is turbulent. The Schmidt number represents a ratio of convective to
c
|     | di(cid:27)usive | massatransport: |     |     |     |     |     |     |     |
| --- | --------------- | --------------- | --- | --- | --- | --- | --- | --- | --- |
ν
|     |     |     |     |     |     |     | Sc = |     | (A.11) |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | ------ |
,
|     |     | m   |     |     |     |     | D   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Appenidix A.3. Application of Mulder’s theory to Seawater Desalination
K
An RO desalination process has a feed water of 35,000 ppm and the rejection
.ratio of the selected membrane is reported by a vendor as 99.00%. If the process is
S
operated for 60% recovery, then the permeate concentration is predicted as
t
r
1−(1−0.6)1−0.99
| e   |     |     | ¯   |     |     |     |              |             |        |
| --- | --- | --- | --- | --- | --- | --- | ------------ | ----------- | ------ |
|     |     |     | C = | C   |     |     | = C ×0.01520 | = 532.06ppm | (A.12) |
| b   |     |     | p   | f   | 0.6 |     | f            |             |        |
l
A
|     | If so, one | calculates |     |     |     |     |     |     |     |
| --- | ---------- | ---------- | --- | --- | --- | --- | --- | --- | --- |
C ¯
p
|     |     |     |     |     |     | 1−  | = 0.9848 |     | (A.13) |
| --- | --- | --- | --- | --- | --- | --- | -------- | --- | ------ |
C
f
28

7
which is close enough to 0.9900. If we replace the rejection by 40% (such as that of
1
| nano(cid:28)ltration), |     | then we | calculate |     |     |     |     |     |     |     |     |
| ---------------------- | --- | ------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
0
2
1−(1−0.6)1−0.40
¯ -
|     | C   | = C |     |     |     | = C | ×0.7048 | =   | 24670.33ppm |     | (A.14)8 |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- | ----------- | --- | ------- |
|     |     | p f |     |     |     |     | f       |     |             |     |         |
0.6
2
-
and
|     |     |     |     |     |     | ¯   |     |     |     |     | 8   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C
|     |     |     |     |     |     | p   |        |     |     |     | 0      |
| --- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | ------ |
|     |     |     |     |     | 1−  | =   | 0.2951 |     |     |     | (A.15) |
C
f
,
l
| which is di(cid:27)erent |     | from | 40%. |     |     |     |     |     |     | a   |     |
| ------------------------ | --- | ---- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
n
r
| References |     |     |     |     |     |     |     |     | u   |     |     |
| ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
o
[1] S. Loeb, S. Sourirajan, (cid:16)Sea Water Demineralization bJy means of semipermeable
| membrane(cid:17), |     | UCLA | report | 60  | (60) | (1960) | 1(cid:21)35. |     |     |     |     |
| ----------------- | --- | ---- | ------ | --- | ---- | ------ | ------------ | --- | --- | --- | --- |
e
n
| [2] D. Talbot, |     | (cid:16)Megascale |     | Desalination(cid:17), |     | MIT | Tecahnology |     | Review |     |     |
| -------------- | --- | ----------------- | --- | --------------------- | --- | --- | ----------- | --- | ------ | --- | --- |
r
[3] S. Loeb, (cid:16)The Loeb-Sourirajan Membraneb: How It Came About(cid:17), in: Synthetic
m
| Membranes:, |     | Vol. | 153, | American | Chemical |     | Society, |     | 1981, pp. | 1(cid:21)9, |     |
| ----------- | --- | ---- | ---- | -------- | -------- | --- | -------- | --- | --------- | ----------- | --- |
e
[4] J. Glater, (cid:16)The early history of rMeverse osmosis membrane development(cid:17), Desali-
| nation | 117 | (1-3) (1998) |     | 297(cid:21)309. |     |     |     |     |     |     |     |
| ------ | --- | ------------ | --- | --------------- | --- | --- | --- | --- | --- | --- | --- |
n
| [5] S. Sourirajan, |     | Reverse |     | Osmiosis, | Academic |     | Press, | 1970. |     |     |     |
| ------------------ | --- | ------- | --- | --------- | -------- | --- | ------ | ----- | --- | --- | --- |
d
[6] C. E. Reid, E. J. Breton, (cid:16)Water and ion (cid:29)ow across cellulosic membranes(cid:17),
e
| Journal | of  | AppliedtPolymer |     | Science |     | 1 (2) | (1959) | 133(cid:21)143. |     |     |     |
| ------- | --- | --------------- | --- | ------- | --- | ----- | ------ | --------------- | --- | --- | --- |
p
[7] T. A. Oro(cid:28)no, e H. B. Hopfenberg, V. Stannett, (cid:16)Characterization of penetrant
c
clustering icn polymers(cid:17), Journal of Macromolecular Science, Part B 3 (4) (1969)
777(cid:21)788,a
,
[8] H.mK. Lonsdale, U. Merten, R. L. Riley, (cid:16)Transport properties of cellulose acetate
| osmotic | membrane(cid:17), |     | J.  | Appl. | Polymer | Sci. | 9 (1965) |     | 1341(cid:21)1362. |     |     |
| ------- | ----------------- | --- | --- | ----- | ------- | ---- | -------- | --- | ----------------- | --- | --- |
i
K
[9] R. L. Riley, H. K. Lonsdale, C. R. Lyons, U. Merten, (cid:16)Preparation of ultrathin
.
Sreverse osmosis membranes and the attainment of theoretical salt rejection(cid:17),
| Journal | of  | Applied | Polymer | Science |     | 11  | (11) (1967) |     | 2143(cid:21)2158, |     |     |
| ------- | --- | ------- | ------- | ------- | --- | --- | ----------- | --- | ----------------- | --- | --- |
t
r
e [10] T. K. Sherwood, (cid:16)Desalination by Reverse Osmosis Process(cid:17), Kobunshi 17 (4)
| b (1968) | 300(cid:21)305. |     |     |     |     |     |     |     |     |     |     |
| -------- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
l
A
[11] J. P. Agrawal, S. Sourirajan, (cid:16)Speci(cid:28)cation, Selectivity, and Performance of
Porous Cellulose Acetate Membranes in Reverse Osmosis(cid:17), Industrial & Engi-
neering Chemistry Process Design and Development 8 (4) (1969) 439(cid:21)449,
29

[12] E. Glueckauf, (cid:16)The distribution of electrolytes between cellulose acetate mem- 7
1
branes and aqueous solutions(cid:17), Desalination 18 (2) (1976) 155(cid:21)172,
0
2
[13] J.Wijmans, R.Baker, (cid:16)Thesolution-di(cid:27)usionmodel: areview(cid:17), JournalofMem-
-
brane Science 107 (1-2) (1995) 1(cid:21)21, 8
2
[14] D. R. Paul, (cid:16)Reformulation of the solution-di(cid:27)usion theory of reverse osmo-sis(cid:17),
8
Journal of Membrane Science 241 (2) (2004) 371(cid:21)386. 0
[15] L. Onsager, (cid:16)Reciprocal relations in irreversible processes. I.(cid:17), Physi,cal Review
l
a
37 (4) (1931) 405(cid:21)426.
n
r
[16] L. Onsager, (cid:16)Reciprocal relations in irreversible processes. II(cid:17), Physical Review
u
38 (12) (1931) 2265(cid:21)2279.
o
J
[17] O. Kedem, A. Katchalsky, (cid:16)Thermodynamic analysis of the permeability of bio-
e
logical membranes to non-electrolytes(cid:17), Biochimica et Biophysica Acta 27 (1958)
n
229(cid:21)246,
a
r
[18] K. S. Spiegler, O. Kedem, (cid:16)Thermodynambics of hyper(cid:28)ltration (reverse osmosis):
criteria for e(cid:30)cient membranes(cid:17), Desaml. 1 (4) (1966) 311(cid:21)326,
e
[19] M. Soltanieh, W. N. Gill, (cid:16)Review of reverse osmosis membranes and transport
M
models(cid:17), Chemical Engineering Communications 12 (4-6) (1981) 279(cid:21)363,
n
[20] D. Potts, R. Ahlert, S. Wang, (cid:16)A critical review of fouling of reverse osmosis
i
membranes(cid:17), Desalination 36 (1981) 235(cid:21)264.
d
e
[21] M. F. A. Goosen, S. S. Sablani, H. Al-Hinai, S. Al-Obeidani, R. Al-Belushi,
t
D. Jackson, (cid:16)Foupling of Reverse Osmosis and Ultra(cid:28)ltration Membranes: A Crit-
ical Review(cid:17), Seeparation Science and Technology 39 (10) (2005) 2261(cid:21)2297,
c
c
[22] D. Li, H. Wang, (cid:16)Recent developments in reverse osmosis desalination mem-
a
branes(cid:17), Journal of Materials Chemistry 20 (22) (2010) 4551.
,
m
[23] S. Sobana, R. C. Panda, (cid:16)Identi(cid:28)cation, Modelling, and Control of Continu-
oius Reverse Osmosis Desalination System: A Review(cid:17), Separation Science and
K
Technology 46 (4) (2011) 551(cid:21)560,
.
S[24] K. P. Lee, T. C. Arnot, D. Mattia, (cid:16)A review of reverse osmosis membrane
t materials for desalination-Development to date and future potential(cid:17) (2011).
r
e [25] L.Malaeb, G.M.Ayoub, (cid:16)Reverseosmosistechnologyforwatertreatment: State
b
of the art review(cid:17) (2011).
l
A
[26] S. Sablani, M. Goosen, R. Al-Belushi, M. Wilf, (cid:16)Concentration polarization in
ultra(cid:28)ltrationandreverseosmosis: Acriticalreview(cid:17), Desalination141(3)(2001)
269(cid:21)289.
30

[27] G. Amy, N. Gha(cid:27)our, Z. Li, L. Francis, R. V. Linares, T. Missimer, S. Latte- 7
1
mann, (cid:16)Membrane-based seawater desalination: Present and future prospects(cid:17),
0
Desalination 401 (2017) 16(cid:21)21,
2
-
[28] M.A.Shannon,P.W.Bohn,M.Elimelech,J.G.Georgiadis,B.J.Mariæas,A.M8.
2
Mayes, (cid:16)Science and technology for water puri(cid:28)cation in the coming decades(cid:17),
-
Nat. 452 (20) (2008) 301(cid:21)310. 8
0
[29] M. Elimelech, W. A. Phillip, (cid:16)The future of seawater desalination: energy, tech-
,
l
nology, and the environment.(cid:17), Science (New York, N.Y.) 333 (604a3) (2011) 712(cid:21)
7, n
r
u
[30] B. E. Logan, M. Elimelech, (cid:16)Membrane-based processes for sustainable power
o
generation using water(cid:17), Nature 488 (7411) (2012) 313(cid:21)319,
J
[31] H. B. Park, J. Kamcev, L. M. Robeson, M. Elimeelech, B. D. Freeman, (cid:16)Maxi-
n
mizing the right stu(cid:27): The trade-o(cid:27) between membrane permeability and selec-
a
tivity.(cid:17), Science (New York, N.Y.) 356 (6343),
r
b
[32] W. J. Koros, C. Zhang, (cid:16)Materials formnext-generation molecularly selective syn-
thetic membranes(cid:17), Nature Materials 16 (3) (2017) 289(cid:21)297,
e
M
[33] H. K. Lonsdale, U. Merten, R. L. Riley, (cid:16)Transport Properties of Cellulose Ac-
etate Osmotic Membranes(cid:17), J. Appl. Polymer Sci. 9 (1965) 1341(cid:21)1362.
n
i
[34] M. Mulder, Basic Principles of Membrane Technology, Kluwer Academic Pub-
d
lishers, Boston, 1996.
e
t
[35] A. L. Zydney, C.pK. Colton, (cid:16)A concentration polarization model for the (cid:28)ltrate
(cid:29)ux in cross-(cid:29)oew micro(cid:28)ltration of particulate suspensions(cid:17), Chem. Eng. Comm.
c
47 (1986) 1(cid:21)21.
c
a
[36] A. Zydney, (cid:16)Stagnant (cid:28)lm model for concentration polarization in membrane
,
sysmtems(cid:17), J. Membr. Sci. 130 (1-2) (1997) 275(cid:21)281,
i
[37K] A. S. Kim, (cid:16)Permeate (cid:29)ux in(cid:29)ection due to concentration polarization in cross-
(cid:29)ow membrane (cid:28)ltration: A novel analytic approach(cid:17), The European Physical
.
Journal E 24 (4) (2008) 331,
S
t[38] J. C. Schippers, J. Verdouw, (cid:16)The modi(cid:28)ed fouling index, a method of determin-
r
e ing the fouling characteristics of water(cid:17), Desalination 32 (C) (1980) 137(cid:21)148.
b
l [39] S. Khirani, R. Ben Aim, M. H. Manero, (cid:16)Improving the measurement of the
A
Modi(cid:28)edFoulingIndexusingnano(cid:28)ltrationmembranes(NF-MFI)(cid:17),Desalination
191 (1-3) (2006) 1(cid:21)7.
31

[40] G. Mason, (cid:16)Radial Distribution of the random close packing of equal spheres(cid:17), 7
1
Nature 217 (1968) 733 (cid:21) 735,
0
2
[41] W. M. Visscher, M. Bolsterli, (cid:16)Random packing of equal and unequal spheres in
-
two and three dimensions(cid:17), Nature 239 (1972) 504(cid:21)507. 8
2
-
[42] A. E. Contreras, A. S. Kim, Q. Li, (cid:16)Combined fouling of nano(cid:28)ltration mem-
8
branes: Mechanisms and e(cid:27)ect of organic matter(cid:17), J. Membr. Sci. 3207 (2009)
87(cid:21)95.
,
l
a
[43] A. S. Kim, A. E. Contreras, Q. Li, R. Yuan, (cid:16)Fundamental Mechanism of
n
Three-Component Combined Fouling with Experimental Verir(cid:28)cation(cid:17), Langmuir
u
25 (14) (2009) 7815(cid:21)7827.
o
J
[44] Y. Yu, S. Lee, K. Hong, S. Hong, (cid:16)Evaluation of membrane fouling potential by
multiple membrane array system (MMAS): Measuerements and applications(cid:17), J.
n
Membr. Sci. 362 (1-2) (2010) 279(cid:21)288,
a
r
[45] Y. Kim, M. Elimelech, H. K. Shon, S. Hong, (cid:16)Combined organic and colloidal
b
fouling in forward osmosis: Fouling revmersibility and the role of applied pressure(cid:17),
Journal of Membrane Science 460 (2014) 206(cid:21)212.
e
M
n
i
d
e
t
p
e
c
c
a
,
m
i
K
.
S
t
r
e
b
l
A
32