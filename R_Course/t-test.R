library(tidyverse)

mydata <- starwars %>% 
  select(sex,height) %>% 
  filter(sex %in% c("male","female")) %>% 
  drop_na(height)

t.test(height~sex,mydata)
