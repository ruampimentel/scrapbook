


name_packages <- c('devtools', 'tidyverse', 'effectsize', 
                   'DataExplorer', 'usethis', 'PerformanceAnalytics', 
                   'report', 'lm.beta', 'apaTables', 'psych', 
                   'GPArotation', 'MplusAutomation', 'grafify', 
                   'datapasta', 'dplyr', 'tibble', 'readxl', 'janitor', 
                   'xlsx', 'tidyr', 'ggplot2', 'purrr', 'skimr', 'careless', 
                   'magrittr', 'correlation', 'stringr', 'lavaan', 
                   'TAM', 'rstatix', 'foreign', 'combinat', 'huxtable',
                   'easystats', 'EFA.dimensions', 'summarytools',
                   'writexl', 'sjmisc',
                   # Addins
                   'ymlthis',
                   'styler',
                   'ViewPipeSteps')



name_packages |> unique()

install.packages(name_packages)
