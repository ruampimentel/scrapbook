

# Calculating d from t according to Lakens (2013)
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3840331/
# Figure 2

# substitute these values 
t <- 2.57
n1 <- 43
n2 <- 43


t*( (1/n1)+ (1/n2) )


# function
d_from_t <- function(t, n1, n2) {
  t*( (1/n1)+ (1/n2) )
}

# testing function
d_from_t(2.57, 43, 43)
