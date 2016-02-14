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

#The scrapping part

#df.airbnb.raw = read_csv("/Users/stinewesselhoff/Downloads/Airbnb_Copenhagen_February_2015.csv")
#df.airbnb.raw$geometry = str_trim(gsub("<Point><coordinates>", "", df.airbnb.raw$geometry))
#df.airbnb.raw$geometry = str_trim(gsub(",0.0</coordinates></Point>", "", df.airbnb.raw$geometry))

#df.airbnb.raw$lot = substr(df.airbnb.raw$geometry,1,9)
#df.airbnb.raw$lat = substr(df.airbnb.raw$geometry,11,19)
#df.airbnb = df.airbnb.raw
#df.airbnb$geometry <- NULL
#df.airbnb$description <- NULL

#write.csv(df.airbnb,"/Users/stinewesselhoff/GitHub/Speciale_airbnb/airbnb.csv")

df.airbnb = read_csv("https://raw.githubusercontent.com/StineWesselhoff/Speciale_airbnb/master/airbnb.csv")


Copenhagen = get_map("Copenhagen,Denmark", zoom = 12,  scale=2, maptype= c("toner-lite"))

df.geo = df.airbnb %>%
  group_by(host, lat, lot) %>%
summarize(suminc = sum(income, na.rm = TRUE))



p = ggmap(Copenhagen) 
p + geom_point(data=df.geo, aes(x=lot, y=lat, size = suminc, alpha = 0.4, color = "blue")) +
  labs(title = "Copenhagen", x="", y="")+
  theme_minimal() + theme_tufte() + theme(legend.position="none")
  