# library(readr)

# file_names <- list.files(read.csv("https://files.ssi.dk/covid19/overvagning/data/data-epidemiologisk-rapport-20112020-1rip.zip"), full.names = TRUE)
temp <- tempfile()
download.file("https://files.ssi.dk/covid19/overvagning/data/data-epidemiologisk-rapport-20112020-1rip.zip",temp, mode="wb") # aa <- read_file()
# aa <- readr::read_file_raw(file = "https://files.ssi.dk/covid19/overvagning/data/data-epidemiologisk-rapport-20112020-1rip.zip")
# aa <- read.csv(uzip("https://files.ssi.dk/covid19/overvagning/data/data-epidemiologisk-rapport-20112020-1rip"))
# www <- list.files(unzip(aa))
# basename(aa)
# zz <- list.files(read.csv('Data-epidemiologisk-rapport-20112020-1rip.zip'))
# qq <- list.files(aa)
# qqq <- read.csv2(unzip('Data-epidemiologisk-rapport-20112020-1rip.zip'))
# q <- unz('Data-epidemiologisk-rapport-20112020-1rip.zip')
# q <-unz(aa)
# listfiles <- lapply(q,read.csv2,sep=";")

listfiles <- lapply(unzip(temp, exdir = tempdir()),read.csv2,sep=";")
names(listfiles) <-  sub("\\.csv", "", basename(unzip(temp)))
list2env(listfiles, .GlobalEnv)

# file_names <- list.files(q, pattern = ".csv$", full.names = TRUE)



# filnames <- list.files('Data-epidemiologisk-rapport-20112020-1rip.zip', pattern = ".csv$", full.names = TRUE)


# zz <- listfiles[[1]]

