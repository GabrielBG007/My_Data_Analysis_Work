library(tidyverse)
library(ggplot2)
library(datarium)
library(openair)
library(cowplot)
library(dplyr)
library(viridis)
data1 <- Suelo %>% 
  pivot_longer(c("Control","Burned"), names_to= "WA", values_to= "WAV") %>% 
 print()
data2 <- data1 %>% mutate("<5" = if_else(WAV <5,1,NA_integer_)) %>% mutate("10" = if_else(WAV >= 5 & WAV < 10, 2, NA_integer_)) %>% 
  mutate("30" = if_else(WAV >=10 & WAV <30,3,NA_integer_)) %>% mutate("60" = if_else(WAV >=30 & WAV <60,4,NA_integer_)) %>% 
  mutate("180" = if_else(WAV >=60 & WAV < 180,5,NA_integer_)) %>% mutate("300" = if_else(WAV >=180 & WAV <300,6,NA_integer_)) %>% 
  mutate("600" = if_else(WAV >=300 & WAV <600,7,NA_integer_)) %>% mutate("900" = if_else(WAV >=600 & WAV <900,8,NA_integer_)) %>% 
  mutate("3600" = if_else(WAV >=900,9,NA_integer_)) %>%  print()
data3 <- data2[,-2] 
data4 <- data3 %>% pivot_longer(c("3600","900","600","300","180","60","30","10","<5"),
values_to= "Interval", names_to= "IntervalN") %>% print()
data5 <- data4 %>% select(WA,Interval) %>% filter(Interval==c(9,8,7,6,5,4,3,2,1))
ggplot(data5, aes(x= WA, fill= factor(Interval))) +
  geom_bar(colour= "black", width= 0.7,size=0.6, position="fill") +
  scale_fill_manual(values = c("blue","green3","green4","yellow","orange","orangered","red","red4","violetred4"),
  labels=c("<5","10","30","60","180","300","600","900","3600 seconds"), guide=guide_legend(nrow=1)) +
  coord_flip() +
  theme_classic() +
  theme(axis.text.y = element_text(size= 12)) +
  theme(aspect.ratio= 0.3) +
  theme(legend.position= "bottom", legend.key.width = unit(0.5, "cm")) +
  labs(y="") + labs(fill="") +
  scale_y_reverse(name="", breaks=c(0,0.2,0.4,0.6,0.8,1),
                  labels= scales::percent(c(1,0.8,0.6,0.4,0.2,0))) +
  labs(x="") +
  theme(axis.text.x = element_text(size= 12)) +
  theme(legend.text=element_text(size= 12)) 
  
 

    
