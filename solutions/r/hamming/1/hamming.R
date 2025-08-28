# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
  if(nchar(strand1)==nchar(strand2)) {
    distance <- 0
    i = 1
    while(i <= nchar(strand1)) {
      if(substr(strand1, i, i)!=substr(strand2, i, i)) {
        distance <- distance + 1
      }
      i <- i + 1
    }
    return(distance)
  }
  stop()
}