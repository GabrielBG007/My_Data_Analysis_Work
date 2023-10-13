library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- left_join(Calibración, PM10S_PM1S, by=c("date"="date")) %>% drop_na()


lmod1 <- lm(ScatRed3000~0 + PM10S_1S, data1)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1S, data1)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1S, data1)



summary(lmod3)

p <- data1 %>% 
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
  annotate("text", x=7.5, y=143, label= "y= 2.2479x", colour="red", size=3) +
  annotate("text", x=7.5, y=133, label= expression("R"^2*"=0.8935 "), colour="red", size=3) +
  annotate("text", x=12.5, y=143, label= "y= 2.964x", colour="green", size=3) +
  annotate("text", x=12.5, y=133, label= expression("R"^2*"=0.8048  "), colour="green", size=3) +
  annotate("text", x=17.5, y=143, label= "y= 3.7169x", colour="blue", size=3) +
  annotate("text", x=17.5, y=133, label= expression("R"^2*"=0.768 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")"))

title <- ggdraw() + draw_label("Período completo", fontface="bold")

plot_grid(title,p,ncol=1,rel_heights=c(0.1,1))
