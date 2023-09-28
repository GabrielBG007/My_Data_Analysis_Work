library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)



# SUBURBANO

data1 <- left_join(Calibración,PM10SU, by=c("date"="date")) %>% drop_na()



lmod1 <- lm(ScatRed3000~0 + PM10S, data1)
lmod2 <- lm(ScatGreen3000~0 + PM10S, data1)
lmod3 <- lm(ScatBlue3000~0 + PM10S, data1)

summary(lmod3)

p1 <- data1 %>%
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10S, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=15, y=143, label= "y= 1.4669x", colour="red", size=3) +
  annotate("text", x=15, y=133, label= expression("R"^2*"= 0.9447 "), colour="red", size=3) +
  annotate("text", x=25, y=143, label= "y= 1.9920x", colour="green", size=3) +
  annotate("text", x=25, y=133, label= expression("R"^2*"= 0.9053  "), colour="green", size=3) +
  annotate("text", x=35, y=143, label= "y= 2.5212x", colour="blue", size=3) +
  annotate("text", x=35, y=133, label= expression("R"^2*"= 0.8812 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title1 <- ggdraw() + draw_label("Período completo", fontface="bold")

 plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))





# URBANO

data2 <- left_join(Calibración,PM10UR, by=c("date"="date")) %>% drop_na()


lmod7 <- lm(ScatRed3000~0 + PM10U, data2)
lmod8 <- lm(ScatGreen3000~0 + PM10U, data2)
lmod9 <- lm(ScatBlue3000~0 + PM10U, data2)

summary(lmod9)

r <- data2 %>%
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10U, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=15, y=143, label= "y= 1.61704x", colour="red", size=3) +
  annotate("text", x=15, y=133, label= expression("R"^2*"=0.8932 "), colour="red", size=3) +
  annotate("text", x=25, y=143, label= "y= 2.1381x", colour="green", size=3) +
  annotate("text", x=25, y=133, label= expression("R"^2*"=0.8713 "), colour="green", size=3) +
  annotate("text", x=35, y=143, label= "y= 2.6926x", colour="blue", size=3) +
  annotate("text", x=35, y=133, label= expression("R"^2*"=0.8515 "), colour="blue", size=3) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title3 <- ggdraw() + draw_label("Período completo", fontface="bold")
plot_grid(title3,r,ncol=1,rel_heights=c(0.1,1))

