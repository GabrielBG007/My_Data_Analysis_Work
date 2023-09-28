library(tidyverse)
library(datarium)
library(cowplot)
library(lubridate)
library(dplyr)
library(openair)
library(scales)
library(grid)



data1 <- timeAverage(Calibración, avg.time= "day") %>% print()
class(Calibración$date)
p <-ggplot() +
  theme_bw() +
  theme(legend.position= "bottom") +
  geom_line(data=data1, aes(x= date, y= ScatRed3000,linetype="635 nm"),colour= "red",lwd=1) +
  geom_line(data=data1, aes(x= date, y= ScatGreen3000,linetype="525 nm"),colour= "green",lwd=1) +
  geom_line(data=data1, aes(x= date, y= ScatBlue3000,linetype="450 nm"),colour="blue",lwd=1) +
  geom_rect(aes(xmin= ymd_hms("2023-02-15 21:45:00"), xmax= ymd_hms("2023-02-22 23:55:00"),
                ymin= +Inf, ymax= -Inf, fill= "Intrusión de polvo sahariano"), colour= "orange", alpha= 0.3, lwd= 1) +
  geom_rect(aes(xmin= ymd_hms("2023-01-18 00:00:00"), xmax= ymd_hms("2023-01-21 00:00:00"),
                ymin= +Inf, ymax= -Inf, fill= "NA"), colour= "grey", alpha= 0.5, lwd=1) +
  geom_rect(aes(xmin= ymd_hms("2023-02-03 00:00:00"), xmax= ymd_hms("2023-02-06 00:00:00"),
                ymin= +Inf, ymax= -Inf, fill= "NA"), colour= "grey", alpha= 0.5, lwd=1) +
  geom_segment(aes(x= ymd_hms("2023-02-09 12:00:00"), y= 0, xend= ymd_hms("2023-02-09 12:00:00"), yend= 12.5,
                   colour= "Precipitaciones"), 
               arrow= arrow(length= unit(0.5, "cm")),lwd=1) +
  scale_fill_manual("", breaks=c("Intrusión de polvo sahariano","NA"), values=c("chocolate1","grey"),
                    guide=guide_legend(override.aes=list(colour=c("orange","grey"), alpha=0.3))) +
  scale_colour_manual( breaks="Precipitaciones",values= "red") +
  scale_linetype_manual("",breaks=c("635 nm","525 nm","450 nm"), values=c(1,1,1), guide=guide_legend(override.aes=list(colour=c("red","green","blue")))) +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks = "2 day") +
  labs(x="") + labs(y= expression("Dispersión Aurora 3000 (Mm"^-1*")")) + labs(colour="") + labs(title= "Dispersión Aurora 3000 VS Días") + 
  theme(axis.title.x= element_text(size=0)) 
theme(plot.title= element_text(hjust= 0.5, size= 13)) +
  theme(axis.title.y= element_text(size= 11)) +
  theme(legend.position= "top") 


  q <-ggplot() +
  theme_bw() +
  theme(legend.position= "bottom") +
  geom_line(data=data1, aes(x= date, y= ScatRed4000,linetype="635 nm"),colour= "red",lwd=1) +
  geom_line(data=data1, aes(x= date, y= ScatGreen4000,linetype="525 nm"),colour= "green",lwd=1) +
  geom_line(data=data1, aes(x= date, y= ScatBlue4000,linetype="450 nm"),colour="blue",lwd=1) +
  geom_rect(aes(xmin= ymd_hms("2023-02-15 21:45:00"), xmax= ymd_hms("2023-02-22 23:55:00"),
  ymin= +Inf, ymax= -Inf, fill= "Intrusión de polvo sahariano"), colour= "orange", alpha= 0.3, lwd= 1) +
  geom_rect(aes(xmin= ymd_hms("2023-01-18 00:00:00"), xmax= ymd_hms("2023-01-21 00:00:00"),
  ymin= +Inf, ymax= -Inf, fill= "NA"), colour= "grey", alpha= 0.5, lwd=1) +
  geom_rect(aes(xmin= ymd_hms("2023-02-03 00:00:00"), xmax= ymd_hms("2023-02-06 00:00:00"),
  ymin= +Inf, ymax= -Inf, fill= "NA"), colour= "grey", alpha= 0.5, lwd=1) +
  geom_segment(aes(x= ymd_hms("2023-02-09 12:00:00"), y= 0, xend= ymd_hms("2023-02-09 12:00:00"), yend= 12.5,
  colour= "Precipitaciones"), 
  arrow= arrow(length= unit(0.5, "cm")),lwd=1) +
  scale_fill_manual("", breaks=c("Intrusión de polvo sahariano","NA"), values=c("chocolate1","grey"),
  guide=guide_legend(override.aes=list(colour=c("orange","grey"), alpha=0.3))) +
  scale_colour_manual( breaks="Precipitaciones",values= "red") +
  scale_linetype_manual("",breaks=c("635 nm","525 nm","450 nm"), values=c(1,1,1), guide=guide_legend(override.aes=list(colour=c("red","green","blue")))) +
  scale_x_datetime(labels= date_format("%b%d"), date_breaks = "2 day") +
  labs(x="") + labs(y= expression("Dispersión Aurora 4000 (Mm"^-1*")")) + labs(colour="") + labs(title= "Dispersión Aurora 4000 VS Días") + 
  theme(axis.title.x= element_text(size=0)) 
  theme(plot.title= element_text(hjust= 0.5, size= 13)) +
  theme(axis.title.y= element_text(size= 11)) 
  
   
  
   
  
  plot_grid(p,q,ncol= 1, nrow= 2, rel_widths=c(1,1),
            labels=c("a)","b)"))
  
