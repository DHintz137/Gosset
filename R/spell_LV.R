# Levenshtein distance function -------------------------------------------

library(stringdist)

#' spell_LV 
#'
#' Spell check correction using Levenshtein distance
#' 
#' As threshold gets smaller than 4 we are being more restrictive (more precise) in what we we allow our algorithm correct, hence If you want to see what values are more borderline set a more restrictive threshold of 3
#' 
#' @param dat a character vector with misspellings to be corrected 
#' @param corr a character vector with correct spellings for reference
#' @param threshold a number to set level of sensitivity 
#'
#' @author Daniel Hintz
#' @import stringdist
#' @return a character vector
#' @export
#'
#' @examples
#' dat <- c(NA, "Rawln", NA, NA, "", "Torrinton", "Laraie", "Laamie","Torringtn","Whatld","Rwlins")
#' corr <- c("Wheatland", "Torrington", "Rawlins", "Laramie")
#' spell_LV(dat, corr,threshold = 3)

spell_LV <- function(dat, corr,threshold = 4){
  # converting "" to NA
  dat[nchar(dat)==0 & !is.na(dat)]<-NA
  
  newDat<-NULL
  for(i in 1:length(dat)){
    
    if(is.na(dat[i])){
      tempNew <- NA
    }else{
      V<- stringdist(dat[i],corr,method='lv')
      if(min(V) >= threshold){
        tempNew <- "INCONCLUSIVE"
      }else{
        tempNew <- corr[which.min(V)]
      }
    }
    newDat<- c(newDat,tempNew)
  }
  return(newDat)
}
