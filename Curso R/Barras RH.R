library(tidyverse)
library(datarium)
library(dplyr)

data1 <- Marzo %>% pivot_longer(c("RH3000","RH4000"), names_to= "RH", values_to= "RHV") 
data2 <- data1 %>% select(RH,RHV) %>% mutate("<5"= ifelse(RHV < 5,1,NA_integer_)) %>% 
  mutate("10"=if_else(RHV >=5 & RHV <10,2,NA_integer_)) %>% mutate("15"=if_else(RHV >=10 & RHV <15,3,NA_integer_)) %>% 
  mutate("20"=if_else(RHV >=15 & RHV <20,4,NA_integer_)) %>%  mutate("25"=if_else(RHV >=20 & RHV <25,5,NA_integer_)) %>% 
  mutate("30"=if_else(RHV >=25 & RHV <30,6,NA_integer_)) %>% mutate("35"=if_else(RHV >=30 & RHV <35,7,NA_integer_)) %>%  mutate("40"=if_else(RHV >=35 & RHV <41,8,NA_integer_)) %>% print(n=4000) 
data3 <- data2 %>% pivot_longer(c("<5","10","15","20","25","30","35","40"), names_to= "N", values_to= "NV")
data4 <- data3 %>% select(RH,NV)
data5 <- data4 %>% filter(NV==c(1,2,3,4,5,6,7,8))

ggplot(data5, aes(x= RH, fill=factor(NV))) +
  geom_bar(colour= "black", width= 0.7, size= 0.6, position= "fill") +
  scale_fill_manual(values=c("lightskyblue1","steelblue1","royalblue1","blue1","blue4"), labels= c("<20","25","30","35","40"),
                    guide= guide_legend(nrow= 1)) +
  scale_y_reverse("",breaks=c(0,0.2,0.4,0.6,0.8,1), labels=scales::percent(c(1,0.8,0.6,0.4,0.2,0)))+
  coord_flip() +
  theme_classic() +
  theme(aspect.ratio= 0.3) +
  labs(y="Count") + labs(x="") + labs(title= "RH(%) 3000,4000") + labs(fill="RH(%)") +
  theme(legend.position = "bottom",legend.key.width = unit(0.5, "cm")) +
  theme(axis.text.y= element_text(size= 8, face= "bold")) +
  theme(axis.text.x= element_text(size= 8, face= "bold")) 
  
  
  