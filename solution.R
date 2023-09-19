#--------Library---------------------------------------

library(tidyverse)
library(tibble)

#----------FUNCTIONS----------------------------------


even <- function(x){
  if (x %% 2 == 0){
    TRUE
  }
  
  else 
    FALSE
}


#-------------------------------------------------------


gen_collatz <- function(n){
  
  count = 1
  n_max = n
  n_start = n
  seqc = c(n)
  
  if(n %% 2 == 0){
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
  seqc = list(seqc)
  return(tibble("start" = n_start, "Sequence" = seqc, "Length" = count, "Parity" = parity, "max_val" = n_max))
}


#----------TESTING----------------------------------
collatz_df = tibble()
for(x in 1:10000){
  collatz_df = bind_rows(collatz_df,gen_collatz(x))
}


#-------------------------------------------------------









