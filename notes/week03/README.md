# Week 3 – SEIR Models (Latent Period)

This week we extend the SIR model by adding an **Exposed (E)** compartment to capture
the **latent period** between infection and infectiousness.

## 1. Learning goals

By the end of Week 3, you should be able to:

- Explain the difference between **latent period** and **incubation period**
- Write down the **SEIR system of ODEs** and interpret each term biologically
- Use **R** or **Python** to simulate SEIR dynamics
- Explore how changing the **latent period (sigma)** affects:
  - speed of epidemic growth
  - timing and height of the peak
  - overall epidemic shape

## 2. Lecture materials

- Slides: _Week 3 – SEIR Models_  
  - (Add link or filename, e.g. `slides/week03/Week3_SEIR_lecture.pdf`)
- Handout: _Week 3 SEIR Handout_  
  - (Add link or filename, e.g. `notes/week03/Week3_SEIR_handout.pdf`)

## 3. Code examples

### R

Folder: `R/week03_seir/`

Suggested starting script:

- `seir_basic_sim.R` – basic deterministic SEIR model using `deSolve`

What it does:

- defines the SEIR ODE system
- runs a simulation over a fixed time horizon
- plots S, E, I, R curves on one graph
- allows you to modify `beta`, `sigma`, `gamma` and initial conditions

### Python

Folder: `python/week03_seir/`

Suggested starting script:

- `seir_basic_sim.py` – basic deterministic SEIR model using `scipy.integrate.odeint`

What it does:

- defines the SEIR ODE system
- integrates the system over time
- plots S, E, I, R curves using `matplotlib`
- allows you to modify `beta`, `sigma`, `gamma` and initial conditions

## 4. Suggested experiments for self-study

1. **Vary the latent period (sigma)**  
   - Try `sigma = 0.1`, `0.2`, `0.5` with `beta` and `gamma` fixed  
   - Observe changes in:
     - time to peak
     - peak height
     - overall duration of the epidemic

2. **Introduce an intervention**  
   - At a chosen time (e.g. day 60), reduce `beta` by 40%  
   - Compare curves with and without intervention  
   - Reflect on how timing of interventions interacts with latent period

3. **Change initial conditions**  
   - Reduce the initial exposed fraction `E0` (e.g. from 0.01 to 0.001)  
   - See how this affects early growth and apparent “delay” in cases

## 5. Assessment links (if applicable)

- Week 3 quiz / CAT: (add link when available)
- Any additional exercises or problem sets: (add links/filenames here)

---

If you have issues running the code, see:

- `notes/python_env.md` for Python setup  
- (Optional) R environment notes if added later.
