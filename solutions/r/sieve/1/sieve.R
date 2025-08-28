sieve <- function(limit) {
  primes <- c()
  if(limit >= 2) {
    append(primes,2)
    for(i in 2:limit) {
      is_prime <- TRUE
      limit_i <- sqrt(i)
      for(j in primes) {
        if(j > limit_i) {
          break
        }
        if(i%%j == 0) {
          is_prime <- FALSE
          break
        }
      }
      if(is_prime) {
        primes <- c(primes,i)
      }
    }
  }
  return(primes)
}