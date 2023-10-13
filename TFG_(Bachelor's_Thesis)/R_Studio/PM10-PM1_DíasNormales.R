library(tidyverse)
library(cowplot)
library(ggnewscale)

data1 <- left_join(Calibración,PM10U_PM1, by=c("date"="date")) %>% drop_na()

data2 <- data1[-c(21:27,1,10:11,4:5,13,16),]

lmod1 <- lm(ScatRed3000~0 + PM10U_1, data2)
lmod2 <- lm(ScatGreen3000~0 + PM10U_1, data2)
lmod3 <- lm(ScatBlue3000~0 + PM10U_1, data2)


summary(lmod3)

  p <- data2 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM10U_1, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U_1, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM10U_1, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM10U_1, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=3, y=75, label= "y= 1.9908x", colour="red", size=3) +
  annotate("text", x=3, y=65, label= expression("R"^2*"=0.6445 "), colour="red", size=3) +
  annotate("text", x=5, y=75, label= "y= 2.9619x", colour="green", size=3) +
  annotate("text", x=5, y=65, label= expression("R"^2*"=0.6682  "), colour="green", size=3) +
  annotate("text", x=7, y=75, label= "y= 3.842x", colour="blue", size=3) +
  annotate("text", x=7, y=65, label= expression("R"^2*"=0.6657 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[10]*"- PM"[1]* " (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
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
  annotate("text", x=3, y=95, label= "y= 1.6900x", colour="red", size=3) +
  annotate("text", x=3, y=82, label= expression("R"^2*"=0.3008 "), colour="red", size=3) +
  annotate("text", x=5, y=95, label= "y= 2.2852x", colour="green", size=3) +
  annotate("text", x=5, y=82, label= expression("R"^2*"=0.4632 "), colour="green", size=3) +
  annotate("text", x=7, y=95, label= "y= 3.2135x", colour="blue", size=3) +
  annotate("text", x=7, y=82, label= expression("R"^2*"=0.5374  "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"))  +
  labs(x=expression("PM"[10]*"- PM"[1]*"(µg/m"^3*")")) +
  labs(title=expression("Dispersión Aurora 4000 VS PM"[10]*"- PM"[1]* " (Zona Urbana)")) +
  theme(plot.title= element_text(hjust=0.5,size=12)) 



 u <- plot_grid(p,q, ncol=1, nrow=2, rel_widths = c(1,1), labels=c("a)","b)"))

 title <- ggdraw() + draw_label("Días normales", fontface="bold")

 t <- plot_grid(title,u, ncol=1, rel_heights=c(0.1,1))

 write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\PM10_PM1_DíasNormales.csv", row.names = FALSE )

 