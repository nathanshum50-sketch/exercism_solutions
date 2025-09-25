is_pangram <- function(input) {
  input <- unlist(strsplit(gsub("[^a-z]","",tolower(input)),""))
  return(length(unique(input))==26)
}
