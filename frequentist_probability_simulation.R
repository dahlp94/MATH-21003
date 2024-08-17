# We will simulate flipping a fair coin 10000 times and calculate 
# the probability of getting heads.
# H: Head  T: Tail
# We will perform sample with replacement
coin_flips <- sample(c("H", "T"), size = 10000, replace = TRUE)

# Now let us calculate the probability of getting heads
prob_heads <- sum(coin_flips == "H") / length(coin_flips)

# Print the estimated probability
cat("The estimated robability of anding a heads is:", prob_heads)


# Function to find streaks of a specific outcome
find_streaks <- function(flips, outcome, streak_length) {
  # get the length and values of the run length encoding
  streaks <- rle(flips)$length
  outcomes <- rle(flips)$values
  
  # find out how many streaks are greater than or equal to
  # the streak_length
  sum(streaks[outcomes == outcome] >= streak_length)
}

# Now let us find the probability of getting 3 or more
# heads in a row
streak_length <- 3
num_streaks_heads <- find_streaks(flips = coin_flips, 
                                  outcome = "H",
                                  streak_length = streak_length)
prob_streak_head <- num_streaks_heads / length(coin_flips)
cat("The estimated probability of landing 3 or more heads in a row is:", 
    prob_streak_head)
