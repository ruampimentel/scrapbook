library(dplyr)
library(effectsize)


cohen_from_msd <- function(m1, sd1, m2, sd2) {
  sd_pool <- sqrt((sd1^2 + sd2^2)/2)
  round((m2 - m1)/sd_pool, 2)
}

d <- cohen_from_msd(m1 = 22.4, 
                    sd1 = 4.7, 
                    m2 = 19.7, 
                    sd2 = 4.5);d

interpret_cohens_d(d)

