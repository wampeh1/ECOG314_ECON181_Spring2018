# This program reads five years of loan data from the student.ed.gov data center,
# filters to a handful of schools over five years for a Howard homework

library(readxl)
library(tidyverse)
library(stringr)

# setwd("~/Howard_ECOG_314/Spring_2018/mod1/Hw")

# data_list <- c("2011-12CampusBased.xls", "2012-13CampusBased.xls", "2013-14CampusBased.xls",
#                "2014-15CampusBased.xls", "2015-16CampusBased.xls")
# str_extract(data_list, "\\d+")

data_files <- as_tibble(list.files(pattern = "*.xls")) %>%
  mutate(Year = str_extract(value, "\\d+"))

schools <- c("Howard University", 
             "University of Maryland, College Park", 
             "University of Virginia",
             "American University (The)",
             "George Washington University",
             "Georgetown University",
             "Morgan State University",
             "University of Maryland - Baltimore County",
             "Catholic University of America (The)",
             "George Mason University")



loans_all <- data_files %>% mutate(data = map2(value, Year,
                                 ~ read_xls(.x,
                                            sheet = 1,
                                            range = cell_limits(ul = c(4,1))) %>%
                                   select(1:5, Recipients__1, Disbursements__1) %>%
                                   mutate(Year = .y,
                                          `OPE ID` = as.numeric(`OPE ID`),
                                          `Zip Code` = as.character(`Zip Code`)) %>%
                                   rename(Recipients = Recipients__1,
                                          Disbursements = Disbursements__1) %>%
                                   filter(School %in% schools))
                                   #select(Year, `OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, Disbursements)
                                 )

loans_data <- Reduce(function(...) bind_rows(...), loans_all$data) %>%
  mutate(Date = as.numeric(Year))

write.csv(loans_data, "../Data/student_loans_ts.csv", row.names = F)

# test <- list()
# for(s in seq_along(data_list)){
#   test[[s]] <- read_xls(data_list[s], sheet = 1, range = cell_limits(ul = c(4,1)))
# }

# Single year -------------------------------------------------------------------
test <- read_xls("2009-10CBDashboard0910.xls",
                 sheet = 1,
                 range = cell_limits(ul = c(4,1)))

loans_2011 <- read_xls("2008-09CBDashboard0809.xls",
                       sheet = 1,
                       range = cell_limits(ul = c(4,1))) %>%
  select(1:5, Recipients__1, Disbursements__1) %>%
  rename(Recipients = Recipients__1,
         Disbursements = Disbursements__1) %>%
  filter(School %in% schools) %>%
  mutate(Year = 2011)

# Regression data -------------------------------------------------------------------

types <- c("Private/Non-Profit","Public")
states <- c("DC","VA","MD")

loans_2016 <- read_xls("./howard_class/Raw_data/Homework_1/2015-16CampusBased.xls",
                             sheet = 1,
                             range = cell_limits(ul = c(4,1))) %>%
  select(1:5, Recipients, Disbursements) %>%
  rename(School.Type = `School Type`) %>%
  filter(State %in% states, School.Type %in% types) %>%
  mutate(Year = 2016, dpr = Disbursements / Recipients,
         School.Type = case_when(School.Type == "Private/Non-Profit" ~ "Private",
                                 School.Type == "Private/Non-profit" ~ "Private",
                                 TRUE ~ School.Type)) %>%
  drop_na()

write.csv(loans_2016, "./howard_class/module_1/Hw/Data/student_loans_xc.csv", row.names = F)
