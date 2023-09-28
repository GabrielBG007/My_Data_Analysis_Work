library(tidyverse)
library(ggnewscale)
library(scales)

 
  ggplot() +
  theme_bw() +
  geom_line(data= PM10, aes(x= date,y=PM10_S, colour= "Suburbano"), size=2) +
  geom_point(data= PM10, aes(x= date,y=PM10_S, fill = "Suburbano"), pch= 21, stroke= 1,  size=2, colour= "black") +
  scale_colour_manual("",  breaks="Suburbano", values= "orange") +
  scale_fill_manual("",  breaks="Suburbano", values= "green") +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data= PM10, aes(x= date,y=PM10_U, colour= "Urbano"), size=2) +
  geom_point(data= PM10, aes(x= date,y=PM10_U, fill = "Urbano"), pch= 22, stroke= 1,  size=2, colour= "black") +
  scale_colour_manual("",  breaks="Urbano", values= "purple") +
  scale_fill_manual("", breaks= "Urbano", values= "turquoise1") +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks= "4 day") +
  labs(x="") +
  labs(y=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(title= expression("PM"[10]* "Urbano VS Suburbano")) +
  theme(plot.title= element_text(hjust=0.5)) +
  theme(axis.title.y= element_text(size=12, face= "bold")) +
  theme(legend.text= element_text(size= 10, face= "bold"))
  
  

  
  
  