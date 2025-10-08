prime_factors <- function(number) {
  if(number <= 1) return(c())
  if(number <= 3) return(c(number))
  max <- floor_sqrt(number)
  index <- 1
  primes <- rep(NA,max)
  while(number > 1) {
    max <- floor_sqrt(number)
    light <- TRUE
    if(max > 1) {
      for(i in 2:max) {
        if(number%%i == 0) {
          primes[index] <- i
          index <- index + 1
          number = number/i
          light <- FALSE
          break
        }
      }
    }
    if(light) {
      primes[index] <- number
      break
    }
  }
  return(primes[!is.na(primes)])
}

floor_sqrt <- function(number) {
  for(i in 1:number) {
    if(i*i < number) {
      next
    } else if(i*i == number) {
      return(i)
    } else {
      return(i-1)
    }
  }
}