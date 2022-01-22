# creating for Furgeson et al (2005)
library(tidyverse)
library(magrittr)

fig_data <- tibble(condition = c("positive", "negative", "control"),
                   average_pos = c(0.70, 0.55, 0.60))

fig_data %>% 
  ggplot(aes(x = condition, y = average_pos, fill = condition)) +
  geom_bar(stat = "identity") +
  ylim(0:1) +
  theme_bw()
  

