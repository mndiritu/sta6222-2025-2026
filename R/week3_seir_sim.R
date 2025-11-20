# Simple SEIR simulation for STA 6222 – Week 3
library(deSolve)

seir <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta * S * I
    dE <- beta * S * I - sigma * E
    dI <- sigma * E - gamma * I
    dR <- gamma * I
    list(c(dS, dE, dI, dR))
  })
}

params <- c(beta = 0.5, sigma = 0.2, gamma = 0.1)
state  <- c(S = 0.99, E = 0.01, I = 0, R = 0)
times  <- seq(0, 200, by = 1)

out <- ode(y = state, times = times, func = seir, parms = params)
matplot(out[,1], out[,-1], type = "l", lwd = 2)
legend("right", legend = c("S", "E", "I", "R"), lty = 1, col = 1:4)
