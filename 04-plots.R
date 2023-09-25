## Task 4----------------------------------------------------------------

# 1
top_ten <- backtracks_df %>%
  arrange(desc(Length)) %>%
  slice(1:10)
top_ten

ggplot(
  data = backtracks_df,
  mapping = aes(x = start,
                y = Length)
) +
  geom_point() +
  labs(
    x = "Starting Integer",
    y = "Sequence Length"
  ) +
  gghighlight(
    Length >= min(top_ten$Length)
  )

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
ggplot(
  data = backtracks_df,
  mapping = aes(
    x = Parity,
    y = Length
  )
) +
  geom_boxplot()
