library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- left_join(Calibración, PM10S_PM1, by=c("date"="date")) %>% drop_na() %>%  print()

data2 <- left_join(data1, PM1UR, by=c("date"="date")) %>% drop_na() %>% select(1:4,24:25) %>% print()

data3 <- data2[-c(17:22,6:7,3:4,9,12),]

lmod1 <- lm(ScatRed3000~0 + PM10S_1 + PM1, data= data3)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1 + PM1, data= data3)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1 + PM1, data= data3)

summary(lmod2)

p2 <- ggplot() +
  theme_bw() +
  geom_point(data=data3, aes(x=PM10S_1, y=ScatRed3000, colour="635 nm"), pch=21, alpha=0.6, size=2.7,fill="red") +
  geom_smooth(data=data3, aes(x=PM10S_1, y=ScatRed3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="red") +
  geom_point(data=data3, aes(x=PM1, y=ScatRed3000, colour="635 nm"), pch=21, alpha=0.6, size=2.7,fill="red") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatRed3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="red") +
  scale_colour_manual("", breaks="635 nm", values="black", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data3, aes(x=PM10S_1, y=ScatGreen3000, colour="525 nm"), pch=21, alpha=0.6, size=2.7,fill="green") +
  geom_smooth(data=data3, aes(x=PM10S_1, y=ScatGreen3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="green") +
  geom_point(data=data3, aes(x=PM1, y=ScatGreen3000, colour="525 nm"), pch=21, alpha=0.6, size=2.7,fill="green") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatGreen3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="green") +
  scale_colour_manual("", breaks="525 nm", values="black", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data3, aes(x=PM10S_1, y=ScatBlue3000, colour="450 nm"), pch=21, alpha=0.6, size=2.7,fill="blue") +
  geom_smooth(data=data3, aes(x=PM10S_1, y=ScatBlue3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="blue") +
  geom_point(data=data3, aes(x=PM1, y=ScatBlue3000, colour="450 nm"), pch=21, alpha=0.6, size=2.7,fill="blue") +
  geom_smooth(data=data3, aes(x=PM1, y=ScatBlue3000), se= FALSE, method="lm", formula= y~0+x+x, lty=5, colour="blue") +
  scale_colour_manual("", breaks="450 nm", values="black", guide=guide_legend(order=1)) +
  labs(x=expression("(PM"[10]*"Suburbano - PM"[1]*")+ PM1 (µg/m"^3*")"), y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title="Correlación multilineal") +
  theme(plot.title=element_text(hjust=0.52)) +
  annotate("text", x= 1.25, y= 78, label= expression("y=1.0516*PM"[10]*"- PM"[1]*"+ 1.6588*PM"[1]), colour="red") +
  annotate("text", x= 1.25, y= 72, label=expression("R"^2*"=0.9184 "), colour="red") +
  annotate("text", x= 3.75, y= 78, label=expression("y=1.7712*PM"[10]*"- PM"[1]*"+ 2.2638*PM"[1]) , colour="green") +
  annotate("text", x= 3.75, y= 72, label=expression("R"^2*"=0.9296 "), colour="green") +
  annotate("text", x= 6.25, y= 78, label= expression("y=2.406*PM"[10]*"- PM"[1]*"+ 2.838*PM"[1]), colour="blue") +
  annotate("text", x= 6.25, y= 72, label=expression("R"^2*"=0.9198 "), colour="blue") 

title2 <- ggdraw() + draw_label("Días Normales", fontface="bold")

  g2 <- plot_grid(title2, p2, ncol=1, rel_heights=c(0.1,1))
