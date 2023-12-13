library(tidyverse)
library(patchwork)
library(gapminder)
library(forcats)

head(gapminder)

#Create a data set to work with

gapdata <- gapminder %>% 
  filter(year==2007 &
           continent %in% c("Americas","Europe","Asia")) %>% 
  select(continent, lifeExp)

#Take a look at the distributions of means

gapdata %>% 
  group_by(continent) %>% 
  summarise(Mean_life = mean(lifeExp)) %>% 
  arrange(Mean_life)

#ANOVA model

gapdata %>% aov(lifeExp~continent, data=.) %>% 
  summary()

#Is this sifnificance being driven by a particular continent?

gapdata %>% 
  aov(lifeExp~continent, data=.) %>% 
  TukeyHSD() %>% 
  plot()
