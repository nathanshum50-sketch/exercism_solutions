allergy <- function(num) {
  allergies <- c("eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats")
  scores <- rep(FALSE,8)
  base <- 1
  while(num >= 1 && base <= 8) {
    if(num%%2==1) {
      scores[base] <- TRUE
    }
    num <- num %/% 2
    base <- base + 1
  }
  scoring <- as.list(scores)
  names(scoring) <- allergies
  return(scoring)
}

allergic_to <- function(allergy_object, allergy) {
  return(allergy_object[[allergy]])
}

list_allergies <- function(allergy_object) {
  condition <- allergy_object == FALSE
  if(all(condition)) {
    return(character())
  }
  list <- vector("character",length(allergy_object))
  base <- 1
  for(name in names(allergy_object)) {
    if(allergy_object[[name]]) {
      list[base] <- name
      base <- base + 1
    }
  }
  return(list[1:(base-1)])
}
