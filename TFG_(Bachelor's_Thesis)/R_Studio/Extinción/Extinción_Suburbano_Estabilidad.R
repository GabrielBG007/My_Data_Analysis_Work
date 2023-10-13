library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- left_join(Calibración, PM10S_PM1S, by=c("date"="date")) %>% drop_na() %>%  print()

data2 <- left_join(data1, PM1SU, by=c("date"="date")) %>% drop_na() %>% select(1:4,24:25) %>% print()

data3 <- data2[c(4:5,12,15:16),]

lmod1 <- lm(ScatRed3000~0 + PM10S_1S + PM1, data= data3)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1S + PM1, data= data3)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1S + PM1, data= data3)

summary(lmod3)

p4 <- ggplot() +
  theme_bw() +
  geom_point(data=data3, aes(x=PM10S_1S, y=ScatRed3000, colour="635 nm"), pch=21, alpha=0.6, size=2.7,fill="red") +
  geom_smooth(data=data3, aes(x=PM10S_1S, y=ScatRed3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="red") +
  geom_point(data=data3, aes(x=PM1, y=ScatRed3000, colour="635 nm"), pch=21, alpha=0.6, size=2.7,fill="red") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatRed3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="red") +
  scale_colour_manual("", breaks="635 nm", values="black", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data3, aes(x=PM10S_1S, y=ScatGreen3000, colour="525 nm"), pch=21, alpha=0.6, size=2.7,fill="green") +
  geom_smooth(data=data3, aes(x=PM10S_1S, y=ScatGreen3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="green") +
  geom_point(data=data3, aes(x=PM1, y=ScatGreen3000, colour="525 nm"), pch=21, alpha=0.6, size=2.7,fill="green") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatGreen3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="green") +
  scale_colour_manual("", breaks="525 nm", values="black", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data3, aes(x=PM10S_1S, y=ScatBlue3000, colour="450 nm"), pch=21, alpha=0.6, size=2.7,fill="blue") +
  geom_smooth(data=data3, aes(x=PM10S_1S, y=ScatBlue3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="blue") +
  geom_point(data=data3, aes(x=PM1, y=ScatBlue3000, colour="450 nm"), pch=21, alpha=0.6, size=2.7,fill="blue") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatBlue3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="blue") +
  scale_colour_manual("", breaks="450 nm", values="black", guide=guide_legend(order=1)) +
  labs(x=expression("(PM"[10]*"Suburbano - PM"[1]*")+ PM1 (µg/m"^3*")"), y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title="Correlación multilineal") +
  theme(plot.title=element_text(hjust=0.52)) +
  annotate("text", x= 4.875, y= 100, label= expression("y=1.185*(PM"[10]*"- PM"[1]*") + 1.792*(PM"[1]*")"), colour="red") +
  annotate("text", x= 4.875, y= 94, label=expression("R"^2*"=0.8711 "), colour="red") +
  annotate("text", x= 7.375, y= 100, label=expression("y=1.154*(PM"[10]*"- PM"[1]*") + 3.886*(PM"[1]*")") , colour="green") +
  annotate("text", x= 7.375, y= 94, label=expression("R"^2*"=0.8938 "), colour="green") +
  annotate("text", x= 9.875, y= 100, label= expression("y=1.263*(PM"[10]*"- PM"[1]*") + 5.455*(PM"[1]*")"), colour="blue") +
  annotate("text", x= 9.875, y= 94, label=expression("R"^2*"=0.8961 "), colour="blue") 

title4 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica", fontface="bold")

  plot_grid(title4, p4, ncol=1, rel_heights=c(0.1,1))
 
 plot_grid(g1,g2,g3,g4,ncol=2,nrow=2, rel_widths=c(1,1))
 