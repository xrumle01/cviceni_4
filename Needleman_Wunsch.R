Needleman_wunsch <- function(seq1, seq2, match, mismatch, gap){ #seq1, seq2 musí být DNAString!!!!
  m <- 1+length(seq1)
  n <- length(seq2)+1
  S <- (0:(n-1))*gap
  
  for(i in 2:m){
    s <- S[1]
    c <- S[1]+gap
    S[1] <- c
    for(j in 2:n){
      if(seq1[i-1] == seq2[j-1]){
        pom <- match
      } else{
        pom <- mismatch
      }
      c <- max(c(S[j]+gap,c+gap,s+pom))
      s <- S[j]
      S[j] <- c
    }
  }
  
  return(S)
}