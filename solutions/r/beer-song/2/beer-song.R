lyrics <- function(first, last) {
  if(first > 99 || last < 0 || first < last) {
    stop("Out of bounds")
  }
  verses <- rep(NA,first-last+1)
  for(i in first:-1:last) {
      verses[first+1-i] <- verse(i)
  }
  song <- paste(verses,collapse="\n")
  return(song)
}

verse <- function(number) {
  if(number > 2) {
    verse1 <- sprintf("%d bottles of beer on the wall, %d bottles of beer.",number,number)
    verse2 <- sprintf("Take one down and pass it around, %d bottles of beer on the wall.\n",number-1)
  }
  else if(number == 2) {
    verse1 <- "2 bottles of beer on the wall, 2 bottles of beer."
    verse2 <- "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  }
  else if(number == 1) {
    verse1 <- "1 bottle of beer on the wall, 1 bottle of beer."
    verse2 <- "Take it down and pass it around, no more bottles of beer on the wall.\n"
  }
  else {
    verse1 <- "No more bottles of beer on the wall, no more bottles of beer."
    verse2 <- "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  }
  return(paste(sep="\n",verse1,verse2))
}
