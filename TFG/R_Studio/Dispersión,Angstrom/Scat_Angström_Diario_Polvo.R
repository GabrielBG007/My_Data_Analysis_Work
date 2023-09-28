library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[9864:10137,]

data4 <- data3 %>% mutate(hour=hour(data3$date))

data5 <- data4 %>% group_by(hour) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000),
                                                "Angstrom3000" = mean(Angstrom3000)) %>% print() 



p2 <- ggplot() + 
  theme_bw() +
  geom_smooth(data=data5, aes(x=hour, y=ScatRed3000, colour="635 nm"), lwd=1, alpha=0.7, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y=ScatRed3000, fill="635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data5, aes(x=hour, y=ScatGreen3000, colour="525 nm"), lwd=1, alpha=0.7, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y=ScatGreen3000, fill="525 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data5, aes(x=hour, y=ScatBlue3000, colour="450 nm"), lwd=1, alpha=0.7,se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y=ScatBlue3000, fill="450 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data5, aes(x= hour, y=Angstrom3000*112.5, colour="SAE"), alpha=0.7, lty=5, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y= Angstrom3000*112.5, fill= "SAE"), pch=23, stroke=1, size=2, colour="black") +
  scale_colour_manual("", breaks="SAE", values= "orange", guide= guide_legend(order=4)) +
  scale_fill_manual("", breaks="SAE", values= "orange", guide=guide_legend(order=4)) +
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 3000 (Mm"^-1*")"), title="Dispersión media diaria Aurora 3000 y SAE (3000) VS Horas") +
  theme(plot.title= element_text(hjust=0.465, size=18)) +
  scale_x_continuous("", breaks=c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)) +
  scale_y_continuous(name=expression("Dispersión media Aurora 3000 (Mm"^-1*")"), sec.axis = sec_axis(trans~./112.5, name="SAE (3000)", breaks= seq(0,2,0.25))) +
  theme(axis.title.y=element_text(size=16),
        axis.title.y.right=element_text(size=16, vjust=1.8),
        axis.text.y=element_text(size=14),
        axis.text.y.right=element_text(size=14),
        axis.text.x=element_blank(),
        legend.position="none")


title2 <- ggdraw() + draw_label("Días con intrusión de polvo", fontface="bold", size=18)

 plot_grid(title2,p2,ncol=1,rel_heights=c(0.1,1))
 