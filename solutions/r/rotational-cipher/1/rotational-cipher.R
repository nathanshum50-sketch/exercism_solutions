rotate <- function(text, key) {
  key <- key %% 26
  if(key == 0) return(text)
  lower <- letters
  upper <- LETTERS
  shifted_lower <- c(tail(lower,-key),head(lower,key))
  shifted_upper <- c(tail(upper,-key),head(upper,key))
  rotated <- chartr(paste0(lower,upper, collapse=""),paste0(shifted_lower,shifted_upper, collapse=""),text)
  return(rotated)
}
