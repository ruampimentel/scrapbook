


name_packages <- c('devtools', 'tidyverse', 'effectsize', 
                   'DataExplorer', 'usethis', 'PerformanceAnalytics', 
                   'report', 'lm.beta', 'apaTables', 'psych', 
                   'GPArotation', 'MplusAutomation', 'grafify', 
                   'datapasta', 'dplyr', 'tibble', 'readxl', 'janitor', 
                   'xlsx', 'tidyr', 'ggplot2', 'purrr', 'skimr', 'careless', 
                   'magrittr', 'correlation', 'stringr', 'lavaan', 
                   'TAM', 'rstatix', 'foreign', 'combinat', 'huxtable',
                   'easystats', 'EFA.dimensions', 'summarytools',
                   'writexl', 'sjmisc', 'pwr', 'psychTools', 'DataExplorer',
                   'naniar', 'visdat', 'tidylog', 'qualtRics', 'rempsyc',
                   'gt', 'mice', 'devtools', 'bannerCommenter',
                   # Addins
                   'ymlthis',
                   'styler',
                   'ViewPipeSteps',
                   'esquisse', 
                   'questionr')



name_packages <- name_packages |> unique()

install.packages(name_packages)

devtools::install_github("ThinkR-open/littleboxes")