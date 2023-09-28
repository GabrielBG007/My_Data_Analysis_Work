library(tidyverse)
library(datarium)
library(cowplot)
library(lubridate)
library(dplyr)
library(openair)
library(scales)
library(grid)
library(ggnewscale)

  
data1 <- left_join(Calibración, PM10SU,by=c("date"="date"))

data2 <- left_join(data1, PM1SU, by=c("date"="date"))



   ggplot() +
  theme_bw() +
  theme(legend.position= "top") +
  geom_smooth(data=data2, aes(x= date, y= ScatRed3000,colour= "635 nm"),lty=1,lwd=1, se=FALSE, span=0.1, method= "loess") +
  geom_point(data=data2, aes(x=date, y=ScatRed3000, fill= "635 nm"),pch=21, stroke=1, colour="black") +
  scale_colour_manual("",breaks= "635 nm", values= "red", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks="635 nm", values="red", guide=guide_legend(order=1)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data2, aes(x= date, y= ScatGreen3000,colour= "525 nm"),lty=1,lwd=1, alpha=0.7, se=FALSE, span=0.1) +
  geom_point(data=data2, aes(x=date, y=ScatGreen3000, fill= "525 nm"),pch=21, stroke=1, colour="black") +   
  scale_colour_manual("",breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data2, aes(x= date, y= ScatBlue3000,colour= "450 nm"),lty=1,lwd=1, alpha=0.7, se=FALSE, span=0.1) +
  geom_point(data=data2, aes(x=date, y=ScatBlue3000, fill= "450 nm"),pch=21, stroke=1, colour="black") +
  scale_colour_manual("",breaks= "450 nm", values= "blue", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data2, aes(x=date, y=PM10S*1.2, colour= "PM10"), lty=4, lwd=1, se=FALSE, span=0.1) +
  scale_colour_manual("",breaks= "PM10", values= "brown", guide=guide_legend(order=4)) +
  ggnewscale::new_scale_colour() +
  geom_smooth(data=data2, aes(x=date, y=PM1*1.2, colour= "PM1"), lty=4, lwd=1, se=FALSE, span=0.1) +
  scale_colour_manual("",breaks= "PM1", values= "salmon2", guide=guide_legend(order=5)) +
  ggnewscale::new_scale_colour() +
  geom_rect(aes(xmin= ymd_hms("2023-02-15 21:45:00"), xmax= ymd_hms("2023-02-22 23:55:00"),ymin= +Inf, ymax= -Inf, fill= "Intrusión de polvo sahariano", colour= "Intrusión de polvo sahariano"), alpha= 0.3, lwd= 0.7) +
  scale_colour_manual("",breaks= "Intrusión de polvo sahariano", values= "orange", guide=guide_legend(order=6)) +
  scale_fill_manual("",breaks= "Intrusión de polvo sahariano", values= "chocolate1", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-18 00:00:00"), xmax= ymd_hms("2023-01-21 00:00:00"),ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 1, lwd= 0.7, lty=5) +
  scale_colour_manual("",breaks= "NA", values= "black", guide=guide_legend(order=9)) +
  scale_fill_manual("",breaks= "NA", values= "white", guide=guide_legend(order=9)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-02-03 00:00:00"), xmax= ymd_hms("2023-02-06 00:00:00"),ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 1, lwd= 0.7, lty=5) +
  scale_colour_manual("",breaks= "NA", values="black", guide=guide_legend(order=9)) +
  scale_fill_manual("",breaks= "NA", values= "white", guide=guide_legend(order=9)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-07 00:00:00"), xmax= ymd_hms("2023-01-08 23:00:00"),ymin= +Inf, ymax= -Inf, fill= "Evento no identificado", colour= "Evento no identificado"), alpha= 0.3, lwd= 0.7, lty=1) +
  scale_colour_manual("",breaks= "Evento no identificado", values="springgreen3", guide=guide_legend(order=8)) +
  scale_fill_manual("",breaks= "Evento no identificado", values= "springgreen", guide=guide_legend(order=8)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-24 00:00:00"), xmax= ymd_hms("2023-01-24 23:00:00"),ymin= +Inf, ymax= -Inf, fill= "Evento no identificado", colour= "Evento no identificado"), alpha= 0.3, lwd= 0.7, lty=1) +
  scale_colour_manual("",breaks= "Evento no identificado", values="springgreen3", guide=guide_legend(order=8)) +
  scale_fill_manual("",breaks= "Evento no identificado", values= "springgreen", guide=guide_legend(order=8)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-12 00:00:00"), xmax= ymd_hms("2023-01-14 12:00:00"),ymin= +Inf, ymax= -Inf, fill= "Alta estabilidad atmosférica", colour= "Alta estabilidad atmosférica"), alpha= 0.3, lwd= 0.7, lty=1) +
  scale_colour_manual("",breaks= "Alta estabilidad atmosférica", values="red2", guide=guide_legend(order=6)) +
  scale_fill_manual("",breaks= "Alta estabilidad atmosférica", values= "red", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-27 21:00:00"), xmax= ymd_hms("2023-01-28 06:00:00"),ymin= +Inf, ymax= -Inf, fill= "Alta estabilidad atmosférica", colour= "Alta estabilidad atmosférica"), alpha= 0.3, lwd= 0.7, lty=1) +
  scale_colour_manual("",breaks= "Alta estabilidad atmosférica", values="red2", guide=guide_legend(order=6)) +
  scale_fill_manual("",breaks= "Alta estabilidad atmosférica", values= "red", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-02-01 00:00:00"), xmax= ymd_hms("2023-02-02 03:00:00"),ymin= +Inf, ymax= -Inf, fill= "Alta estabilidad atmosférica", colour= "Alta estabilidad atmosférica"), alpha= 0.3, lwd= 0.7, lty=1) +
  scale_colour_manual("",breaks= "Alta estabilidad atmosférica", values="red2", guide=guide_legend(order=6)) +
  scale_fill_manual("",breaks= "Alta estabilidad atmosférica", values= "red", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-08 12:00:00"), y= 0, xend= ymd_hms("2023-02-08 12:00:00"), yend= 7,colour= "Precipitaciones"), arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "purple2", guide=guide_legend(order=10)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-11 12:00:00"), y= 0, xend= ymd_hms("2023-02-11 12:00:00"), yend= 7,colour= "Precipitaciones"), arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "purple2", guide=guide_legend(order=10)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-21 12:00:00"), y= 0, xend= ymd_hms("2023-02-21 12:00:00"), yend= 7,colour= "Precipitaciones"), arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "purple2", guide=guide_legend(order=10)) +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks = "2 day") +
  scale_y_continuous(expand=c(0,0),name= expression("Dispersión Aurora 3000 (Mm"^-1*")"),sec.axis= sec_axis(trans= ~./1.2, name=expression("PM (µg/m"^3*")"))) +
  labs(x="") + labs(colour="") +  
  theme(axis.title.x= element_text(size=0)) +
  theme(plot.title= element_text(hjust= 0.5, size= 18)) +
  theme(axis.title.y= element_text(size= 16),
        axis.title.y.right= element_text(size=16),
        axis.text.y.right=element_text(size=14),
        axis.text.y=element_text(size=14),
        axis.text.x= element_text(size=12)) +
  theme(legend.text=element_text(size=12)) 
  
 
  
   

