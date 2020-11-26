temp <- tempfile()
SSIfil <- c("https://files.ssi.dk/covid19/overvagning/data/data-epidemiologiske-rapport-25112020-88op")
download.file(paste0(SSIfil,".csv"),temp, mode="wb") # aa <- read_file()
SSIdata <- lapply(unzip(temp, exdir = tempdir()),read.csv2,sep=";")
names(SSIdata) <-  sub("\\.csv", "", basename(unzip(temp)))
list2env(SSIdata, .GlobalEnv)
rm(SSIdata, temp)

library(ggplot2)
library(reshape2)
`%notin%` <- Negate(`%in%`)
Test_pos_over_time <- Test_pos_over_time[-which(Test_pos_over_time$Date %in% c("I alt", "Antal personer")), ]
Test_pos_over_time$Date <- as.Date(Test_pos_over_time$Date, format = "%Y-%m-%d")
Test_pos_over_time$NewPositive <- as.numeric(gsub(" ","", gsub("\\." , "", Test_pos_over_time$NewPositive)))

ggplot(Test_pos_over_time, aes(x = Date, y = NewPositive)) +
  geom_line() +
  stat_smooth(method=loess, formula = y ~ x, na.rm = TRUE )

Municipality_cases_time_series$date_sample <- as.Date(Municipality_cases_time_series$date_sample)
mm <- melt(Municipality_cases_time_series, id='date_sample')
ggplot(mm[which(mm$variable %in% c("Furesø","Egedal")),], aes(x = date_sample, y = value, color = variable)) +
  geom_line() 


ggplot(mm[which(mm$variable %notin% c("Copenhagen","Aarhus","Aalborg","Odense")),], aes(x = date_sample, y = value, color = variable)) +
  geom_line() +
  facet_wrap(vars( variable), ncol = 10) +
  theme(legend.position = "none") +
  stat_smooth(method=loess, formula = y ~ x, na.rm = TRUE )

ggplot(mm[which(mm$variable %in% c("Copenhagen","Aarhus","Aalborg","Odense")),], aes(x = date_sample, y = value, color = variable)) +
  geom_line() +
  facet_wrap(vars( variable), ncol = 2) +
  theme(legend.position = "none") +
  stat_smooth(method=loess, formula = y ~ x, na.rm = TRUE )

ggplot(mm[which(mm$variable %in% c("Allerød","Ballerup","Hillerød","Lyngby.Taarbæk","Furesø","Egedal","Herlev","Thisted","Slagelse")),], aes(x = date_sample, y = value, color = variable)) +
  geom_line() +
  facet_wrap(vars( variable), ncol = 3) +
  theme(legend.position = "none") +
  stat_smooth(method=loess, formula = y ~ x, na.rm = TRUE )

