library(ggplot2)
library(gghighlight)
library(ggrepel)
library(DescTools)

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
  geom_point(
    color = "red"
  ) +
  labs(
    x = "Starting Integer",
    y = "Sequence Length"
  ) +
  gghighlight(
    Length >= min(top_ten$Length)
  ) +
  geom_text_repel(data = top_ten,
                  aes(label = start))

# 2
top_ten_max <- backtracks_df %>%
  arrange(desc(max_val)) %>%
  slice(1:10)
top_ten_max

ggplot(
  data = backtracks_df,
  mapping = aes(x = start,
                y = max_val)
) +
  geom_point() +
  labs(x = "Starting Integer", y = "Maximum Value") +
  gghighlight(
    max_val >= min(top_ten_max$max_val)
  ) +
  geom_text_repel(data = top_ten_max,
                  aes(label = start)) +
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
