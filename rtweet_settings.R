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
library(datapasta)
library(dplyr)
library(tibble)
data.frame(
      stringsAsFactors = FALSE,
           check.names = FALSE,
  `Age.	Gender.	Total` = c("Male \tFemale \tOther",
                           "5 \t1 \t3 \t0 \t4","6 \t3 \t1 \t0 \t4",
                           "7 \t2 \t3 \t0 \t5","8 \t3 \t2 \t0 \t5","9 \t2 \t7 \t0 \t9",
                           "10 \t5 \t5 \t0 \t10","11 \t6 \t3 \t0 \t9",
                           "12 \t0 \t1 \t0 \t1","13 \t1 \t0 \t0 \t1",
                           "14 \t3 \t1 \t0 \t4","15 \t3 \t1 \t0 \t4","16 \t1 \t1 \t0 \t2",
                           "17 \t1 \t3 \t0 \t4",
                           "18 living with parents \t1 \t2 \t0 \t3","18 to 25 \t11 \t38 \t0 \t49",
                           "26 to 59 \t32 \t58 \t0 \t90","60 and older \t3 \t12 \t0 \t15",
                           "Total \t78 \t141 \t0 \t219")
)

data.frame(
  stringsAsFactors = FALSE,
       check.names = FALSE,
               `5` = c("6","7","8","9","10","11",
                       "12","13","14","15","16","17",
                       "18 living with parents","18 to 25","26 to 59","60 and older","Total"),
               `1` = c(3L,2L,3L,2L,5L,6L,0L,1L,
                       3L,3L,1L,1L,1L,11L,32L,3L,78L),
               `3` = c(1L,3L,2L,7L,5L,3L,1L,0L,
                       1L,1L,1L,3L,2L,38L,58L,12L,141L),
               `0` = c(0L,0L,0L,0L,0L,0L,0L,0L,
                       0L,0L,0L,0L,0L,0L,0L,0L,0L),
               `4` = c(4L,5L,5L,9L,10L,9L,1L,1L,
                       4L,4L
                       ,2L,4L,3L,49L,90L,15L,219L)
)

tibble::tribble(
                      ~`age`, ~`male`, ~`female`, ~`other`, ~`total`,
                       "5",   1L,   3L,   0L,   4L,
                       "6",   3L,   1L,   0L,   4L,
                       "7",   2L,   3L,   0L,   5L,
                       "8",   3L,   2L,   0L,   5L,
                       "9",   2L,   7L,   0L,   9L,
                      "10",   5L,   5L,   0L,  10L,
                      "11",   6L,   3L,   0L,   9L,
                      "12",   0L,   1L,   0L,   1L,
                      "13",   1L,   0L,   0L,   1L,
                      "14",   3L,   1L,   0L,   4L,
                      "15",   3L,   1L,   0L,   4L,
                      "16",   1L,   1L,   0L,   2L,
                      "17",   1L,   3L,   0L,   4L,
  "18 living with parents",   1L,   2L,   0L,   3L,
                "18 to 25",  11L,  38L,   0L,  49L,
                "26 to 59",  32L,  58L,   0L,  90L,
            "60 and older",   3L,  12L,   0L,  15L,
                   "Total",  78L, 141L,   0L, 219L
  )
