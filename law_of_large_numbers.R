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
sample_sizes <- c(10, 100, 1000, 10000, 100000)
results <- sapply(sample_sizes, simulate_mean)

data.frame(Sample_Sizes = sample_sizes, Sample_Mean = results)


