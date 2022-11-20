#' Hide in-code comments of specified number of hashtags
#'
#' @param hash character of hashes to indicate which comments to hide  
#'
#' @return NULL
#' @export
#'
#' @examples
#' hide_cm(hash = "##")

hide_cm <- function(hash = "###"){
  hook_in <- function(x, options) {
    x <- x[!grepl(paste0("^",hash,"\\s+"), x)]
    paste0("```r\n",
           paste0(x, collapse="\n"),
           "\n```")
  }
  knitr::knit_hooks$set(source = hook_in)
}
