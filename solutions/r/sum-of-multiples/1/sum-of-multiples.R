sum_of_multiples <- function(factors, limit) {
  if(limit-1 <= 0) {
    return(0)
  }
  multiples <- rep(NA,limit-1)
  for(factor in factors) {
    if(factor > limit-1 || factor <= 0) next
    for(unit in seq(factor,limit-1,factor)) {
      if(is.na(multiples[unit])) {
        multiples[unit] <- unit
      }
    }
  }
  if(all(is.na(multiples))) return(0)
  return(sum(multiples,na.rm=TRUE))
}