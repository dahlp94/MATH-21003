library(ggplot2)
library(gganimate)
library(gifski)

# Function to generate samples and create an animated plot
create_clt_animation <- function(population, sample_sizes, num_samples) {
  all_samples <- data.frame()
  
  for (size in sample_sizes) {
    samples <- replicate(num_samples, mean(sample(population, size, replace = TRUE)))
    all_samples <- rbind(all_samples, data.frame(sample_mean = samples, 
                                                 sample_size = size))
  }
  
  p <- ggplot(all_samples, aes(x = sample_mean)) +
    geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "skyblue", color = "black") +
    geom_density(color = "red") +
    stat_function(fun = dnorm, 
                  args = list(mean = mean(population), 
                              sd = sd(population) / sqrt(sample_sizes)),
                  color = "blue", linetype = "dashed") +
    labs(title = "Sample Size: {closest_state}",
         x = "Sample Mean", y = "Density") +
    theme_minimal() +
    transition_states(sample_size, transition_length = 2, state_length = 1) +
    ease_aes('cubic-in-out')
  
  return(p)
}

# Generate a non-normal population (e.g., exponential distribution)
set.seed(123)
population <- rexp(10000, rate = 0.5)

# Define sample sizes to demonstrate CLT
sample_sizes <- c(2, 5, 10, 30, 50, 100)

# Create the animation
anim <- create_clt_animation(population, sample_sizes, num_samples = 1000)

# Render and save the animation
animated_plot <- animate(anim, nframes = 200, fps = 10, width = 800, height = 600, renderer = gifski_renderer())
anim_save("clt_demonstration.gif", animation = animated_plot)

