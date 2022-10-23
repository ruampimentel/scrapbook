
library(dplyr)
library(DataExplorer)

iris %>% glimpse

iris %>% plot_str()

iris %>% introduce()
iris %>% plot_intro()

iris %>% plot_missing()

iris %>% plot_histogram()

iris %>% plot_correlation()
iris %>% plot_prcomp()

