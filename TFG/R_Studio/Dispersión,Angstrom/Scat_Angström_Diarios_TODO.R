library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[-c(8191:10137,1:574,3188:3468,1422:1965,3816:4453,4927:5855,6445,6933,3133:3176,2855:2893),]

data4 <- data3 %>% mutate(hour=hour(data3$date))

data5 <- data4 %>% group_by(hour) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000),
                                                "Angstrom3000"= mean(Angstrom3000)) %>% print()



ggp1 <- ggplot() + 
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
  geom_smooth(data=data5, aes(x=hour, y=ScatBlue3000, colour="450 nm"), lwd=1, alpha=0.7, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y=ScatBlue3000, fill="450 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data5, aes(x= hour, y=Angstrom3000*90, colour="SAE"), alpha=0.7, lty=4, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y= Angstrom3000*90, fill= "SAE"), pch=23, stroke=1, size=2, colour="black") +
  scale_colour_manual("", breaks="SAE", values= "orange", guide= guide_legend(order=4)) +
  scale_fill_manual("", breaks="SAE", values= "orange", guide=guide_legend(order=4)) +
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 3000 (Mm"^-1*")")) +
  theme(plot.title= element_text(hjust=0.465, vjust=4, size=18)) +
  scale_x_continuous("", breaks=c(0,4,8,12,16,20)) +
  scale_y_continuous(name=expression("Dispersión Aurora 3000 (Mm"^-1*")"), sec.axis = sec_axis(trans~./90, name="SAE (3000)", breaks= seq(0,2.5,0.5)), limits=c(0,225), expand=c(0,0)) +
  theme(axis.title.y=element_text(size=16),
        axis.title.y.right= element_blank(),
        axis.text.y=element_text(size=14),
        axis.text.y.right=element_blank(),
        legend.text=element_text(size=16),
        axis.text.x=element_text(size=14),
        legend.position="none",
        legend.key.size= unit(2, "cm"),
        legend.key.height= unit(0.3, "cm"))



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



ggp2 <- ggplot() + 
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
  geom_smooth(data=data5, aes(x= hour, y=Angstrom3000*90, colour="SAE"), alpha=0.7, lty=5, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y= Angstrom3000*90, fill= "SAE"), pch=23, stroke=1, size=2, colour="black") +
  scale_colour_manual("", breaks="SAE", values= "orange", guide= guide_legend(order=4)) +
  scale_fill_manual("", breaks="SAE", values= "orange", guide=guide_legend(order=4)) +
  labs(x="Horas diarias") +
  theme(plot.title= element_text(hjust=0.465, size=18)) +
  scale_x_continuous("", breaks=c(0,4,8,12,16,20)) +
  scale_y_continuous(sec.axis = sec_axis(trans~./90, name="SAE (3000)", breaks= seq(0,2.5,0.5))) +
  theme(axis.title.y=element_text(size=16),
        axis.title.y.right=element_blank(),
        axis.text.y=element_text(size=14),
        axis.text.y.right=element_blank(),
        axis.text.x=element_text(size=14),
        legend.position="top",
        legend.text= element_text(size=16))


ggp2x <- ggplot() + 
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
  geom_smooth(data=data5, aes(x= hour, y=Angstrom3000*90, colour="SAE"), alpha=0.7, lty=4, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y= Angstrom3000*90, fill= "SAE"), pch=23, stroke=1, size=2, colour="black") +
  scale_colour_manual("", breaks="SAE", values= "orange", guide= guide_legend(order=4)) +
  scale_fill_manual("", breaks="SAE", values= "orange", guide=guide_legend(order=4)) +
  labs(x="Horas diarias") +
  theme(plot.title= element_text(hjust=0.465, size=18)) +
  scale_x_continuous("", breaks=c(0,4,8,12,16,20)) +
  scale_y_continuous(name="",sec.axis = sec_axis(trans~./90, name="SAE (3000)", breaks= seq(0,2.5,0.5)), limits=c(0,225), expand=c(0,0)) +
  theme(axis.title.y=element_text(size=16),
        axis.title.y.right=element_blank(),
        axis.text.y=element_blank(),
        axis.text.y.right=element_blank(),
        axis.text.x=element_text(size=14),
        legend.position="none",
        legend.text= element_text(size=16))



data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[c(1422:1804,4130:4238,5257:5581),] %>% print()

data4 <- data3 %>% mutate(hour=hour(data3$date))

data5 <- data4 %>% group_by(hour) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000),
                                                "Angstrom3000"= mean(Angstrom3000)) %>% print() 



ggp3 <- ggplot() + 
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
  geom_smooth(data=data5, aes(x=hour, y=ScatBlue3000, colour="450 nm"), lwd=1, alpha=0.7, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y=ScatBlue3000, fill="450 nm"),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data5, aes(x= hour, y=Angstrom3000*90, colour="SAE"), alpha=0.7, lty=4, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data5, aes(x=hour, y= Angstrom3000*90, fill= "SAE"), pch=23, stroke=1, size=2, colour="black") +
  scale_colour_manual("", breaks="SAE", values= "orange", guide= guide_legend(order=4)) +
  scale_fill_manual("", breaks="SAE", values= "orange", guide=guide_legend(order=4)) +
  labs(x="Horas diarias") +
  theme(plot.title= element_text(hjust=0.465, size=18)) +
  scale_x_continuous("", breaks=c(0,4,8,12,16,20)) +
  scale_y_continuous(name="",limits=c(0,225), sec.axis = sec_axis(trans~./90, name="SAE (3000)", breaks= seq(0,2.5,0.5)), expand=c(0,0)) +
  theme(axis.title.y=element_text(size=16),
        axis.title.y.right=element_text(size=16, vjust=1.8),
        axis.text.y=element_blank(),
        axis.text.y.right=element_text(size=14),
        axis.text.x=element_text(size=14),
        legend.position="none") 





extract_legend <- function(my_ggp) {
  step1 <- ggplot_gtable(ggplot_build(my_ggp))
  step2 <- which(sapply(step1$grobs, function(x) x$name) == "guide-box")
  step3 <- step1$grobs[[step2]]
  return(step3)
}

shared_legend <- extract_legend(ggp2)



W <- plot_grid(ggp1,ggp2x,ggp3, ncol=3, rel_widths=c(1,1,1), labels=c("a) Días normales","b) Días con intrusión de polvo","c) Días con gran estabilidad atmosférica"), label_y=c(0.98,0.98,0.98), label_x=c(0.07,-0.12,-0.21))

plot_grid(shared_legend, W, ncol=1, nrow=2, rel_heights=c(0.1,1))




