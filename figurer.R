library(utils)
library(ggplot2, ggthemes)
library(ggthemes)
#read the Dataset sheet into “R”. The dat", na.strings = "", fileEncoding = "UTF-8-BOM")", na.strings = "", fileEncoding = "UTF-8-BOM")aset will be called "data".

coviddata <- as.data.frame(read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM"))
coviddata$dato <- as.Date(coviddata$dateRep, format = "%d/%m/%Y")
coviddata$doedmil <- pmin(pmax(coviddata$deaths,0),400) / coviddata$popData2019 *10e6
coviddata <-coviddata[which(coviddata$month >= 6), ]

eu_data <-coviddata[which(coviddata$continentExp == 'Europe' ), ]
eu_data <- eu_data[-which(eu_data$geoId %in% c("AM","BA","AD","AL","GE","GI","LU","ME","SM","VA","MC","MD","MK","RU","IM","GG","AZ","SI","XK","RS","BY","JE","MT","UA")), ]

ggplot(eu_data, aes(x = dato, y = Cumulative_number_for_14_days_of_COVID.19_cases_per_100000, colour = geoId)) +
  geom_line()  + #scale_color_colorblind()+ *
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-05-01',Sys.Date())))  +
  facet_wrap(vars( geoId), ncol = 6) + 
  theme(legend.position = "none", axis.title.y = element_blank(), axis.title.x =  element_blank(),plot.title = element_text(hjust = 0.5)) +
  ggtitle("Europa - 14 dages kumuleret incidens")

# ggplot(eu_data, aes(x = dato, y = doedmil, colour = geoId)) +
#   geom_line()  + #scale_color_colorblind()+ *
#   scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-05-01',Sys.Date())))  +
#   facet_wrap(vars( geoId), ncol = 6) + theme(legend.position = "none")
# 
# dd <- coviddata[which(coviddata$geoId == "ES"), ]
# plot()  sdsdsd

ferie <- eu_data[which(eu_data$geoId %in% c("AT","DE","DK","NO","SE","IT","FR","ES")), ]
ggplot(ferie, aes(x = dato, y = Cumulative_number_for_14_days_of_COVID.19_cases_per_100000, colour = geoId)) +
  geom_line() + scale_color_colorblind() + facet_wrap(vars( geoId), ncol = 2) +
  geom_hline(aes(yintercept = 30, lty="dotted")) +
  # geom_hline(aes(yintercept = 30, linetype="dashed"))  + 
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-08-01',Sys.Date()))) + theme(legend.position = "none") +
  theme(legend.position = "none", axis.title.y = element_blank(), axis.title.x =  element_blank(),plot.title = element_text(hjust = 0.5)) +
  ggtitle("Ferielande - 14 dages kumuleret incidens")


# fdfsdf
ggplot(subset(ferie, geoId %in% c("IT")), aes(x = dato, y = Cumulative_number_for_14_days_of_COVID.19_cases_per_100000, colour = geoId)) +
  geom_line() + scale_color_colorblind()+ 
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-07-01',Sys.Date()))) 

ggplot(subset(coviddata, geoId %in% c("DK")), aes(x = dato, y = Cumulative_number_for_14_days_of_COVID.19_cases_per_100000, colour = geoId)) +
  geom_line() + scale_color_colorblind() +
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-07-01',Sys.Date())))  +
  stat_smooth(method=lm , formula = y ~ poly(x,8), na.rm = TRUE )

ggplot(subset(coviddata, geoId %in% c("FR")), aes(x = dato, y = Cumulative_number_for_14_days_of_COVID.19_cases_per_100000, colour = geoId)) +
  geom_line() + scale_color_colorblind() +
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-07-01',Sys.Date())))  +
  stat_smooth(method=lm , formula = y ~ poly(x,8), na.rm = TRUE )

ggplot(subset(coviddata, geoId %in% c("DK")), aes(x = dato, y = cases, colour = geoId)) +
  geom_line() + scale_color_colorblind() +
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-05-01',Sys.Date())))  +
  stat_smooth(method=lm , formula = y ~ poly(x,8), na.rm = TRUE )

ggplot(subset(coviddata, geoId %in% c("DK")), aes(x = dato, y = cases, colour = geoId)) +
  geom_line() + scale_color_colorblind() +
  scale_x_date(date_labels="%b",date_breaks  ="1 month" ,limits = as.Date(c('2020-05-01',Sys.Date())))  +
  stat_smooth(method=loess ,  na.rm = TRUE )

