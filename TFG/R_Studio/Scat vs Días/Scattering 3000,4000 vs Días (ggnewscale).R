library(tidyverse)
library(datarium)
library(cowplot)
library(lubridate)
library(dplyr)
library(openair)
library(scales)
library(grid)
library(ggnewscale)


data1 <- timeAverage(Calibración, avg.time= "day.hour", interval= "day") %>% print()
p <- ggplot() +
  theme_bw() +
  geom_line(data=data1, aes(x= date, y= ScatRed4000,colour= "635 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "635 nm", values= "red", guide=guide_legend(order=1)) +
  ggnewscale::new_scale_colour() +
  geom_line(data=data1, aes(x= date, y= ScatGreen4000,colour= "525 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_line(data=data1, aes(x= date, y= ScatBlue4000,colour= "450 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "450 nm", values= "blue", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_rect(aes(xmin= ymd_hms("2023-02-15 21:45:00"), xmax= ymd_hms("2023-02-22 23:55:00"),
  ymin= +Inf, ymax= -Inf, fill= "Intrusión de polvo sahariano", colour= "Intrusión de polvo sahariano"), alpha= 0.3, lwd= 1) +
  scale_colour_manual("",breaks= "Intrusión de polvo sahariano", values= "orange", guide=guide_legend(order=4)) +
  scale_fill_manual("",breaks= "Intrusión de polvo sahariano", values= "chocolate1", guide=guide_legend(order=4)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-18 00:00:00"), xmax= ymd_hms("2023-01-21 00:00:00"),
  ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 0.5, lwd= 1) +
  scale_colour_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  scale_fill_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-02-03 00:00:00"), xmax= ymd_hms("2023-02-06 00:00:00"),
  ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 0.5, lwd= 1) +
  scale_colour_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  scale_fill_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-09 12:00:00"), y= 0, xend= ymd_hms("2023-02-09 12:00:00"), yend= 12.5,
  colour= "Precipitaciones"), 
  arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-11 12:00:00"), y= 0, xend= ymd_hms("2023-02-11 12:00:00"), yend= 12.5,
  colour= "Precipitaciones"), 
  arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-21 12:00:00"), y= 0, xend= ymd_hms("2023-02-21 12:00:00"), yend= 12.5,
  colour= "Precipitaciones"), 
  arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks = "2 day") +
  labs(x="") + labs(y= expression("Dispersión Aurora 4000 (Mm"^-1*")")) + labs(colour="") + labs(title= "Dispersión Aurora 4000 VS Días") + 
  theme(axis.title.x= element_text(size=0)) +
  theme(plot.title= element_text(hjust= 0, size= 13)) +
  theme(axis.title.y= element_text(size= 11)) +
  theme(legend.text=element_text(size=10)) +
  theme(legend.position= "top") +
  scale_y_continuous(expand=c(0,0)) 

q <- ggplot() +
  theme_bw() +
  geom_line(data=data1, aes(x= date, y= ScatRed3000,colour= "635 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "635 nm", values= "red", guide=guide_legend(order=1)) +
  ggnewscale::new_scale_colour() +
  geom_line(data=data1, aes(x= date, y= ScatGreen3000,colour= "525 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_line(data=data1, aes(x= date, y= ScatBlue3000,colour= "450 nm"),lty=1,lwd=1) +
  scale_colour_manual("",breaks= "450 nm", values= "blue", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_rect(aes(xmin= ymd_hms("2023-02-15 21:45:00"), xmax= ymd_hms("2023-02-22 23:55:00"),
                ymin= +Inf, ymax= -Inf, fill= "Intrusión de polvo sahariano", colour= "Intrusión de polvo sahariano"), alpha= 0.3, lwd= 1) +
  scale_colour_manual("",breaks= "Intrusión de polvo sahariano", values= "orange", guide=guide_legend(order=4)) +
  scale_fill_manual("",breaks= "Intrusión de polvo sahariano", values= "chocolate1", guide=guide_legend(order=4)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-01-18 00:00:00"), xmax= ymd_hms("2023-01-21 00:00:00"),
                ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 0.5, lwd= 1) +
  scale_colour_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  scale_fill_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_rect(aes(xmin= ymd_hms("2023-02-03 00:00:00"), xmax= ymd_hms("2023-02-06 00:00:00"),
                ymin= +Inf, ymax= -Inf, fill= "NA", colour= "NA"), alpha= 0.5, lwd= 1) +
  scale_colour_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  scale_fill_manual("",breaks= "NA", values= "grey", guide=guide_legend(order=5)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-09 12:00:00"), y= 0, xend= ymd_hms("2023-02-09 12:00:00"), yend= 12.5,
                   colour= "Precipitaciones"), 
               arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-11 12:00:00"), y= 0, xend= ymd_hms("2023-02-11 12:00:00"), yend= 12.5,
                   colour= "Precipitaciones"), 
               arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  ggnewscale::new_scale_colour() +
  geom_segment(aes(x= ymd_hms("2023-02-21 12:00:00"), y= 0, xend= ymd_hms("2023-02-21 12:00:00"), yend= 12.5,
                   colour= "Precipitaciones"), 
               arrow= arrow(length= unit(0.5, "cm")),lwd=1.5) +
  scale_colour_manual("",breaks= "Precipitaciones", values= "steelblue1", guide=guide_legend(order=6)) +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks = "2 day") +
  labs(x="") + labs(y= expression("Dispersión Aurora 3000 (Mm"^-1*")")) + labs(colour="") + labs(title= "Dispersión Aurora 3000 VS Días") + 
  theme(axis.title.x= element_text(size=0)) +
  theme(plot.title= element_text(hjust= 0, size= 13)) +
  theme(axis.title.y= element_text(size= 11)) +
  theme(legend.text=element_text(size=10)) +
  theme(legend.position= "top") +
  scale_y_continuous(expand=c(0,0)) 
plot_grid(q,p, nrow=2, ncol=1, labels=c("a)","b)"))
class(Calibración$date)


