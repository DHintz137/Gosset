#' Array Spread for pdf
#'
#' @param s a number to spread array prints
#'
#' @author Daniel Hintz
#' @import knitr
#' @return
#' @export
#'
#' @examples
#' tab()

tab <- function(s = 1.3){
  hook_chunk = knitr::knit_hooks$get('chunk')
  knitr::knit_hooks$set(chunk = function(x, options) {
    regular_output = hook_chunk(x, options)
    # add latex commands if chunk option singlespacing is TRUE
    if (isTRUE(options$singlespacing)){
      sprintf(paste0("\\renewcommand{\\arraystretch}{",s,"}\n %s \n\\renewcommand{\\arraystretch}{",s,"}"), regular_output)
    }else{
      regular_output
    }
  })
  knitr::opts_chunk$set(echo = TRUE, singlespacing = TRUE)
}