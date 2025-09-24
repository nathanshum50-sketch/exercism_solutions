to_rna <- function(dna) {
  rna <- unlist(strsplit(dna,""))
  for(i in 1:length(rna)) {
    rna[i] <- switch(
      rna[i],
      "G" = "C",
      "C" = "G",
      "A" = "U",
      "T" = "A",
      stop("Invalid nucleotide.")
    )
  }
  rna <- paste0(rna,collapse="")
  return(rna)
}