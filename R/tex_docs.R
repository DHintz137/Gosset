#' Download template preamble.tex and .bib files for pdf Rmarkdown
#'
#' @param pream boolean. download preamble.tex
#' @param bib boolean. download references.bib
#'
#' @return
#' @export
#'
#' @examples

tex_docs <- function(pream = TRUE, bib = TRUE){
  if(pream == TRUE){
    suppressWarnings({cat(readLines("https://www.dropbox.com/s/bx8bs0iiq2xdsyp/preamble.tex?raw=1"), sep = "\n", file = "preamble.tex")})
  }
  if(bib == TRUE){
    suppressWarnings({cat(readLines("https://www.dropbox.com/s/6csr2h7436lk9jm/references.bib?raw=1"), sep = "\n", file = "references.bib")})
    message("Note: Example only! Download your own references in .bib from google shcolor")
  }
}