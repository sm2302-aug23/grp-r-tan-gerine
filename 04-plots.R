## Task 4----------------------------------------------------------------

# 1
ggplot(
  data = backtracks_df,
  mapping = aes(x = start,
                y = Length)
) +
  geom_point()

# 2
ggplot(
  data = backtracks_df,
  mapping = aes(x = start,
                y = max_val)
) +
  geom_point() +
  labs(x = "Starting Integer", y = "Maximum Value") +
  theme_minimal()

# 3
