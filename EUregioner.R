library(jsonlite)
library(ggplot2)
library(dplyr)
library(tidyr)
`%notin%` <- Negate(`%in%`)
EUregioner <- as.data.frame(read.csv("https://opendata.ecdc.europa.eu/covid19/subnationalcaseweekly/csv/", na.strings = "NA"
                                     , fileEncoding = "UTF-8-BOM",stringsAsFactors =  FALSE))

bbb <- separate(EUregioner, year_week, c("aar", "ugenr"), "-W", convert = TRUE)

ggplot(bbb[which(bbb$country == "France" & bbb$nuts_code %notin% c("FRC", "FRH", "FRB", "FRM", "FRF", "FRY1","FRY2","FRY3","FRY4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 3) +
  theme(legend.position = "none") +
   ggtitle("Frankrigs regioner")

ggplot(bbb[which(bbb$country == "Spain" & bbb$nuts_code %in% c("ES53","ES51","ES70")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() +
  facet_wrap(vars(region_name), ncol = 2) +
  # geom_hline(aes(yintercept = 30,  color = 'green')) + # scale_color_colorblind() +
  # stat_smooth(method=loess , na.rm = TRUE ) +
  ggtitle("Spaniens regioner")

ggplot(bbb[which(bbb$country == "Denmark" & bbb$nuts_code %notin% c("GL")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 2) +
  # theme(legend.position = "none") +
  ggtitle("Danmarks regioner")

ggplot(bbb[which(bbb$country == "Italy" & bbb$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Italiens regioner")

ggplot(bbb[which(bbb$country == "Germany" & bbb$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Tysklands regioner")

ggplot(bbb[which(bbb$country == "Sweden" & bbb$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),]
        , aes(x = ugenr, y = rate_14_day_per_100k/2, color = aar)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Sveriges regioner")

