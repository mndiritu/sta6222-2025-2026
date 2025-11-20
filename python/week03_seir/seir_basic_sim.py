import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def seir(y, t, beta, sigma, gamma):
    S, E, I, R = y
    dS = -beta * S * I
    dE = beta * S * I - sigma * E
    dI = sigma * E - gamma * I
    dR = gamma * I
    return [dS, dE, dI, dR]

beta, sigma, gamma = 0.5, 0.2, 0.1
y0 = [0.99, 0.01, 0, 0]
t = np.linspace(0, 200, 200)

res = odeint(seir, y0, t, args=(beta, sigma, gamma))

plt.plot(t, res)
plt.legend(["S", "E", "I", "R"])
plt.xlabel("Time (days)")
plt.ylabel("Proportion")
plt.title("SEIR model – STA 6222 Week 3")
plt.show()
