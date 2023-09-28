library(tidyverse)
library(datarium)
library(scales)
library(cowplot)
library(ggnewscale)

ggplot() +
  theme_bw() +
  geom_line(data= PM10SU, aes(x=date, y=PM10S, colour= "PM10S"), lwd=1, alpha=0.6) +
  geom_point(data= PM10SU, aes(x=date, y=PM10S, fill= "PM10S"), colour="black", stroke=1, alpha=0.6, pch=21) +
  geom_line(data= PM10UR, aes(x=date, y=PM10U, colour= "PM10U"), lwd=1, alpha=0.6, lty=6) +
  geom_point(data= PM10UR, aes(x=date, y=PM10U, fill= "PM10U"), colour="black", stroke=1, alpha=0.6, pch=24) +
  geom_line(data= PM1U, aes(x=date, y=PM1, colour= "PM1"), lwd=1, alpha=0.6) +
  geom_point(data= PM1U, aes(x=date, y=PM1, fill= "PM1"), colour="black", stroke=1, alpha=0.6, pch=22) +
  scale_colour_manual("", breaks=c("PM10S","PM10U","PM1"), values=c("chocolate3","chocolate3","tan1"), guide=guide_legend(order=1, override.aes=list(pch=c(21,24,22)))) +
  scale_fill_manual("", breaks=c("PM10S","PM10U","PM1"), values=c("chocolate3", "chocolate3", "tan1"), guide=guide_legend(order=1)) +
  scale_x_datetime("", labels= date_format("%b %d"), breaks= date_breaks("5 day")) +
  labs(x="", y=expression("PM"[10]*"S , PM"[10]*"U , PM"[1]*" (µg/m"^3*")"), title=expression(" Evolución PM"[10]*"S , PM"[10]*"U , PM"[1]*" VS Días")) +
  theme(plot.title= element_text(hjust=0.5))
