
library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM10SU, by=c("date"="date")) %>% drop_na()

data3 <- data1[c(4:5,13,16:17),]


lmod1 <- lm(ScatRed3000~0 + PM10S, data3)
lmod2 <- lm(ScatGreen3000~0 + PM10S, data3)
lmod3 <- lm(ScatBlue3000~0 + PM10S, data3)

summary(lmod3)




p2 <- data3 %>%
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
  annotate("text", x=14.375, y=103, label= "y= 1.5113x", colour="red", size=3) +
  annotate("text", x=14.375, y=94, label= expression("R"^2*"= 0.9014 "), colour="red", size=3) +
  annotate("text", x=16.875, y=103, label= "y= 2.6215x", colour="green", size=3) +
  annotate("text", x=16.875, y=94, label= expression("R"^2*"= 0.9071  "), colour="green", size=3) +
  annotate("text", x=19.375, y=103, label= "y= 3.5148x", colour="blue", size=3) +
  annotate("text", x=19.375, y=94, label= expression("R"^2*"= 0.9048 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title2 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica", fontface="bold")

 w5 <- plot_grid(title2,p2,ncol=1,rel_heights=c(0.1,1))




data2 <-left_join(Calibración,PM10UR, by=c("date"="date")) %>% drop_na()
data4 <- data2[c(4:5,14,17:18),]

lmod7 <- lm(ScatRed3000~0 + PM10U, data4)
lmod8 <- lm(ScatGreen3000~0 + PM10U, data4)
lmod9 <- lm(ScatBlue3000~0 + PM10U, data4)

summary(lmod9)

r4 <- data4 %>%
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
  annotate("text", x=16.5, y=103, label= "y= 1.5620x", colour="red", size=3) +
  annotate("text", x=16.5, y=94, label= expression("R"^2*"=0.8811 "), colour="red", size=3) +
  annotate("text", x=17.5, y=103, label= "y= 2.6740x", colour="green", size=3) +
  annotate("text", x=17.5, y=94, label= expression("R"^2*"=0.8572 "), colour="green", size=3) +
  annotate("text", x=18.5, y=103, label= "y= 3.5742x", colour="blue", size=3) +
  annotate("text", x=18.5, y=94, label= expression("R"^2*"=0.8483 "), colour="blue", size=3) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title4 <- ggdraw() + draw_label("Dias con gran estabilidad atmosférica", fontface="bold")
   e5 <- plot_grid(title4,r4,ncol=1,rel_heights=c(0.1,1))

  p <- plot_grid(w5,e5,ncol=2,rel_widths=c(1,1))
  
  plot_grid(i,o,p,ncol=1,nrow=3,rel_widths=c(1,1))


