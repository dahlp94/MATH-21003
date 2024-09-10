# Load necessary libraries
library(ggplot2)

# Generate sample data
set.seed(0)
data <- rnorm(100, mean = 50, sd = 10)

## Descriptive Statistics
mean_value <- mean(data)
median_value <- median(data)
sd_value <- sd(data)
range_value <- range(data)

# Print results
cat("Descriptive Statistics:\n")
cat(paste("Mean:", round(mean_value, 2), "\n"))
cat(paste("Median:", round(median_value, 2), "\n"))
cat(paste("Standard Deviation:", round(sd_value, 2), "\n"))
cat(paste("Range:", round(range_value[2] - range_value[1], 2), "\n\n"))

## Data Visualization
# Histogram
hist_plot <- ggplot(data.frame(data), aes(x = data)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Sample Data", x = "Values", y = "Frequency")
ggsave("histogram.png", hist_plot, width = 8, height = 6)

# Box plot
box_plot <- ggplot(data.frame(data), aes(y = data)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Box Plot of Sample Data", y = "Values")
ggsave("boxplot.png", box_plot, width = 8, height = 6)

## Probability Distributions
x <- seq(-4, 4, length = 100)
y <- dnorm(x)
norm_dist_plot <- ggplot(data.frame(x, y), aes(x = x, y = y)) +
  geom_line() +
  labs(title = "Standard Normal Distribution", x = "Z-score", y = "Density")
ggsave("normal_distribution.png", norm_dist_plot, width = 8, height = 6)

## Hypothesis Testing
t_test_result <- t.test(data, mu = 50)
cat("One-sample t-test results:\n")
print(t_test_result)
cat("\n")

## Correlation
x <- rnorm(100)
y <- 0.5 * x + rnorm(100, sd = 0.5)
correlation <- cor(x, y)
cat(paste("Correlation:", round(correlation, 2), "\n\n"))

# Scatter plot
scatter_plot <- ggplot(data.frame(x, y), aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Scatter Plot of Correlated Variables", x = "X", y = "Y")
ggsave("scatter_plot.png", scatter_plot, width = 8, height = 6)

cat("All visualizations have been saved in the working directory.\n")

