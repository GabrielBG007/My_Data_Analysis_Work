library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM10SU, by=c("date"="date")) %>% drop_na()

data3 <- data1[25:30,]


lmod1 <- lm(ScatRed3000~0 + PM10S, data3)
lmod2 <- lm(ScatGreen3000~0 + PM10S, data3)
lmod3 <- lm(ScatBlue3000~0 + PM10S, data3)


summary(lmod3)





p1 <- data3 %>% 
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
  annotate("text", x=22.5, y=136, label= "y= 1.4893x", colour="red", size=3) +
  annotate("text", x=22.5, y=126, label= expression("R"^2*"= 0.9838 "), colour="red", size=3) +
  annotate("text", x=32.5, y=136, label= "y= 1.8179x", colour="green", size=3) +
  annotate("text", x=32.5, y=126, label= expression("R"^2*"= 0.9624  "), colour="green", size=3) +
  annotate("text", x=42.5, y=136, label= "y= 2.2302x", colour="blue", size=3) +
  annotate("text", x=42.5, y=126, label= expression("R"^2*"= 0.9418 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title1 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

 w1 <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))

  


q1 <- data3 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=22.5, y=136, label= "y= 1.314x", colour="red", size=2.5) +
  annotate("text", x=22.5, y=126, label= expression("R"^2*"= 0.9694 "), colour="red", size=2.5) +
  annotate("text", x=32.5, y=136, label= "y= 1.8118x", colour="green", size=2.5) +
  annotate("text", x=32.5, y=126, label= expression("R"^2*"= 0.9645 "), colour="green", size=2.5) +
  annotate("text", x=42.5, y=136, label= "y= 2.1128x", colour="blue", size=2.5) +
  annotate("text", x=42.5, y=126, label= expression("R"^2*"= 0.9272 "), colour="blue", size=2.5) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=10)) +
  theme(axis.title.x=element_text(size=8)) +
  theme(axis.title.y=element_text(size=8)) +
  theme(legend.text=element_text(size=7)) 
  
  


A <- plot_grid(p,q,ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

plot_grid(title, A, ncol=1, rel_heights=c(0.1, 1))

data2 <- left_join(Calibración,PM10UR, by=c("date"="date")) %>% drop_na()

data4 <- data2[26:32,]


lmod7 <- lm(ScatRed3000~0 + PM10U, data4)
lmod8 <- lm(ScatGreen3000~0 + PM10U, data4)
lmod9 <- lm(ScatBlue3000~0 + PM10U, data4)


summary(lmod9)

r1 <- data4 %>% 
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
  annotate("text", x=22.5, y=150, label= "y= 1.6411x", colour="red", size=3) +
  annotate("text", x=22.5, y=130, label= expression("R"^2*"=0.9792 "), colour="red", size=3) +
  annotate("text", x=32.5, y=150, label= "y= 2.0219x", colour="green", size=3) +
  annotate("text", x=32.5, y=130, label= expression("R"^2*"=0.9558 "), colour="green", size=3) +
  annotate("text", x=42.5, y=150, label= "y= 2.4963x", colour="blue", size=3) +
  annotate("text", x=42.5, y=130, label= expression("R"^2*"=0.9347 "), colour="blue", size=3) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right")

title4 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

 e1 <- plot_grid(title4,r1,ncol=1,rel_heights=c(0.1,1))

o <- plot_grid(w1,e1,ncol=2,rel_widths=c(1,1))


s1 <- data4 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=22.5, y=150, label= "y= 1.4583x", colour="red", size=2.5) +
  annotate("text", x=22.5, y=130, label= expression("R"^2*"=0.9614 "), colour="red", size=2.5) +
  annotate("text", x=32, y=150, label= "y= 2.0132x", colour="green", size=2.5) +
  annotate("text", x=32, y=130, label= expression("R"^2*"=0.9531 "), colour="green", size=2.5) +
  annotate("text", x=42, y=150, label= "y= 2.3818x", colour="blue", size=2.5) +
  annotate("text", x=42, y=130, label= expression("R"^2*"=0.9139 "), colour="blue", size=2.5) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=10)) +
  theme(axis.title.x=element_text(size=8)) +
  theme(axis.title.y=element_text(size=8)) +
  theme(legend.text=element_text(size=7))

A <- plot_grid(r,s,ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

plot_grid(title, A, ncol=1, rel_heights=c(0.1, 1))

v <- plot_grid(p1,q1,r1,s1, ncol=2, nrow=2, rel_widths= c(1,1.15), labels=c("a)","b)","c)","d)"))

b <- plot_grid(title,v, ncol=1, rel_heights=c(0.1,1))

plot_grid(j,b,ncol=2, rel_widths=c(1,1))


