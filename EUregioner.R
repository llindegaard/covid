library(jsonlite)
`%notin%` <- Negate(`%in%`)
# EUregioner <- read_json("https://opendata.ecdc.europa.eu/covid19/subnationalcaseweekly/json/", simplifyVector = TRUE)
EUregioner <- as.data.frame(read.csv("https://opendata.ecdc.europa.eu/covid19/subnationalcaseweekly/csv/", na.strings = "", fileEncoding = "UTF-8-BOM"))
aar <- strsplit(EUregioner$year_week, "-W")
uge <- data.frame(matrix(as.numeric(unlist(aar)), nrow=length(aar), byrow=T))

names(uge) <- c("aar","ugenr")
bbb <- cbind(EUregioner,uge)

ggplot(bbb[which(bbb$country == "France" & bbb$nuts_code %notin% c("FRY1","FRY2","FRY3","FRY4")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = region_name)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 3) +
  theme(legend.position = "none") +
   ggtitle("Frankrigs regioner")

ggplot(bbb[which(bbb$country == "Spain" & bbb$nuts_code %in% c("ES53","ES51")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = region_name)) +
  geom_line() +
  geom_hline(aes(yintercept = 30,  color = 'green')) + # scale_color_colorblind() +
  # stat_smooth(method=loess , na.rm = TRUE ) +
  ggtitle("Spaniens regioner")

ggplot(bbb[which(bbb$country == "Denmark" & bbb$nuts_code %notin% c("GL")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = region_name)) +
  geom_line() + # scale_color_colorblind() +
  # facet_wrap(vars( region_name), ncol = 2) +
  # theme(legend.position = "none") +
  ggtitle("Danmarks regioner")
<<<<<<< HEAD


ggplot(bbb[which(bbb$country == "Italy" & bbb$nuts_code %notin% c("ITC1", "ITC2","ITC4", "ITF1", "ITF2", "ITF3", "ITF5", "ITF6","ITG1", "ITG2", "ITH1", "ITH2", "ITH4")),], aes(x = ugenr, y = rate_14_day_per_100k/2, color = region_name)) +
  geom_line() + # scale_color_colorblind() +
  facet_wrap(vars( region_name), ncol = 4) +
  theme(legend.position = "none") +
  ggtitle("Italiens regioner")
=======
>>>>>>> e237d7bac1f6909a968a25c5a4d3acb673733cc3
