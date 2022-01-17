# reports
library(tidyverse)
library(report)

# report participants
di_raven %>% 
  report_participants( age = "ageYear",
                       sex = "sexo",
                       participants = "cod_pesq")
# citation
report_packages()
cite_packages(prefix = "> ")