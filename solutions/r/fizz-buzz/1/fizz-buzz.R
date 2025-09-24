fizz_buzz <- function(n) {
  n <- as.integer(n)
  output <- rep(NA, times=n)
  if(n <= 0) {
    return(output)
  }
  for(i in 1:n) {
    if(i%%5==0) {
      if(i%%3==0) {
        output[i] <- "Fizz Buzz"
      }
      else {
        output[i] <- "Buzz"
      }
    }
    else if(i%%3==0) {
      output[i] <- "Fizz"
    }
    else {
      output[i] <- as.character(i)
    }
  }
  return(output)
}