#--------Library---------------------------------------

library(tidyverse)
library(tibble)
library(dplyr)
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
#----------------------------------------------------------

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
