## Simeon Markind
## Module 2 Data Preparation
## 12/21/2017

library(tidyverse)
setwd("/msu/home/m1ssb03/Howard/Spring_2018/mod2_raw_data/")

# Files to read in
files <- list.files()

data_files <- str_subset(files, "redfin.*")

raw_data <- map(data_files, read.csv) %>% 
    set_names(data_files) %>% 
    enframe(name = "files", value = "data")

# Purposely dirtying the location so we can subset out later
raw_data$data[[5]][c(3, 6, 10, 15), "STATE"] <- "Michigan"
raw_data$data[[6]][seq(1, 60, 10), "STATE"] <- "COLORADO"
raw_data$data[[2]][, "STATE"] <- "Virginia" # will need to turn to VA
raw_data$data[[1]][, "STATE"] <- "va" # will need to turn to upper case

# Combine the city and state columns
raw_data <- raw_data %>% mutate(dirty_data = map(data, 
                                   ~ .x %>% mutate(CITY_STATE = paste(CITY, STATE, sep = ", "),
                                                   PRICE = paste0("USD", PRICE),
                                                   CITY = NULL,
                                                   STATE = NULL,
                                                   LAT_LON = paste(LATITUDE, LONGITUDE, sep = "&"),
                                                   LATITUDE = NULL,
                                                   LONGITUDE = NULL,
                                                   ZIP_CODE = paste0("'", ZIP, "0000"),
                                                   ZIP = NULL,
                                                   LIST.DATE = format(as.Date(SOLD.DATE, "%B-%d-%Y") - DAYS.ON.MARKET,
                                                                      "%A- %b %d, %Y"),
                                                   DAYS.ON.MARKET = NULL,
                                                   PROPERTY.TYPE = paste0("propertytype:", PROPERTY.TYPE))),
                                property_data = map(dirty_data, ~ select(.x, -ADDRESS, -ZIP_CODE,
                                                                         -LAT_LON, -CITY_STATE,
                                                                         -LOCATION, -X..SQUARE.FEET)),
                                location_data = map(dirty_data, ~ select(.x, URL, ADDRESS, ZIP_CODE,
                                                                         LAT_LON, CITY_STATE, LOCATION)),
                                prop_path = paste0("property_", files),
                                loc_path = paste0("location_", files))

walk2(raw_data$property_data,
      raw_data$prop_path,
      ~ write_csv(.x, paste0("/msu/home/m1ssb03/Howard/Spring_2018/mod2/Data/", .y)))

walk2(raw_data$location_data,
      raw_data$loc_path,
      ~ write_csv(.x, paste0("/msu/home/m1ssb03/Howard/Spring_2018/mod2/Data/", .y)))

                                
# Convering upper and lower case str_to_upper/lower
# is a certain phrase in a string
# string replacing (str_replace)
# string detection (str_detect)
# string length (str_length) and str_sub - zip code cleaning
# String subsetting str_subset