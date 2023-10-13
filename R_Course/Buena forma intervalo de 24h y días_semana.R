library(tidyverse)
library(datarium)
library(cowplot)
library(lubridate)
library(dplyr)
library(openair)
library(scales)
library(grid)
library(ggnewscale)
library(hrbrthemes)



data1 <- Calibración %>% mutate(hour= hour(Calibración$date)) %>% print()
data2 <- data1 %>% group_by(hour) %>% filter(hour %in% c(8,9,10,11,12,13,14,15,16,17,18)) %>%  summarise("ScatRed3000"= mean(ScatRed3000),
                                                "ScatGreen3000"= mean(ScatGreen3000),
                                                "ScatBlue3000"= mean(ScatBlue3000),
                                                "ScatRed4000"= mean(ScatRed4000),
                                                "ScatGreen4000"= mean(ScatGreen4000),
                                                "ScatBlue4000"= mean(ScatBlue4000)) %>% print(n=24)
class(data2$hour)
ggplot() +
  theme_tinyhand() +
  geom_line(data= data2, aes(x=hour, y= ScatRed3000), colour="red", alpha= 0.5, lwd=1) +
  scale_x_continuous(name="", breaks=c(8,9,10,11,12,13,14,15,16,17,18)) 
d<- timeVariation(Calibración, pollutant="ScatRed3000")
plot(d, subset= "hour")  
