# Extinction probability for a Poisson branching process
# G(s) = exp(R0 * (s - 1))
extinction_prob_poisson <- function(R0, tol = 1e-8, max_iter = 1000) {
  # If R0 <= 1, extinction is certain
  if (R0 <= 1) {
    return(1.0)
  }
  
  # Start away from 1 so we don't get the trivial root
  p <- 0.5
  
  for (i in 1:max_iter) {
    new_p <- exp(R0 * (p - 1))
    if (abs(new_p - p) < tol) {
      return(new_p)
    }
    p <- new_p
  }
  
  # If it didn't converge, just return the last value
  return(p)
}

# Generate values of R0 and corresponding extinction probabilities
R0_vals <- seq(0, 5, length.out = 200)
p_vals  <- sapply(R0_vals, extinction_prob_poisson)

# Plot
plot(
  R0_vals, p_vals, type = "l",
  xlab = expression(R[0]),
  ylab = "Extinction probability p",
  main = "Extinction Probability vs R\u2080 (Poisson Branching Process)"
)
abline(v = 1, lty = 2)  # threshold at R0 = 1
grid()
