library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM10SU, by=c("date"="date")) %>% drop_na()

data3 <- data1[-c(25:30,9:10,4:5,13,16:17,21),]

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
  annotate("text", x=6.3, y=75, label= "y= 1.3577x", colour="red", size=3) +
  annotate("text", x=6.3, y=65, label= expression("R"^2*"= 0.9007 "), colour="red", size=3) +
  annotate("text", x=11.25, y=75, label= "y= 1.9951x", colour="green", size=3) +
  annotate("text", x=11.25, y=65, label= expression("R"^2*"= 0.9151  "), colour="green", size=3) +
  annotate("text", x=16.25, y=75, label= "y= 2.5863x", colour="blue", size=3) +
  annotate("text", x=16.25, y=65, label= expression("R"^2*"= 0.9006 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))
  
  title1 <- ggdraw() + draw_label("Días Normales", fontface="bold")
  
   w <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))
  
q <- data3 %>%
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10S, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=6.3, y=75, label= "y= 1.0985x", colour="red", size=2.5) +
  annotate("text", x=6.3, y=65, label= expression("R"^2*"= 0.74 "), colour="red", size=2.5) +
  annotate("text", x=12.5, y=75, label= "y= 1.5463x", colour="green", size=2.5) +
  annotate("text", x=12.5, y=65, label= expression("R"^2*"= 0.8028 "), colour="green", size=2.5) +
  annotate("text", x=17.5, y=75, label= "y= 2.1726x", colour="blue", size=2.5) +
  annotate("text", x=17.5, y=65, label= expression("R"^2*"= 0.8215 "), colour="blue", size=2.5) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=10)) +
  theme(axis.title.x=element_text(size=8)) +
  theme(axis.title.y=element_text(size=8)) +
  theme(legend.text=element_text(size=7)) 
 
A <- plot_grid(p,q,ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))
title <- ggdraw() + draw_label("Días Normales", fontface="bold")
n <- plot_grid(title, A, ncol=1, rel_heights=c(0.1, 1))



data2 <- left_join(Calibración,PM10UR, by=c("date"="date")) %>% drop_na()
data4 <- data2[-c(26:32,1,11:12,4:5,14,17:18,22),]

lmod7 <- lm(ScatRed3000~0 + PM10U, data4)
lmod8 <- lm(ScatGreen3000~0 + PM10U, data4)
lmod9 <- lm(ScatBlue3000~0 + PM10U, data4)

summary(lmod9)

r <- data4 %>%
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
  annotate("text", x=11.25, y=75, label= "y= 1.2969x", colour="red", size=3) +
  annotate("text", x=11.25, y=65, label= expression("R"^2*"=0.7486 "), colour="red", size=3) +
  annotate("text", x=13.75, y=75, label= "y= 1.8492x", colour="green", size=3) +
  annotate("text", x=13.75, y=65, label= expression("R"^2*"=0.7539 "), colour="green", size=3) +
  annotate("text", x=16.25, y=75, label= "y= 2.3676x", colour="blue", size=3) +
  annotate("text", x=16.25, y=65, label= expression("R"^2*"=0.7399 "), colour="blue", size=3) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  theme(legend.position="right") +
  labs(x=expression("PM"[10]*"(µg/m"^3*")"))

title3 <- ggdraw() + draw_label("Dias Normales", fontface="bold")
 plot_grid(title3,r,ncol=1,rel_heights=c(0.1,1))

i <- plot_grid(w,e,ncol=2,rel_widths=c(1,1))
  
s <- data4 %>%
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10S, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=8.8, y=95, label= "y= 1.1611x", colour="red", size=2.5) +
  annotate("text", x=8.8, y=82, label= expression("R"^2*"=0.4439 "), colour="red", size=2.5) +
  annotate("text", x=13, y=95, label= "y= 1.4994x", colour="green", size=2.5) +
  annotate("text", x=13, y=82, label= expression("R"^2*"=0.5822 "), colour="green", size=2.5) +
  annotate("text", x=18, y=95, label= "y= 2.0243x", colour="blue", size=2.5) +
  annotate("text", x=18, y=82, label= expression("R"^2*"=0.6327 "), colour="blue", size=2.5) +
  labs(x=expression("PM"[10]*"(µg/m"^3*")")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=10)) +
  theme(axis.title.x=element_text(size=8)) +
  theme(axis.title.y=element_text(size=8)) +
  theme(legend.text=element_text(size=7))
A <- plot_grid(r,s,ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))
title <- ggdraw() + draw_label("Días Normales", fontface="bold")
m <- plot_grid(title, A, ncol=1, rel_heights=c(0.1, 1))

g <- plot_grid(p,q,r,s, ncol=2, nrow=2, rel_widths= c(1,1.15), labels=c("a)","b)","c)","d)"))
 j <- plot_grid(title,g, ncol=1, rel_heights=c(0.1,1))

