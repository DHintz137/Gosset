#' Spacing for pdf Rmarkdowns
#'
#' Single or double spacing for Rmarkdowns outputting to pdf
#'
#' Intended use is as a workhorse function for tex(), though can be used independently 
#'
#' @param spacing The character "single" or "double" 
#'
#' @import knitr
#'  
#' 
#' @author Daniel Hintz
#' @return
#' @export
#'
#' @examples
#' tex_sp()

tex_sp <- function(spacing = "single"){
  if(spacing == "single"){
    space = "singlespacing"
  } else{
    if(spacing == "double"){
      space = "doublespacing"
    }
  }
  hook_chunk = knitr::knit_hooks$get('chunk')
  
  knitr::knit_hooks$set(chunk = function(x, options) {
    regular_output = hook_chunk(x, options)
    # add latex commands if chunk option singlespacing is TRUE
    if (isTRUE(options$singlespacing))
      sprintf(paste0("\\singlespacing\n %s \n\\",space), regular_output)
    else
      regular_output
  })
  # chnage `%s \n\\singlespacing`to `%s \n\\doublespacing` if want doublespacing for text
  
  knitr::opts_chunk$set(echo = TRUE, singlespacing = TRUE)
}
