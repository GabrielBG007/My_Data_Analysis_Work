library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM1UR, by=c("date"="date")) %>% drop_na()

data2 <- data1[-c(23:29,1,12:13,5:6,15,18),]

lmod1 <- lm(ScatRed3000~0 + PM1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM1, data2)


summary(lmod3)

p1 <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM1, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=6.3, y=78, label= "y= 2.0915x", colour="red", size=3) +
  annotate("text", x=6.3, y=73, label= expression("R"^2*"=0.6111 "), colour="red", size=3) +
  annotate("text", x=8.8, y=78, label= "y= 2.8920x", colour="green", size=3) +
  annotate("text", x=8.8, y=73, label= expression("R"^2*"=0.5621  "), colour="green", size=3) +
  annotate("text", x=11.3, y=78, label= "y= 3.646x", colour="blue", size=3) +
  annotate("text", x=11.3, y=73, label= expression("R"^2*"=0.5309 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[1]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[1]*"(µg/m"^3*")"))

title1 <- ggdraw() + draw_label("Días Normales", fontface="bold")

 u <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))
  
  
  

q1 <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM1, y=ScatRed4000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatRed4000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatGreen4000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatGreen4000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatBlue4000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatBlue4000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=6.3, y=78, label= "y= 1.8245x", colour="red", size=3) +
  annotate("text", x=6.3, y=73, label= expression("R"^2*"=0.3235 "), colour="red", size=3) +
  annotate("text", x=8.8, y=78, label= "y= 2.3054x", colour="green", size=3) +
  annotate("text", x=8.8, y=73, label= expression("R"^2*"=0.4185 "), colour="green", size=3) +
  annotate("text", x=11.3, y=78, label= "y= 3.0668x", colour="blue", size=3) +
  annotate("text", x=11.3, y=73, label= expression("R"^2*"=0.4307  "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x=expression("PM"[1]*"(µg/m"^3*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[1]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=12)) 
 


ñ <- plot_grid(p1,q1, ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title1 <- ggdraw() + draw_label("Días normales", fontface="bold")

  w <- plot_grid(title1,ñ, ncol=1, rel_heights=c(0.1,1))

  
  write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\PM1_DíasNormales.csv", row.names = FALSE )
