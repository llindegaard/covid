# download json

library(jsonlite)
library(json64)
library(ggplot2)
library(curl)
jscoviddata <- read_json("https://opendata.ecdc.europa.eu/covid19/hospitalicuadmissionrates/json/", simplifyVector = TRUE)
startdato <- as.Date(c('2020-05-01'))
jscoviddata$date <- as.Date(jscoviddata$date)
jscoviddata <- jscoviddata[which(jscoviddata$date>= startdato),]

dk <-subset(jscoviddata, country %in% c("Denmark")  & indicator %in% c("Daily hospital occupancy"))
ggplot(dk, aes(x = date, y = value, colour = indicator)) +
  geom_line() +  # scale_color_colorblind() +
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = c(startdato, Sys.Date())) +
  stat_smooth(method=loess ,  na.rm = TRUE ) +
  ggtitle("Danmark daglige tal")

# tter <- readChar("https://files.ssi.dk/Data-Epidemiologiske-Rapport-28102020-76pi")
