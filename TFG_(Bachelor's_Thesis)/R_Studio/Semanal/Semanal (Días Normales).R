library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración 
data2 <- data1 %>% na.omit()

data3 <- data2[-c(8191:10137,1:322,3188:3336,1422:1661,4131:4239,5258:5582,6445,6933),]

data4 <- data3 %>% mutate(weekday=as.character(wday(data3$date, label=TRUE, abbr=FALSE, week_start=1)))

data5 <- data4 %>% group_by(weekday) %>% summarise("ScatRed3000" = mean(ScatRed3000),
                                                "ScatGreen3000" = mean(ScatGreen3000),
                                                "ScatBlue3000" = mean(ScatBlue3000),
                                                "ScatRed4000" = mean(ScatRed4000),
                                                "ScatGreen4000" = mean(ScatGreen4000),
                                                "ScatBlue4000" = mean(ScatBlue4000)) %>% print(n=24)



p1 <- ggplot() + 
  theme_bw() +
  geom_line(data=data5, aes(x=weekday, y=ScatRed3000, colour="635 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatRed3000, fill="635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data5, aes(x=weekday, y=ScatGreen3000, colour="525 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatGreen3000, fill="525 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data5, aes(x=weekday, y=ScatBlue3000, colour="450 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatBlue3000, fill="450 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 3000 (Mm"^-1*")"), title="Dispersión media Aurora 3000 VS Días de la semana") +
  theme(plot.title= element_text(hjust=0.5, size=12, vjust=4)) +
  scale_x_discrete("", limits=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),
                   labels=c("Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo")) +
  theme(axis.title.y=element_text(size=10),
        axis.text.x=element_blank(),
        legend.position="top",
        legend.key.size= unit(2, "cm"),
        legend.key.height= unit(0.3, "cm")) +
  scale_y_continuous(limits=c(0,125))

title1 <- ggdraw() + draw_label("Días Normales", fontface="bold")

     plot_grid(title1,p1, ncol=1,rel_heights=c(0.1,1))



q1 <- ggplot() + 
  theme_bw() +
  geom_line(data=data5, aes(x=weekday, y=ScatRed4000, colour="635 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatRed4000, fill="635 nm", group=TRUE), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks= "635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data5, aes(x=weekday, y=ScatGreen4000, colour="525 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatGreen4000, fill="525 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks= "525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data5, aes(x=weekday, y=ScatBlue4000, colour="450 nm", group=TRUE), lwd=1, alpha=0.7) +
  geom_point(data=data5, aes(x=weekday, y=ScatBlue4000, fill="450 nm", group=TRUE),pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks= "450 nm", values= "blue", guide=guide_legend(order=1)) + 
  labs(x="Horas diarias", y=expression("Dispersión media Aurora 4000 (Mm"^-1*")"), title="Dispersión media Aurora 4000 VS Días de la semana") +
  theme(plot.title= element_text(hjust=0.5)) +
  scale_x_discrete("", limits=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),
                   labels=c("Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo")) +
  theme(axis.title.y=element_text(size=8))

title1 <- ggdraw() + draw_label("Días Normales", fontface="bold")

s1 <- plot_grid(p1,q1, ncol=2, nrow=1, rel_widths=c(1,1))

 t1 <- plot_grid(title1,s1, ncol=1, rel_heights=c(0.1,1))
 