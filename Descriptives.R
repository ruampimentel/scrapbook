# Descriptive
library(tidyverse)
library(psych)

# load example data
load("C:/Users/ruamp/OneDrive - University of Toledo/Classes/2021.3 Fall/Adv Develomental Psychology/Dev Psyc Project/Gabriel's data/Gabriel_environment.RData")

# run descriptive ----
a <- di_raven %>% 
  select(R:ageYear) %>% 
  psych::describe() %>% # this is the main function that I need!
  as_tibble(rownames = "variables") 

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
