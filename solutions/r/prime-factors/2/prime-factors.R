prime_factors <- function(number) {
  if(number <= 1) return(c())
  if(number <= 3) return(c(number))
  index <- 1
  max <- floor(sqrt(number))+1
  primes <- rep(NA,max)
  divisor <- 2
  while(number > 1) {
    if(number%%divisor==0) {
      primes[index] <- divisor
      number <- number/divisor
      divisor <- 2
      index <- index+1
    } else {
      divisor <- divisor+1
    }
  }
  return(primes[!is.na(primes)])
}