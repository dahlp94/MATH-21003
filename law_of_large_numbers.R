# Demonstrating Law of Large Numbers
set.seed(1)

# We define the population parameters
true_mean <- 10
true_sd <- 2

# Simulation
simulate_mean <- function(n) {
  samples <- rnorm(n, mean = true_mean, sd = true_sd)
  return(mean(samples))
}

# Simulating for different sample sizes
sample_sizes <- c(10, 10^2, 10^3, 10^4, 10^5, 10^6, 10^7)
results <- sapply(sample_sizes, simulate_mean)

data.frame(Sample_Sizes = sample_sizes, Sample_Mean = results)

# Plot results
plot(log10(sample_sizes), results, type = "b",
     xlab = "Sample Size in Base 10",
     y_lab = "Sample Mean",
     main = "Law of Large Numbers Example",
     ylim = c(true_mean - 0.5, true_mean + 0.5),
     )

abline(h = true_mean, col = "red", lty = 2, lwd = 2)

# This demonstration shows that larger samples give us better estimates 
# of the true average, which is the main idea behind the Law of Large Numbers.

