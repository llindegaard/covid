temp <- tempfile()
SSIfil <- c("https://files.ssi.dk/covid19/overvagning/data/data-epidemiologiske-rapport-24112020-2cca")
download.file(paste0(SSIfil,".csv"),temp, mode="wb") # aa <- read_file()
# listfiles <- lapply(q,read.csv2,sep=";")

SSIdata <- lapply(unzip(temp, exdir = tempdir()),read.csv2,sep=";")
names(SSIdata) <-  sub("\\.csv", "", basename(unzip(temp)))
list2env(SSIdata, .GlobalEnv)
names(SSIdata)

rm(SSIdata, temp)

Test_pos_over_time <- Test_pos_over_time[-which(Test_pos_over_time$Date %in% c("I alt", "Antal personer")), ]
Test_pos_over_time$Date <- as.Date(Test_pos_over_time$Date, format = "%Y-%m-%d")

Test_pos_over_time$NewPositive <- as.numeric(Test_pos_over_time$NewPositive)

library(ggplot2)
ggplot(Test_pos_over_time, aes(x = Date, y = NewPositive)) +
  geom_line() 

library(reshape2)
Municipality_cases_time_series$date_sample <- as.Date(Municipality_cases_time_series$date_sample)
mm <- melt(Municipality_cases_time_series, id='date_sample')
mm <- mm[which(mm$variable %in% c("Furesø","Egedal")),]

library(ggplot2)
ggplot(mm, aes(x = date_sample, y = value, color = variable)) +
  geom_line() 

