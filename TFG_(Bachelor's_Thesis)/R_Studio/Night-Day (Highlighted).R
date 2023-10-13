
library(tidyverse)
library(datarium)
library(lubridate)
library(scales)
library(cowplot)
data1 <- Marzo %>% mutate(hour= hour(Marzo$date))
data2 <- data1 %>% filter(hour %in% c(18,19,20,21,22,23,0,1,2,3,4,5,6)) %>% print(n=500) 
#NIGHT
p<- ggplot() +
  geom_line(data= data2, aes(x= date, y= RH3000, colour= "RH3000")) +
  geom_line(data= data2, aes(x= date, y= RH4000, colour= "RH4000")) +
  scale_colour_manual("", breaks=c("RH3000","RH4000"), values=c("blue4","turquoise1")) +
  scale_x_datetime(labels= date_format("%m-%d"), date_breaks= "day") +
  geom_rect(aes(xmin= ymd_hms("2023-03-14 18:00:00"), xmax= ymd_hms("2023-03-15 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-15 18:00:00"), xmax= ymd_hms("2023-03-16 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-16 18:00:00"), xmax= ymd_hms("2023-03-17 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-17 18:00:00"), xmax= ymd_hms("2023-03-18 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-18 18:00:00"), xmax= ymd_hms("2023-03-19 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-19 18:00:00"), xmax= ymd_hms("2023-03-20 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-20 18:00:00"), xmax= ymd_hms("2023-03-21 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-21 18:00:00"), xmax= ymd_hms("2023-03-22 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-12 18:00:00"), xmax= ymd_hms("2023-03-13 06:55:00"),
                ymin= -Inf, ymax= +Inf, fill="18:00-07:00"), colour= "transparent", alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-13 18:00:00"), xmax= ymd_hms("2023-03-14 06:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  labs(title= "Night") +
  scale_fill_manual("",breaks= "18:00-07:00", values= "pink") +
  theme(plot.title= element_text(hjust= 0.5, size=14)) +
  theme(legend.position= "bottom") +
  labs( y= "RH(%) 3000 y 4000") + labs(x="Fecha") +
  theme(axis.title.x= element_text(size=10)) +
  theme(axis.title.y= element_text(size=10)) 
#DAY
data3 <- data1 %>% filter(hour %in% c(7,8,9,10,11,12,13,14,15,16,17)) %>% print(n=500) 
q<- ggplot() +
  geom_line(data= data3, aes(x= date, y= RH3000, colour= "RH3000")) +
  geom_line(data= data3, aes(x= date, y= RH4000, colour= "RH4000")) +
  scale_colour_manual("", breaks=c("RH3000","RH4000"), values=c("blue4","turquoise1")) +
  scale_x_datetime(labels= date_format("%m-%d"), date_breaks= "day") +
  geom_rect(aes(xmin= ymd_hms("2023-03-14 7:00:00"), xmax= ymd_hms("2023-03-14 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-15 7:00:00"), xmax= ymd_hms("2023-03-15 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-16 7:00:00"), xmax= ymd_hms("2023-03-16 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-17 7:00:00"), xmax= ymd_hms("2023-03-17 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-18 7:00:00"), xmax= ymd_hms("2023-03-18 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-19 7:00:00"), xmax= ymd_hms("2023-03-19 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-20 7:00:00"), xmax= ymd_hms("2023-03-20 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-21 7:00:00"), xmax= ymd_hms("2023-03-21 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-22 7:00:00"), xmax= ymd_hms("2023-03-22 17:55:00"),
                ymin= -Inf, ymax= +Inf, fill="8:00-17:00"), colour= "transparent", alpha= 0.5) +
  geom_rect(aes(xmin= ymd_hms("2023-03-13 7:00:00"), xmax= ymd_hms("2023-03-13 17:55:00"),
                ymin= -Inf, ymax= +Inf), colour= "transparent", fill="pink",alpha= 0.5) +
  labs(title= "Daylight") +
  scale_fill_manual("",breaks= "8:00-17:00", values= "pink") +
  theme(plot.title= element_text(hjust= 0.5, size=14)) +
  theme(legend.position= "bottom") +
  labs( y= "RH(%) 3000 y 4000") + labs(x="Fecha") +
  theme(axis.title.x= element_text(size=10)) +
  theme(axis.title.y= element_text(size=10)) 
plot_grid(p,q)

  

