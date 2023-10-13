library(tidyverse)
library(modeldata)

View(scat)


filter(scat, Species=="gray_fox")

# multiple conditions

scat_sm <- scat %>% filter(Month=="January" | Year==2012)

View(scat_sm)

scat_sm <- scat %>% filter(Month %in% c("January","February"))

# inequalities

data1 <- scat %>% filter(Month !="January", Month != "February")

data2 <- scat %>% filter(is.na(Diameter))

# A short cut for leaving our NA's

data3 <- scat %>% drop_na(Taper)

