is_isogram <- function(word) {
  word <- tolower(gsub("[^a-zA-Z]","",word))
  if(word=="") return(TRUE)
  word <- unlist(strsplit(word,""))
  return(length(unique(word))==length(word))
}
