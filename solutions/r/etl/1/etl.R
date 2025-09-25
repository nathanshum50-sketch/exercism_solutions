etl <- function(input) {
  #names and scores
  length <- sum(sapply(input,length))
  names <- vector("character",length)
  scores <- vector("numeric",length)
  #add to vectors
  base <- 1
  for(name in names(input)) {
    score <- as.integer(name)
    for(letter in input[[name]]) {
      names[base] <- tolower(letter)
      scores[base] <- score
      base <- base + 1
    }
  }
  #convert to list and sort
  output <- as.list(scores)
  names(output) <- names
  output <- output[order(names)]
  return(output)
}