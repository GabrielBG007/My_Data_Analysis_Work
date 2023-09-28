library(openair)
library(tidyverse)
library(datarium)
library(lubridate)
data1 <- Marzo %>% pivot_longer(c("RH3000","RH4000"), names_to= "RH",
values_to= "RHV") 
ggplot() +
geom_line(data = data1, aes(x=date, y= RHV, colour= RH),lwd=1) +
scale_colour_manual(values= c("blue4","turquoise1")) +
theme_classic() +
theme(legend.position= "bottom") +
labs(x="") + labs(y="RH(%) 3000 y 4000") + labs(title= "RH(%) VS Date") +
theme(plot.title=element_text(hjust= 0.5)) +
theme(legend.title=element_text(size=0)) +
theme(axis.title.y= element_text(size= 10, face= "bold")) +
theme(legend.text= element_text(face= "bold")) +
geom_rect(aes(xmin= ymd_hms("2023-03-14 17:20:00"),xmax= ymd_hms("2023-03-14 23:55:00"), ymax= +Inf, ymin= -Inf,fill= "  RH3000>RH4000"), colour= "blue",
 alpha= 0.5) +
scale_fill_manual("", breaks = "  RH3000>RH4000", values ="lightblue") +
theme(legend.key.width = unit(1, "cm")) 



            




  

