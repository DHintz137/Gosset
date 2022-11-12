#' Latex formatting for Rmarkdwon pdf
#' 
#' Formats paragraph indentation, array stretching and test spacing 
#'
#' @param p a number for points to indent by.
#' @param s a number to spread array print
#' @param spacing The character "single" or "double"
#'
#' @author Daniel Hintz
#' @return
#' @export
#'
#' @examples
#' tex(s=1.6, p = 200, spacing = "double")

tex <- function(p = 24,s = 1.3, spacing = "single"){
  ind(p = p)
  tab(s = s)
  tex_sp(spacing = spacing)
}
tex(s=1.2, p = 24, spacing = "double")