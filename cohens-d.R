
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


# One sample or correlated sample ----
d_from_t_one_sample <- function(t, n) {
  t/sqrt(n)
}

d_from_t_one_sample(t = 2.24,
                    n = 50)

# EASYSTATS --------
library(effectsize)

t_to_d( t = 2.53, 
        df = 47)

t_to_d(3.27, 47)
t_to_d(2.38, 43) %>% 
  interpret_cohens_d()


F_to_eta2(59.53, 20, 434) %>% 
  interpret_eta_squared()

F_to_r(3.09, 5, 43)
