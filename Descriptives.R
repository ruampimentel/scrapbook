# Descriptive
library(tidyverse)
library(psych)

# Descriptive methods
mtcars %>% summary()
mtcars %>% skimr::skim() 
mtcars %>% Hmisc::describe()
mtcars %>% psych::describe()
mtcars %>% pastecs::stat.desc(norm = T) %>% t() %>% round(2) 
mtcars %>% summarytools::dfSummary() %>% summarytools::view()
mtcars %>% summarytools::descr(transpose = T)

# Psych package ----
## run descriptive ----
a <- mtcars %>% 
  psych::describe() %>% # this is the main function that I need!
  as_tibble(rownames = "variables")  #organzining layout

# by group and merge
describe(iris ~ Species)

describe(iris ~ Species) %>% 
  map_dfr(., ~ .x %>% 
          as_tibble( rownames = "var") %>% 
          slice(-n()), # remove last line
          .id = "group")

## check skew - arranging (sorting) by skew ----
a %>% arrange(abs(skew))

### variables with skew > 1.9 ----
a %>% arrange(abs(skew)) %>% 
  filter(abs(skew) > 1.9) 

### variables with adequate skew (skew < 1.9) ----
a %>% arrange(abs(skew)) %>% 
  filter(abs(skew) <= 1.9) 
  
# build beautiful table APA style on Excel
