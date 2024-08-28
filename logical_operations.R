# Using R to calculate probabilities involving AND and OR operations.

# number of trials
n <- 10

# probability of success
p <- 0.3

# Probability of excatly k success
k <- 3
# Density at x = 3
p_3 <- dbinom(x = k, size = n, prob = p)
cat("P(X = 3) =", round(p_3, 3))

# Probability of At Least k Successes (OR)
p_3_or_more <- pbinom(q = k, size = n, prob = p, lower.tail = FALSE)

# Another way to display
paste("P(X >= 3) =", round(p_3_or_more, 3))

# Probability of a Range (AND)
# Probability of 3 and 7 success (inclusive)
p_3_to_7 <- pbinom(q = 7, size = n, prob = p, lower.tail = FALSE) -
  pbinom(q = 2, size = n, prob = p, lower.tail = FALSE)










