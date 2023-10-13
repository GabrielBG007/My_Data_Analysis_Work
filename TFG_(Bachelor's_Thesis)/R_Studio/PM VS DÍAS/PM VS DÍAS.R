library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)

data1 <- left_join(PM10SU,PM1SU, by=c("date"="date"))

data2 <- data1 %>% select("date", "PM10"= "PM10S", "PM1")

data3 <- data2 %>% pivot_longer(c("PM10","PM1"), names_to="PM", values_to="PMV")



ggplot() +
  theme_bw() +
  geom_smooth(data=data3, aes(x=date, y=PMV, colour= PM), lty=1, alpha=0.6, lwd=1, se=FALSE, span=0.1) +
  geom_point(data=data3, aes(x=date, y=PMV, fill= PM),  alpha=0.6, pch=21, size=2.7, stroke=1) +
  scale_fill_manual("", values=c("salmon2","brown")) +
  scale_colour_manual("", values=c("salmon2","brown")) +
  labs(title="PM VS Días", x="", y=expression("PM"[10]*",PM"[1]*"(µg/m"^3*")")) +
  theme(plot.title=element_text(hjust=0.5, size=18),
        axis.title.y=element_text(size=16),
        axis.text.y=element_text(size=14),
        axis.text.x=element_text(size=14),
        legend.text=element_text(size=16)) +
  scale_x_datetime("",labels=date_format("%b %d"), date_breaks= "5 days")

