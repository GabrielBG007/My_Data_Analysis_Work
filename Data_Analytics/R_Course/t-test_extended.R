library(tidyverse)
library(patchwork)
library(gapminder)
View(gapminder)


# One sided t-test
mytest <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp) %>% 
  t.test(mu=50)


mytest$p.value

# Two sided t-test for difference of means

gapminder %>% 
  filter(continent %in% c("Africa","Europe")) %>% 
  t.test(lifeExp~continent, data=.,
         alternative="two.sided")
# One sided test for difference of means

gapminder %>% 
  filter(country %in% c("Ireland","Switzerland")) %>% 
  t.test(lifeExp~country, data=.,
         alternative="less",
         conf.level=0.95)
# Paired t-test

gapminder %>% 
  filter(year %in% c(1957,2007) &
           continent=="Africa") %>% 
  mutate(year=factor(year, level= c(2007,1957))) %>% 
  t.test(lifeExp~year, data=.,
         paired= TRUE)

# Assumptions of t-test

var(gapminder$lifeExp[gapminder$country=="Ireland"])
var(gapminder$lifeExp[gapminder$country=="Switzerland"])
