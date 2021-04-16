# library(jsonlite)
library(ggplot2)
library(dplyr)
library(tidyr)
`%notin%` <- Negate(`%in%`)
EUregioner <- as.data.frame(read.csv("https://opendata.ecdc.europa.eu/covid19/subnationalcaseweekly/csv/", na.strings = "NA"
                                     , fileEncoding = "UTF-8-BOM",stringsAsFactors =  FALSE))

EUregioner <- separate(EUregioner, year_week, c("aar", "ugenr"), "-W", convert = TRUE)
EUregioner$rate_14_day_per_100k <- pmax(EUregioner$rate_14_day_per_100k,0)
EUregioner <- EUregioner[which(EUregioner$aar > 2020),]

ggplot(EUregioner[which(EUregioner$country == "France" & EUregioner$nuts_code %notin% c("FRC", "FRH", "FRB", "FRD", "FRI", "FRM", "FRF", 
                                       "FRY5","FRY1","FRY2","FRY3","FRY4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + 
  facet_wrap(vars( region_name), ncol = 3) +
  theme(legend.position = "none") +
   ggtitle("Frankrigs regioner")

ggplot(EUregioner[which(EUregioner$country == "Spain" & EUregioner$nuts_code %in% c("ES53","ES51","ES70", "ES30")),]
       , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() +
  facet_wrap(vars(region_name), ncol = 2) +
  theme(legend.position = "none") +
  ggtitle("Spaniens regioner")

ggplot(EUregioner[which(EUregioner$country == "Denmark" & EUregioner$nuts_code %notin% c("GL")),]
       , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() +
  facet_wrap(vars( region_name), ncol = 2) +
  theme(legend.position = "bottom") +
  ggtitle("Danmarks regioner")

ggplot(EUregioner[which(EUregioner$country == "Italy" & EUregioner$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + 
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Italiens regioner")

ggplot(EUregioner[which(EUregioner$country == "Germany" & EUregioner$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + 
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Tysklands regioner")

ggplot(EUregioner[which(EUregioner$country == "Sweden" & EUregioner$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + 
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Sveriges regioner")

ggplot(EUregioner[which(EUregioner$country == "Norway" & EUregioner$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
       , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + 
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Norges regioner")

