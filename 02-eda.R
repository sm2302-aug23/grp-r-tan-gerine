library(dplyr)

#-------------------------------------------------------
#task 2
#top 10 starting integers
top10longest <- collatz_df %>%
  arrange(desc(Length)) %>%
  head(10)
  
top10longest <- top10longest$start

#The starting integers 
max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  slice(1)

max_val_int <- pull(max_val_int, start)

#average length and the standard devietion
even_odd_avg_len_sd <- collatz_df %>%
  mutate(even_odd = ifelse(start %% 2 == 0, "Even", "Odd")) %>%
  group_by(even_odd) %>%
  summarise(avg_length = mean(Length), sd_length = sd(Length))

even_odd_avg_len <- even_odd_avg_len_sd$avg_length

even_odd_sd_len <- even_odd_avg_len_sd$sd_length
