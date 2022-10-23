
library(dplyr)

# Easy nice Correlation graph ----
library(PerformanceAnalytics)

mtcars %>% 
  select(1:3) %>% 
  chart.Correlation(histogram=TRUE, pch=19)

# Correlation graphs
# http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram

library(corrplot)

M<-cor(mtcars)

corrplot(M, method="circle")
corrplot(M, method="color", tl.col="black")
corrplot(M, type="upper")

# correlogram with hclust reordering
corrplot(M, type="upper", order="hclust")
