library(jsonlite)
library(ggplot2)

jscoviddata <- read_json("https://opendata.ecdc.europa.eu/covid19/hospitalicuadmissionrates/json/", simplifyVector = TRUE)
startdato <- as.Date(c('2020-05-01'))
jscoviddata$date <- as.Date(jscoviddata$date)
jscoviddata <- jscoviddata[which(jscoviddata$date>= startdato),]

ggplot(subset(jscoviddata, country %in% c("Denmark") & indicator %in% c("Daily hospital occupancy","Daily ICU occupancy")), aes(x = date, y = value, colour = indicator)) +
 geom_line() + # scale_color_colorblind() +
 scale_x_date(date_labels="%b",date_breaks ="1 month" ,limits = c(startdato, Sys.Date())) +
 stat_smooth(method=loess , na.rm = TRUE ) +
 ggtitle("Danmark daglige hospitalstal")

ggplot(subset(jscoviddata, country %in% c("France") & indicator %in% c("Daily hospital occupancy","Daily ICU occupancy")), aes(x = date, y = value, colour = indicator)) +
 geom_line() + # scale_color_colorblind() +
 scale_x_date(date_labels="%b",date_breaks ="1 month" ,limits = c(startdato, Sys.Date())) +
 stat_smooth(method=loess , na.rm = TRUE ) +
 ggtitle("Frankrig daglige hospitalstal")

ggplot(subset(jscoviddata, country %in% c("Italy") & indicator %in% c("Daily hospital occupancy","Daily ICU occupancy")), aes(x = date, y = value, colour = indicator)) +
 geom_line() + # scale_color_colorblind() +
 scale_x_date(date_labels="%b",date_breaks ="1 month" ,limits = c(startdato, Sys.Date())) +
 stat_smooth(method=loess , na.rm = TRUE ) +
 ggtitle("Italien daglige hospitalstal")
