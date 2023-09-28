library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)

data1 <- left_join(Calibración, PM10S_PM1S, by=c("date"="date")) %>% drop_na()
data2 <- data1[-c(24:29,8:9,4:5,12,15:16,20),] %>% print()

lmod1 <- lm(ScatRed3000~0 + PM10S_1S, data2)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1S, data2)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1S, data2)



summary(lmod3)

p <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10S_1S, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1S, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S_1S, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1S, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S_1S, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1S, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=3.125, y=65, label= "y= 2.5929x", colour="red", size=3) +
  annotate("text", x=3.125, y=62, label= expression("R"^2*"=0.9058 "), colour="red", size=3) +
  annotate("text", x=5.625, y=65, label= "y= 3.7607x", colour="green", size=3) +
  annotate("text", x=5.625, y=62, label= expression("R"^2*"=0.892  "), colour="green", size=3) +
  annotate("text", x=8.125, y=65, label= "y= 4.8747x", colour="blue", size=3) +
  annotate("text", x=8.125, y=62, label= expression("R"^2*"=0.8768 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")"))

title <- ggdraw() + draw_label("Días Normales", fontface="bold")

 plot_grid(title,p,ncol=1,rel_heights=c(0.1,1))
