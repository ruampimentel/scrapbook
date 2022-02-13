library("rtweet")

## load rtweet
creds <- read.csv("C:/Users/ruamp/OneDrive - University of Toledo/R studying/Twitter/data/twitter_creds.csv")

## store api keys (these are fake example values; replace with your own keys)
app_name <- creds$app_name
api_key <- creds$api_key
api_secret_key <- creds$api_secret
access_token <- creds$access_token
access_secret <- creds$access_secret

# authenticate via web browser
token <- create_token(
  app = app_name,
  consumer_key = api_key,
  consumer_secret = api_secret_key)
