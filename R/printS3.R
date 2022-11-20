#' Automatically Format Printing 
#'
#' @param hash a character indicating hashes of which length will be hidden
#' @author Daniel Hintz
#' @return
#' @export

printS3 <- function(hash = "###"){
  registerS3method("knit_print", "data.frame", print_df)
  registerS3method("knit_print", "numeric", print_vec)
  hide_cm(hash = hash)
}
