anagram <- function(subject, candidates) {
  anagrams <- c()
  subject_sorted <- tolower(paste(sort(unlist(strsplit(subject, ""))), collapse = ""))
  for(candidate in candidates) {
    if(tolower(subject) != tolower(candidate)) {
      candidate_sorted <- tolower(paste(sort(unlist(strsplit(candidate, ""))), collapse = ""))
      if(subject_sorted==candidate_sorted) {
        anagrams <- append(anagrams, candidate)
      }
    }
  }
  return(anagrams)
}
