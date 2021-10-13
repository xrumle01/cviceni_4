Hirschberg_sablona <- function(X,Y,Align,match,mismatch,gap){
  Z <- Align[[1]] #inicializace prvniho radku zarovnani, typ DNAStringSet
  W <- Align[[2]] #inicializace druheho radku zarovnani
  
  if #delka X je nula
  {
    for #podle poctu znaku v Y
    {
      Z <- #prida se mezera
        W <- #prida se znak z Y
    }
    Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else if #delka Y je nula
  {
    for #podle poctu znaku v X
    {
      Z <- #prida se znak z X
        W <- #prida se mezera
    }
    Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else if #delka X a Y je jedna
  {
    Z <- #prida se znak z X
      W <- #prida se znak z Y
      Align <- c(DNAStringSet(Z),DNAStringSet(W))
    print(Align)
  }
  else
  {
    xlen <- #delka X
      xmid <- #pulka delky X
      ylen <- #delka Y
      
      ScoreL <- # NW skore pro prvni polovinu X a cele Y
      ScoreR <- # NW skore pro druhou polovinu X a cele Y (obe sek jsou obracene)
      ymid <- #index deleni Y
      
      #pro prvni cast
      if #index deleni Y je nula
    {
      Align <- #volani Hirschberg pro prvni polovinu X a prazdny vektor Y
    }
    else
    {
      Align <- #volani Hirschberg pro prvni polovinu X a prvni cast Y
    }
    
    #pro druhou cast
    if ((xmid+1)>xlen) #X jiz nelze pulit
    {
      Align <- #volani Hirschberg pro prazdny vektor X a druhou cast Y
    }
    else if ((ymid+1)>ylen) #Y jiz nejde delit
    {
      Align <- #volani Hirschberg pro druhou polovinu X a prazdny vektor Y
    }
    else 
    {
      Align <- #volani Hirschberg pro druhou polovinu X a druhou cast Y
    }
  }
  return(Align)
}