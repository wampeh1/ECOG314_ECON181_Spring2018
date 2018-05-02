# Bond data prep for module 2 hw
library(tidyverse)
library(stringr)
#library(scales)
setwd("~/Howard/Spring_2018/mod2/HW/")

BND <- read.csv("BND.csv") %>%
  select(date, close) %>%
  mutate(date = as.Date(date, format = "%m/%d/%Y"),
         Stock = "BND",
         Close = close,
         close = NULL)
VBLTX <- read.csv("VBLTX.csv", stringsAsFactors = F) %>%
  select(Date, Close) %>%
  mutate(date = as.Date(Date, format = "%m/%d/%Y"),
         Date = NULL,
         Stock = "VBLTX")


head(VBLTX)
head(BND)

bond_data <- full_join(BND, VBLTX) %>%
  filter(date >= as.Date("2008-01-01"))

ggplot(bond_data, aes(x=date, y=Close, color = Stock)) + geom_line()

write.csv(bond_data, "bond_data.csv", row.names = F)
