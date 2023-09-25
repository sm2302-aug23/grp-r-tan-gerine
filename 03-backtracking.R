source("solution.R")

backtracks_df <- tibble()  #Initializing backtrack dataframe

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
  mutate(MaB = 0)

for (j in 1:length(max_after_backtrack$start)) {
  seq = max_after_backtrack$seq[[j]]
  listTemp = c()
  coun = 0
  
  for(i in 1:length(seq)){
    if(seq[1] >= seq[i]){
      coun = coun + 1
      listTemp = append(listTemp, coun)
      next
    } else if(seq[1] < seq[i]){
      coun = coun + 1
      listTemp = append(listTemp, coun)
      break
    }
  }
  
  max_after_backtrack$MaB[j] <- max(seq[-listTemp])
}

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

even_odd_backtrack <- tibble("Parity" = c("Odd", "Even"), "Freq" = c(n_odd[[1]], n_even[[1]]))
even_odd_backtrack
