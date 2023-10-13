library(tidyverse)
View(msleep)

mydata <- msleep %>% select(vore,sleep_rem) %>% drop_na()

mod1 <- aov(sleep_rem~vore, msleep)

summary(mod1)



mod2 <- t.test(ScatRed3000~ScatRed4000,Calibración)

summary(mod2)
