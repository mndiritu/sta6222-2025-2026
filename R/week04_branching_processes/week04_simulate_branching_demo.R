## ---- 1. Simulation function (single run as tidy df) ----

simulate_branching_df <- function(run_id, R0, max_gen = 15) {
  Z <- numeric(max_gen)
  Z[1] <- 1  # start with one infected
  
  for (g in 1:(max_gen - 1)) {
    Z[g + 1] <- sum(rpois(Z[g], R0))
    if (Z[g + 1] == 0) {
      if (g + 1 < max_gen) {
        Z[(g + 2):max_gen] <- 0
      }
      break
    }
  }
  
  data.frame(
    run        = factor(run_id),
    generation = 0:(max_gen - 1),
    Z          = Z,
    R0         = R0
  )
}

## ---- 2. Generate simulations for several R0 values ----

set.seed(123)

R0_values <- c(0.8, 1.1, 1.5, 2.5)  # tweak as you like
max_gen   <- 15
n_sims    <- 40                     # number of runs per R0

sim_list <- list()

for (R0 in R0_values) {
  sims_R0 <- lapply(
    X   = 1:n_sims,
    FUN = simulate_branching_df,
    R0  = R0,
    max_gen = max_gen
  )
  sim_list[[as.character(R0)]] <- do.call(rbind, sims_R0)
}

sim_df <- do.call(rbind, sim_list)
sim_df$R0 <- factor(sim_df$R0, levels = R0_values)

## ---- 3. Plot faceted trajectories with ggplot2 ----

library(ggplot2)

ggplot(sim_df, aes(x = generation, y = Z, group = run)) +
  geom_line(alpha = 0.5) +
  scale_y_continuous(trans = "log1p") +  # log(1+Z) so extinction + explosions both visible
  facet_wrap(~ R0, labeller = label_bquote(R[0] == .(as.character(R0)))) +
  labs(
    title = "Branching Process Simulations for Different R\u2080 Values",
    x     = "Generation",
    y     = "Number of infections Z[n] (log scale)"
  ) +
  theme_minimal()

