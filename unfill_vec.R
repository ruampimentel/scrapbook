unfill_vec <- function(x) {
  same <- x == dplyr::lag(x)
  ifelse(!is.na(same) & same, NA, x)
  
  # function from [hadley](https://github.com/tidyverse/tidyr/issues/250)
  # example
  # x <- c("A","A","A","B","B","C","C")
  # unfill_vec(x)
  
}