#--------Library---------------------------------------

library(tidyverse)
library(tibble)
library(dplyr)
library(DescTools)
library(ggplot2)

#----------FUNCTIONS----------------------------------

even <- function(x){
  if (x %% 2 == 0){
    TRUE
  }
  
  else 
    FALSE
}

gen_collatz <- function(n){
  
  if(n < 1){
    stop("Error")
  }
  
  else if(!(n %% 1 == 0)){
    stop("error")
  }
  
  count = 1
  n_max = n
  n_start = n
  seqc = c(n)
  
  if(even(n) == TRUE){
    parity = "Even"
  }
  
  else{
    parity = "Odd"
  }
  
  while(n > 1) {
    
    if(even(n) == TRUE){
      n = n/2
      count = count + 1
      seqc = append(seqc, n)
    }
    
    else{
    n = 3*n + 1
    count = count + 1
    seqc = append(seqc, n)
    
     if(n_max < n){
      n_max = n
     }
   }
  }
  
  seqc = list(as.double(seqc))
  return(tibble("start" = n_start,
                "seq" = seqc,
                "Length" = count,
                "Parity" = parity,
                "max_val" = n_max))

}


#----------All int from 1 to 10000----------------------------------
#ONLY RUN ONCE!!

collatz_df = tibble()
for(i in 1:10000){
  collatz_df = bind_rows(collatz_df,gen_collatz(i))
}

#-------------------------------------------------------
#task 2
#top 10 starting integers
top10longest <- collatz_df %>%
  arrange(desc(length)) %>%
  head(10)
#The starting integers 
max_val_int <- collatz_df %>%
  arrange(desc(max_val)) %>%
  slice(1)
#average length and the standard devietion
even_odd_avg_len <- collatz_df %>%
  group_by(parity) %>%
  summarise(avg_length = mean(length), sd_length = sd(length))


## Task 3----------------------------------------------------------

backtracks_df <- tibble()                   #Initializing backtrack dataframe

for(j in 1:10000){
  seqTemp <- collatz_df$seq[[j]]          # let seqTemp be the list of starting number j
  
  for(i in 1:length(seqTemp)){
    if(seqTemp[1] >= seqTemp[i]){
      next
    } else if(seqTemp[1] < seqTemp[i]){
      backtracks_df <- rbind(backtracks_df, collatz_df[j,])   # If seq backtracks, add row to backtracks_df then break loop
      break
    } else {
      break       # if no backtracks, break loop
    }
  }
}
backtracks_df

# Find the frequently occurring number of times they go above their starting

backtracks_count <- backtracks_df %>%
  mutate(count = 0)

backtracks_count$count
for (y in 1:length(backtracks_count$start)) {
  seqCount <- backtracks_count$seq[[y]]
  for(z in 1:length(seqCount)){
    if(seqCount[z] > seqCount[1]){
      backtracks_count$count[y] = backtracks_count$count[y] + 1
    }
  }
}

mode_backtrack <- backtracks_count %>% 
  summarise(mode = Mode(count))

mode_backtrack

# maximum value reached after the first backtrack for these sequences

max_after_backtrack <- backtracks_df %>%
  mutate(max = 0)
max_after_backtrack

# even odd backtracks

n_odd <- backtracks_df %>%
  filter(Parity == "Odd") %>%
  summarise(n_odd = n())
n_odd

n_even <- backtracks_df %>%
  filter(Parity == "Even") %>%
  summarise(n_even = n())
n_even

even_odd_backtrack <- tibble(n_odd, n_even)
even_odd_backtrack

## Task 4----------------------------------------------------------------

# 1
ggplot(
  data = collatz_df,
  mapping = aes(x = start,
                y = Length)
) +
  geom_point()

ggplot(
  data = collatz_df,
  mapping = aes(x = start,
                y = max_val)
) +
  geom_point() +
 labs(x = "Starting Integer", y = "Maximum Value") +
 theme_minimal()
