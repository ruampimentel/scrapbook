# Descriptive
library(tidyverse)
library(psych)

# load example data
load(mtcars)

# run descriptive ----
a <- mtcars %>% 
  psych::describe() %>% # this is the main function that I need!
  as_tibble(rownames = "variables")  #organzining layout

a

## check skew - arranging (sorting) by skew ----
a %>% arrange(abs(skew))

### variables with skew > 1.9 ----
a %>% arrange(abs(skew)) %>% 
  filter(abs(skew) > 1.9) 

### variables with adequate skew (skew < 1.9) ----
a %>% arrange(abs(skew)) %>% 
  filter(abs(skew) <= 1.9) 
  
# build beautiful table APA style on Excel
