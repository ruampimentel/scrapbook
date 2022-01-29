
library(dplyr)
library(PerformanceAnalytics)

# Easy nice Correlation graph ----
mtcars %>% 
  select(1:3) %>% 
  chart.Correlation(histogram=TRUE, pch=19)