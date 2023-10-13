library(tidyverse)
library(forcats)

View(gss_cat)


class(gss_cat$marital)



mydata <- gss_cat %>% select(marital) %>% filter(marital %in% c("Never married","Divorced","Married")) %>% 
  
  mutate(marital= fct_drop(marital))

mytable <- table(mydata)

View(mytable)


chisq.test(mytable)
