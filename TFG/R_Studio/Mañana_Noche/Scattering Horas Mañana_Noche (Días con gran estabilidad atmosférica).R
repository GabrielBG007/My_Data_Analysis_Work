library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[c(1422:1661,4131:4239,5258:5582),]

data4 <- data3 %>% mutate(hour=hour(data3$date))

data5 <- data4 %>% filter(hour %in% c(7,8,9,10,11,12,13,14,15,16,17))

data6 <- data5 %>% group_by(hour) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000)) %>% print(n=24)



p5 <- ggplot() + 
  theme_bw() +
  geom_line(data=data6, aes(x=hour, y=ScatRed3000, colour="635 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatRed3000, fill="635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data6, aes(x=hour, y=ScatGreen3000, colour="525 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatGreen3000, fill="525 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data6, aes(x=hour, y=ScatBlue3000, colour="450 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatBlue3000, fill="450 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 3000 (Mm"^-1*")"), title="Dispersión media Aurora 3000 VS Horas medias diurnas") +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  scale_x_continuous("", breaks=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)) +
  theme(axis.title.y=element_text(size=10))



title5 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica (Mañana)", fontface="bold")

m3 <- plot_grid(title5,p5,ncol=1,rel_heights=c(0.1,1))



q5 <- ggplot() + 
  theme_bw() +
  geom_line(data=data6, aes(x=hour, y=ScatRed4000, colour="635 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatRed4000, fill="635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data6, aes(x=hour, y=ScatGreen4000, colour="525 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatGreen4000, fill="525 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data6, aes(x=hour, y=ScatBlue4000, colour="450 nm"), lwd=1, alpha=0.7) +
  geom_point(data=data6, aes(x=hour, y=ScatBlue4000, fill="450 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 4000 (Mm"^-1*")"), title="Dispersión media Aurora 4000 VS Horas medias diurnas") +
  theme(plot.title= element_text(hjust=0.5, size=8)) +
  scale_x_continuous("", breaks=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)) +
  theme(axis.title.y=element_text(size=8))

title5 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica (Mañana)", fontface="bold")

s5 <- plot_grid(p5,q5, ncol=2, nrow=1, rel_widths=c(1,1))

 t5 <- plot_grid(title5,s5, ncol=1, rel_heights=c(0.1,1)) 





#NOCTURNAS 


data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[c(1422:1661,4131:4239,5258:5582),]

data4 <- data3 %>% mutate(hour=hour(data3$date))

data5 <- data4 %>% filter(hour %in% c(18,19,20,21,22,23,0,1,2,3,4,5,6))

data6 <- data5 %>% group_by(hour) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000)) %>% print(n=24)
data7 <-  data6[c(8:13,1:7),] %>% mutate(hour=as.factor(data6$hour))


p6 <- ggplot() + 
  theme_bw() +
  geom_line(data=data7, aes(x=hour, y=ScatRed3000, colour="635 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatRed3000, fill="635 nm", group=TRUE), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data7, aes(x=hour, y=ScatGreen3000, colour="525 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatGreen3000, fill="525 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data7, aes(x=hour, y=ScatBlue3000, colour="450 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatBlue3000, fill="450 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 3000 (Mm"^-1*")"), title="Dispersión media Aurora 3000 VS Horas medias nocturnas") +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  scale_x_discrete("",labels=c(18,19,20,21,22,23,0,1,2,3,4,5,6)) +
  theme(axis.title.y=element_text(size=10))


title6 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica (Noche)", fontface="bold")

n3 <- plot_grid(title6,p6,ncol=1,rel_heights=c(0.1,1))

l3 <- plot_grid(m3,n3,ncol=2,nrow=1,rel_widths=c(1,1))


plot_grid(l1,l2,l3,ncol=1,nrow=3,rel_widths=c(1,1))



q6 <- ggplot() + 
  theme_bw() +
  geom_line(data=data7, aes(x=hour, y=ScatRed4000, colour="635 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatRed4000, fill="635 nm", group=TRUE), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data7, aes(x=hour, y=ScatGreen4000, colour="525 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatGreen4000, fill="525 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data7, aes(x=hour, y=ScatBlue4000, colour="450 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data7, aes(x=hour, y=ScatBlue4000, fill="450 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 4000 (Mm"^-1*")"), title="Dispersión media Aurora 4000 VS Horas medias nocturnas") +
  theme(plot.title= element_text(hjust=0.5, size=8)) +
  scale_x_discrete("", labels=c(18,19,20,21,22,23,0,1,2,3,4,5,6)) +
  theme(axis.title.y=element_text(size=8))

title6 <- ggdraw() + draw_label("Días con gran estabilidad atmosférica (Noche)", fontface="bold")

s6 <- plot_grid(p6,q6, ncol=2, nrow=1, rel_widths=c(1,1))

 t6 <- plot_grid(title6,s6, ncol=1, rel_heights=c(0.1,1)) 

 x3 <- plot_grid(t5,t6,ncol=2,rel_widths=c(1,1))

 plot_grid(x1,x2,x3, ncol=1, nrow=3, rel_widths=c(1,1)) 
 