#' Hide in-code comments of specified number of hashtags
#'
#' @param hash character of hashes to indicate which comments to hide  
#' @param switch a Boolean. Switch for on and off.
#'
#' @return NULL
#' @export
#'
#' @examples
#' hide_cm(hash = "##")

hide_cm <- function(hash = "###", switch = TRUE){
  if(switch == TRUE){
  hook_in <- function(x, options) {
    x <- x[!grepl(paste0("^",hash,"\\s+"), x)]
    paste0("```r\n",
           paste0(x, collapse="\n"),
           "\n```")
  }
  knitr::knit_hooks$set(source = hook_in)
  message("Note: recommended use is turn on and off for only for where it is needed")
  } else{
    if(switch == FALSE){
      hook_in <- function(x, options) {
        x <- x[!grepl(paste0("^","\\s+"), x)]
        paste0("```r\n",
               paste0(x, collapse="\n"),
               "\n```")
      }
      knitr::knit_hooks$set(source = hook_in)
    }
  }
}
