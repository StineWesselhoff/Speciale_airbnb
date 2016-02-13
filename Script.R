library("readr")
library("rvest")
library("stringr")
library("tidyr")
library("lubridate")
library("plyr")
library("dplyr")
library("ggplot2")
library("gdata")
library("ggthemes")
library("ggmap")
library("gtable")
library("scales")

df.airbnb.raw = read_csv("/Users/stinewesselhoff/Downloads/Airbnb_Copenhagen_February_2015.csv")
df.airbnb.raw$geometry = str_trim(gsub("<Point><coordinates>", "", df.airbnb.raw$geometry))
df.airbnb.raw$geometry = str_trim(gsub(",0.0</coordinates></Point>", "", df.airbnb.raw$geometry))

df.airbnb.raw$lot = substr(df.airbnb.raw$geometry,1,9)
df.airbnb.raw$lat = substr(df.airbnb.raw$geometry,11,19)
df.airbnb = df.airbnb.raw
df.airbnb$geometry <- NULL
df.airbnb$description <- NULL

write_csv(df.airbnb, file = "/Users/stinewesselhoff/GitHub")
