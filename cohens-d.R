
# Calculating d from t according to Lakens (2013)
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3840331/pdf/fpsyg-04-00863.pdf
# Figure 2

# function 
# Between subject design ---- 
d_from_t_between <- function(t, n1, n2) {
  t*( (1/n1)+ (1/n2) )
  }

# testing function
d_from_t_between(t = 2.24,
                 n1 = 25,
                 n2 = 25)
