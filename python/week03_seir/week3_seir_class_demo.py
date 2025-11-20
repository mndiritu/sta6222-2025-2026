# -------------------------------------------------------------
# Course : STA 6222 – Models for Disease Transmission and Management
# Year   : 2025–2026
# Week   : 03 – SEIR Models (Latent Period)
# Script : week3_seir_class_demo.py
# Purpose: In-class demonstration using pre-generated SEIR scenario dataset
#
# Learning objectives:
#   - Load and explore SEIR simulations from a companion dataset
#   - Visualise differences between scenarios
#   - Interpret how sigma (latent period) affects epidemic timing
# -------------------------------------------------------------

import pandas as pd
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("week3_seir_simulations.csv")   # Replace with: "data/week3_seir_simulations.csv"

# Check structure
print(df.head())
print(df["scenario_id"].unique())

# Extract scenarios
baseline = df[df["scenario_id"] == "baseline"]
long_latent = df[df["scenario_id"] == "long_latent"]
short_latent = df[df["scenario_id"] == "short_latent"]
high_trans = df[df["scenario_id"] == "high_transmission"]

# --- Plot 1: Baseline vs Long Latent ---
plt.plot(baseline["time"], baseline["I"], label="Baseline", linewidth=2)
plt.plot(long_latent["time"], long_latent["I"], label="Long Latent", linestyle="--", linewidth=2)
plt.xlabel("Time (days)")
plt.ylabel("Proportion Infectious")
plt.title("Baseline vs Long Latent Period")
plt.legend()
plt.show()

# --- Plot 2: Compare all four scenarios ---
plt.plot(baseline["time"], baseline["I"],       label="Baseline",          linewidth=2)
plt.plot(long_latent["time"], long_latent["I"], label="Long Latent",       linestyle="--", linewidth=2)
plt.plot(short_latent["time"], short_latent["I"], label="Short Latent",    linestyle=":", linewidth=2)
plt.plot(high_trans["time"], high_trans["I"],   label="High Transmission", linestyle="-.", linewidth=2)
plt.xlabel("Time (days)")
plt.ylabel("Proportion Infectious")
plt.title("Comparison of SEIR Scenarios")
plt.legend()
plt.show()
