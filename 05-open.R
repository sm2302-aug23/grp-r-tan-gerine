#example for task 5
library(dplyr)
library(ggplot2)


# Calculate the stopping time for each sequence
collatz_df <- collatz_df %>%
  mutate(stopping_time = sapply(seq, function(x) {
    index <- which(x < start)[1]  # Find the index where the sequence goes below the start
    if (is.na(index)) {
      return(length(x))  # If it never goes below, use the length of the sequence
    } else {
      return(index)  # Otherwise, use the index
    }
  }))

# The most common stopping times
common_stopping_times <- collatz_df %>%
  group_by(stopping_time) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

# Visualize the most common stopping times
ggplot(common_stopping_times, aes(x = stopping_time, y = count)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Most Common Stopping Times in Collatz Sequences",
    x = "Stopping Time",
    y = "Frequency"
  ) +
  theme_minimal()
