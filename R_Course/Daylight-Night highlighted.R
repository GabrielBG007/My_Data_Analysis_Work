library(tidyverse)
library(datarium)
library(lubridate)
library(scales)
library(cowplot)
ggplot() +
  geom_line(data= Marzo, aes(x= date, y= RH3000, colour= "RH3000")) +
  geom_line(data= Marzo, aes(x= date, y= RH4000, colour= "RH4000")) +
  scale_colour_manual("", breaks=c("RH3000","RH4000"), values=c("blue4","turquoise1")) +
  scale_x_datetime(labels= date_format("%m-%d"), date_breaks= "day") +
  geom_rect(aes(xmin= ymd_hms("2023-03-14 18:00:00"), xmax= ymd_hms("2023-03-15 06:55:00"),ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-15 18:00:00"), xmax= ymd_hms("2023-03-16 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-16 18:00:00"), xmax= ymd_hms("2023-03-17 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-17 18:00:00"), xmax= ymd_hms("2023-03-18 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-18 18:00:00"), xmax= ymd_hms("2023-03-19 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-19 18:00:00"), xmax= ymd_hms("2023-03-20 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-20 18:00:00"), xmax= ymd_hms("2023-03-21 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-21 18:00:00"), xmax= ymd_hms("2023-03-22 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-12 18:00:00"), xmax= ymd_hms("2023-03-13 06:55:00"),
                ymin= -Inf, ymax= +Inf, fill="Night (18:00-7:00)"), colour= "transparent", alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-13 18:00:00"), xmax= ymd_hms("2023-03-14 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="purple",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-14 7:00:00"), xmax= ymd_hms("2023-03-14 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-15 7:00:00"), xmax= ymd_hms("2023-03-15 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-16 7:00:00"), xmax= ymd_hms("2023-03-16 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-17 7:00:00"), xmax= ymd_hms("2023-03-17 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-18 7:00:00"), xmax= ymd_hms("2023-03-18 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-19 7:00:00"), xmax= ymd_hms("2023-03-19 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-20 7:00:00"), xmax= ymd_hms("2023-03-20 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-21 7:00:00"), xmax= ymd_hms("2023-03-21 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-22 7:00:00"), xmax= ymd_hms("2023-03-22 17:55:00"),
                ymin= -Inf, ymax= +Inf, fill="Daylight (8:00-17:00)"), colour= "transparent", alpha= 0.3) +
  geom_rect(aes(xmin= ymd_hms("2023-03-13 7:00:00"), xmax= ymd_hms("2023-03-13 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="yellow",alpha= 0.3) +
  scale_fill_manual("",breaks=c("Night (18:00-7:00)","Daylight (8:00-17:00)"), values=c("purple","yellow")) +
  labs(title= "Daylight-Night") +
  theme(plot.title= element_text(hjust= 0.5, size=14)) +
  theme(legend.position= "bottom") +
  labs( y= "RH(%) 3000 y 4000") + labs(x="Fecha") +
  theme(axis.title.x= element_text(size=10)) +
  theme(axis.title.y= element_text(size=10)) 
  
  

