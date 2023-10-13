library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)

data1 <- left_join(Calibración, PM10S_PM1, by=c("date"="date")) %>% drop_na()
data2 <- data1[(17:22),] %>% print()

lmod1 <- lm(ScatRed3000~0 + PM10S_1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1, data2)


summary(lmod3)

p1 <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10S_1, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S_1, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10S_1, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10S_1, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=17.5, y=136, label= "y= 2.0777x", colour="red", size=3) +
  annotate("text", x=17.5, y=126, label= expression("R"^2*"=0.9523 "), colour="red", size=3) +
  annotate("text", x=22.5, y=136, label= "y= 2.5246x", colour="green", size=3) +
  annotate("text", x=22.5, y=126, label= expression("R"^2*"=0.9212  "), colour="green", size=3) +
  annotate("text", x=27.5, y=136, label= "y= 3.087x", colour="blue", size=3) +
  annotate("text", x=27.5, y=126, label= expression("R"^2*"=0.8939 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana - Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")"))

title1 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

 o <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))



q1 <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10_1, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10_1, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10_1, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10_1, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10_1, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10_1, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=17.75, y=142, label= "y= 1.8287x", colour="red", size=3) +
  annotate("text", x=17.75, y=132, label= expression("R"^2*"=0.9334 "), colour="red", size=3) +
  annotate("text", x=22.5, y=142, label= "y= 2.5233x", colour="green", size=3) +
  annotate("text", x=22.5, y=132, label= expression("R"^2*"=0.9297 "), colour="green", size=3) +
  annotate("text", x=27.5, y=142, label= "y= 2.9223x", colour="blue", size=3) +
  annotate("text", x=27.5, y=132, label= expression("R"^2*"=0.8786  "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana - Urbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=12)) 



u <- plot_grid(p1,q1, ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

y <- plot_grid(title,u, ncol=1, rel_heights=c(0.1,1))

plot_grid(x,y,ncol=2,rel_widths=c(1,1))

write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\PM10S_PM1_DíasConIntrusiónDePolvo.csv")
