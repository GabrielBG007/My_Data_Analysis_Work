library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)
library(RColorBrewer)

data1 <- left_join(Calibración,Division_PM, by=c("date"="date")) %>% drop_na()

data2 <- data1[-c(24:29,9,4:5,12,15:16,7),]

data3 <- data2 %>% select(date,Angstrom3000,`PM10S/PM1S`)

lmod1 <- lm(Angstrom3000~`PM10S/PM1S`, data= data3 )

summary(lmod1)

ggplot() +
  theme_bw() +
  geom_point(data=data3, aes(x= `PM10S/PM1S`, y= Angstrom3000, fill=Angstrom3000),pch=21, stroke=1, alpha=1, size=2.7) +
  geom_smooth(data=data3, aes(x= `PM10S/PM1S`, y= Angstrom3000), method="lm", lty=5, alpha=0.6, colour="black", se=FALSE) +
  scale_fill_gradientn("SAE",colors=c("darkblue","deepskyblue","yellow","green","chocolate2","red"), space="Lab") +
  annotate("text", x=4.5, y=2.3, label="y= -0.3635x + 2.4880", colour="black", size=5.8) +
  annotate("text", x=4.5, y=2.2, label=expression("R"^2*"=0.3552"), colour="black", size=5.8) +
  labs(y="SAE(3000)", x=expression("PM"[10]*"/ PM"[1]*"(µg/m"^3*")")) +
  theme(axis.title.y=element_text(size=16),
        axis.title.x=element_text(size=16),
        axis.text.y=element_text(size=14),
        axis.text.x=element_text(size=14),
        legend.text=element_text(size=16))
 
  


