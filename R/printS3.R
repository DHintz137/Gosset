#' Automatically Format Printing 
#'
#' @author Daniel Hintz
#' @return
#' @export

printS3 <- function(){
  registerS3method("knit_print", "data.frame", print.df)
  registerS3method("knit_print", "numeric", print.mat)
}
