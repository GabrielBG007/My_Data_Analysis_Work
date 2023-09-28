library(tidyverse)
library(scales)
library(ggnewscale)


data1 <- PM10 %>% pivot_longer(c("PM10_S","PM10_U"), names_to= "Name", values_to= "NameV") %>% 
  print()
data1 %>% 
  ggplot() +
  theme_bw() +
  geom_boxplot(aes(x=Name, y= NameV, fill= Name)) +
  scale_x_discrete("", labels= "Ciudad") +
  scale_fill_manual(values=c("orange","purple")) +
  theme(legend.position = "none") +
 theme(axis.text.x= element_text(face="bold")) +
  labs(y=expression("PM"[10]*"(µg/m"^3*")")) 
  
  
  
  

        