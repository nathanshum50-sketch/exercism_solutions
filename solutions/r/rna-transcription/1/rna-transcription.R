to_rna <- function(dna) {
  rna <- unlist(strsplit(dna,""))
  for(i in 1:length(rna)) {
    if(rna[i]=="G") {
      rna[i] <- "C"
    }
    else if(rna[i]=="C") {
      rna[i] <- "G"
    }
    else if(rna[i]=="A") {
      rna[i] <- "U"
    }
    else if(rna[i]=="T") {
      rna[i] <- "A"
    }
    else {
      stop("Invalid nucleotide.")
    }
  }
  rna <- paste0(rna,collapse="")
  return(rna)
}