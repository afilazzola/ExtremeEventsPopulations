## Functions

dNt <- function(N0, r, K, Rclim, iter){
  N <- c()
  Nt <- N0
  for(i in 1:iter) { 
    Nt <- Nt * exp(Rclim[i])  ## climate effect on growth rate 
    Nt <- Nt + Nt*r*(1-Nt/K)    #discrete logistic
    if (Nt < 0) {Nt <- 0}
    N <- c(N,Nt)                #add result to vector
  }
  return(N)
}


dNtExtreme <- function(N0, r, K, Rclim, iter){
  N <- c()
  Nt <- N0
  for(i in 1:iter) { 
    Nt <- ifelse(i == 20, Nt/5, Nt)
    Nt <- Nt * exp(Rclim[i])  ## climate effect on growth rate 
    Nt <- Nt + Nt*r*(1-Nt/K)    #discrete logistic
    if (Nt < 0) {Nt <- 0}
    N <- c(N,Nt)                #add result to vector
  }
  return(N)
}