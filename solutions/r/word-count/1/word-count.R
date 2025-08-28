word_count <- function(input) {
  input <- tolower(input)
  input <- gsub("(^|\\s)'|'(\\s|$)", " ", input)
  input <- gsub("[^[:alnum:]'\\s]", " ", input)
  words <- unlist(strsplit(input, "[[:space:]]+"))
  words <- words[words != ""]
  word_counts <- table(words)
  result <- as.list(word_counts)
  return(result)
}