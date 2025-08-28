square <- function(n) {
  if(n >= 1 && n <= 64 && n %% 1 == 0) {
    return(2**(n-1))
  }
  else {
    stop("Domain error: out of chessboard bounds.")
  }
}

total <- function() {
  return(2**64 - 1)
}