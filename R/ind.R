#' Set Indentation for text
#' 
#' Points for paragraph indentation 
#'
#' @param p a number for points to indent by. 
#'
#' @author Daniel Hintz
#' @import knitr
#' @return
#' @export
#'
#' @examples
#' ind()

ind <- function(p = 24){
  hook_chunk = knitr::knit_hooks$get('chunk')
  knitr::knit_hooks$set(chunk = function(x, options) {
    regular_output = hook_chunk(x, options)
    # add latex commands if chunk option singlespacing is TRUE
    if (isTRUE(options$singlespacing)){
      sprintf(paste0("\\setlength\\parindent{",p, "pt}\n %s \n\\setlength\\parindent{",p,"pt}"), regular_output)
    }else{
      regular_output
    }
  })
  knitr::opts_chunk$set(echo = TRUE, singlespacing = TRUE)
}