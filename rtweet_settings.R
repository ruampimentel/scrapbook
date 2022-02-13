#=========================
#==== Manual Setting =====
#=========================
library("rtweet")

## load rtweet
creds <- read.csv("twitter_creds.csv")
## store api keys 
list2env(creds, .GlobalEnv)
rm(creds)
# authenticate via web browser
token <- create_token(app_name, api_key, api_secret_key)
rm(list = ls.str(mode = 'character'))

#======================================================
#============== loading and running  ==================
#============= my credentials (function) ==============
#======================================================
source("C:/Users/ruamp/OneDrive - University of Toledo/R studying/My Functions/my_twitter_cred.R")
my_twitter_cred()
