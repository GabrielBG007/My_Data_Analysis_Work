library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM1UR, by=c("date"="date")) %>% drop_na()

data2 <- data1[(23:29),]

lmod1 <- lm(ScatRed3000~0 + PM1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM1, data2)


summary(lmod3)

p <- data2 %>% 
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
  annotate("text", x=6.85, y=116, label= "y= 4.9208x", colour="red", size=3) +
  annotate("text", x=6.85, y=105, label= expression("R"^2*"=0.9851 "), colour="red", size=3) +
  annotate("text", x=8.3, y=116, label= "y= 6.1307x", colour="green", size=3) +
  annotate("text", x=8.3, y=105, label= expression("R"^2*"=0.9871  "), colour="green", size=3) +
  annotate("text", x=9.75, y=116, label= "y= 7.6295x", colour="blue", size=3) +
  annotate("text", x=9.75, y=105, label= expression("R"^2*"=0.9835 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[1]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[1]*"(µg/m"^3*")"))

title2 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

 i <- plot_grid(title2,p,ncol=1,rel_heights=c(0.1,1))




q <- data2 %>% 
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
  annotate("text", x=6.85, y=119, label= "y= 4.4019x", colour="red", size=3) +
  annotate("text", x=6.85, y=105, label= expression("R"^2*"=0.9824 "), colour="red", size=3) +
  annotate("text", x=8.3, y=119, label= "y= 6.0820x", colour="green", size=3) +
  annotate("text", x=8.3, y=105, label= expression("R"^2*"=0.9759 "), colour="green", size=3) +
  annotate("text", x=9.75, y=119, label= "y= 7.3097x", colour="blue", size=3) +
  annotate("text", x=9.75, y=105, label= expression("R"^2*"=0.9711  "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x=expression("PM"[1]*"(µg/m"^3*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[1]*" (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=12)) 



k <- plot_grid(p,q, ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

title2 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold")

y <- plot_grid(title2,k, ncol=1, rel_heights=c(0.1,1))

plot_grid(w,y,ncol=2,rel_widths=c(1,1))


write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\PM1_DíasConIntrusiónDePolvo.csv", row.names = FALSE )

