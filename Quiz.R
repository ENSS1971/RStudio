##Use this data to find the time that the datasharing repo was created

#Loading packages
library(httr)

#1. Find OAuth settings for github
oauth_endpoints("github")

#2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "5a5edba40845415240ba",
                   secret = "a3186905535c7bfbe97e48f8c0bbfeb9b33ea515")

#3. Get Oauth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)

#gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
#stop_for_status(req)
#content(req)

#OR
#req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
#stop_for_status(req)
#content(req)

dataDownloaded <-date()
dataDownloaded

datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
datashare

View(datashare)

View(output)

list(output[[24]]$name, output[[24]]$created_at)
