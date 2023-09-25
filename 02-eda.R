#-------------------------------------------------------
#task 2
#top 10 starting integers
top10longest <- collatz_df %>%
  arrange(desc(Length)) %>%
  head(10)

#The starting integers 
max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  slice(1)

#average length and the standard devietion
even_odd_avg_len <- collatz_df %>%
  mutate(even_odd = ifelse(start %% 2 == 0, "Even", "Odd")) %>%
  group_by(even_odd) %>%
  summarise(avg_length = mean(Length), sd_length = sd(Length))
