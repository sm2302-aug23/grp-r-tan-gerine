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

