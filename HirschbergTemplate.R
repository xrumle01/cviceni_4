Hirschberg_sablona <- function(X,Y,Align,match,mismatch,gap){ 
  Z <- Align[[1]] #inicializace prvniho radku zarovnani, typ DNAStringSet
  W <- Align[[2]] #inicializace druheho radku zarovnani 
  
  if(length(X) == 0){  #delka X je nula
    for(i in 1:length(Y)){  #podle poctu znaku v Y
      Z[[1]] <- c(Z[[1]], '-')  #prida se mezera
      W[[1]] <- c(W[[1]], Y[i])  #prida se znak z Y
    }
    Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else if(length(Y) == 0){  #delka Y je nula
    for(j in 1:length(X)){  #podle poctu znaku v X
      Z[[1]] <- c(Z[[1]], X[j])  #prida se znak z X
      W[[1]] <- c(W[[1]], '-')  #prida se mezera
    }
    Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else if(length(X) == 1 & length(Y) == 1){  #delka X a Y je jedna
    Z <- X  #prida se znak z X
    W <- Y  #prida se znak z Y
    Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else{
      xlen <- length(X)  #delka X
      xmid <- xlen/2  #pulka delky X
      ylen <- length(Y)  #delka Y
      
      ScoreL <- Needleman_wunsch(X[1:xmid], Y, match, mismatch, gap)  # NW skore pro prvni polovinu X a cele Y
      ScoreR <- Needleman_wunsch(reverse(X[(xmid+1):xlen]), reverse(Y), match, mismatch, gap)  # NW skore pro druhou polovinu X a cele Y (obe sek jsou obracene)
      ymid <- which.max(ScoreL + rev(ScoreR)) - 1 #index deleni Y
      
      #pro prvni cast
      if(ymid == 0){  #index deleni Y je nula
      Align <- Hirschberg_sablona(X[1:xmid], c(), Align, match, mismatch, gap)  #volani Hirschberg pro prvni polovinu X a prazdny vektor Y
      }
      else{
      Align <- Hirschberg_sablona(X[1:xmid], Y[1:ymid], Align, match, mismatch, gap)  #volani Hirschberg pro prvni polovinu X a prvni cast Y
      }
    
      #pro druhou cast
      if ((xmid+1)>xlen){  #X jiz nelze pulit
      Align <- Hirschberg_sablona(c(), Y[ymid+1:ylen], Align, match, mismatch, gap)  #volani Hirschberg pro prazdny vektor X a druhou cast Y
      }
      else if ((ymid+1)>ylen){  #Y jiz nejde delit
      Align <- Hirschberg_sablona(X[xmid+1:xlen], c(), Align, match, mismatch, gap)  #volani Hirschberg pro druhou polovinu X a prazdny vektor Y
      }
      else{
      Align <- Hirschberg_sablona(X[xmid+1:xlen], Y[ymid+1:ylen], Align, match, mismatch, gap)  #volani Hirschberg pro druhou polovinu X a druhou cast Y
      }
  }
  return(Align)
}