library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)

data1 <- left_join(Calibración, PM10S_PM1, by=c("date"="date")) %>% drop_na()
data2 <- data1[-c(17:22,6:7,3:4,9,12),] %>% print()

lmod1 <- lm(ScatRed3000~0 + PM10S_1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM10S_1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM10S_1, data2)



summary(lmod3)

p <- data2 %>% 
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
  annotate("text", x=-3.75, y=56.25, label= "y= 2.1019x", colour="red", size=3) +
  annotate("text", x=-3.75, y=43.75, label= expression("R"^2*"=0.8831 "), colour="red", size=3) +
  annotate("text", x=-1.25, y=56.25, label= "y= 3.2046x", colour="green", size=3) +
  annotate("text", x=-1.25, y=43.75, label= expression("R"^2*"=0.9012  "), colour="green", size=3) +
  annotate("text", x=1.25, y=56.25, label= "y= 4.2033x", colour="blue", size=3) +
  annotate("text", x=1.25, y=43.75, label= expression("R"^2*"=0.8958 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana - Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")"))

title <- ggdraw() + draw_label("Días Normales", fontface="bold")

 i <- plot_grid(title,p,ncol=1,rel_heights=c(0.1,1))
  



q <- data2 %>% 
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
  annotate("text", x=-3.75, y=56.25, label= "y= 1.4360x", colour="red", size=3) +
  annotate("text", x=-3.75, y=43.75, label= expression("R"^2*"=0.5227 "), colour="red", size=3) +
  annotate("text", x=-1.25, y=56.25, label= "y= 2.2020x", colour="green", size=3) +
  annotate("text", x=-1.25, y=43.75, label= expression("R"^2*"=0.6522 "), colour="green", size=3) +
  annotate("text", x=1.25, y=56.25, label= "y= 3.2739x", colour="blue", size=3) +
  annotate("text", x=1.25, y=43.75, label= expression("R"^2*"=0.7211  "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*"- PM"[1]* " (Zona Suburbana - Urbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=12)) 



u <- plot_grid(p,q, ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title <- ggdraw() + draw_label("Días normales", fontface="bold")

 x <- plot_grid(title,u, ncol=1, rel_heights=c(0.1,1))
 
 
 write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\PM10S_PM1_DíasNormales.csv")

 