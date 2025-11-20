# -------------------------------------------------------------
# Course : STA 6222 – Models for Disease Transmission and Management
# Year   : 2025–2026
# Week   : 03 – SEIR Models (Latent Period)
# Script : week3_seir_class_demo.R
# Purpose: In-class demonstration using pre-generated SEIR scenario dataset
#
# Learning objectives:
#   - Load and explore SEIR simulations from a companion dataset
#   - Visualise differences between scenarios
#   - Interpret how sigma (latent period) affects epidemic timing
# -------------------------------------------------------------

# Load dataset
df <- read.csv("data/week3_seir_simulations.csv")   # Replace with: "data/week3_seir_simulations.csv"

# Examine structure
head(df)
unique(df$scenario_id)

# Filter scenarios
baseline     <- subset(df, scenario_id == "baseline")
long_latent  <- subset(df, scenario_id == "long_latent")
short_latent <- subset(df, scenario_id == "short_latent")
high_trans   <- subset(df, scenario_id == "high_transmission")

# --- Plot 1: Infectious curves: baseline vs long latent ---
plot(baseline$time, baseline$I, type="l", lwd=2,
     xlab="Time (days)", ylab="Proportion Infectious", col="blue",
     main="Baseline vs Long Latent Period")
lines(long_latent$time, long_latent$I, lwd=2, col="red", lty=2)
legend("topright", legend=c("Baseline","Long Latent"),
       col=c("blue","red"), lty=c(1,2), lwd=2)

# --- Plot 2: Compare all four scenarios ---
plot(baseline$time, baseline$I, type="l", lwd=2, col="blue",
     xlab="Time (days)", ylab="Proportion Infectious",
     main="Comparison of Four SEIR Scenarios")
lines(long_latent$time,   long_latent$I,   col="red",    lty=2, lwd=2)
lines(short_latent$time,  short_latent$I,  col="green",  lty=3, lwd=2)
lines(high_trans$time,    high_trans$I,    col="purple", lty=4, lwd=2)
legend("topright",
       legend=c("Baseline","Long Latent","Short Latent","High Transmission"),
       col=c("blue","red","green","purple"), lty=1:4, lwd=2)
