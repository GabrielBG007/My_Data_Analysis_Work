library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM10U_PM1, by=c("date"="date")) %>% drop_na()

data2 <- data1[c(4:5,13,16),]

lmod1 <- lm(ScatRed3000~0 + PM10U_1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM10U_1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM10U_1, data2)


summary(lmod3)

p2 <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10U_1, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U_1, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U_1, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=6.75, y=75, label= "y= 2.566x", colour="red", size=3) +
  annotate("text", x=6.75, y=65, label= expression("R"^2*"=0.7332 "), colour="red", size=3) +
  annotate("text", x=7.75, y=75, label= "y= 4.150x", colour="green", size=3) +
  annotate("text", x=7.75, y=65, label= expression("R"^2*"=0.701  "), colour="green", size=3) +
  annotate("text", x=8.75, y=75, label= "y= 5.476x", colour="blue", size=3) +
  annotate("text", x=8.75, y=65, label= expression("R"^2*"=0.6883 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")")) 

title2 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica", fontface="bold") 

 u <- plot_grid(title2,p2,ncol=1,rel_heights=c(0.1,1))

plot_grid(i,o,u,ncol=1, nrow=3, rel_widths=c(1,1))
