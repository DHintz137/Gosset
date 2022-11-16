#' Automated Print Formatting for matrices
#'
#' @param x A matrix 
#' @param ... ellispe not set
#'
#' @author Daniel Hintz
#' @import kableExtra, knitr, finalfit, dplyr
#' @return A matrix 
#' @export

print.mat <- function(x, ...) {
  if(length(as.vector(as.matrix(x))) < 3){
    x %>% round_tidy(., 5) %>% capture.output() %>% cat()
  } else{
    # small dimensions (cond.1)
    # ncol                            #nrow
    if(dim(as.matrix(x))[2] ==1 & dim(as.matrix(x))[1] <= 38){
      knitr::kable(
        x, align = "c",
        digits = 3,
        format="latex",
        booktabs = T,
        caption = ""
      ) %>% # styling
        kable_styling(latex_options = c("HOLD_position"),
                      font_size = 9.5,full_width = F) %>% 
        asis_output()
    } else{
      #dimensions to large (cond.2)
      if(dim(as.matrix(x))[2] >= 10 | dim(as.matrix(x))[1] > 38){
        x %>% as_tibble() %>%  capture.output() %>% cat(sep = "\n")
        cat("WARNING: output out off bounds, defualting to tibble. See print.mat")
      } else{
        #dimensions fit asis (cond.3)
        knitr::kable(
          x, align = "c",
          digits = 3,
          format="latex",
          booktabs = T,
          caption = ""
        ) %>% # styling
          kable_styling(latex_options = c("HOLD_position","scale_down"),
                        font_size = 9.5,full_width = F) %>% 
          asis_output()
      }}}
}