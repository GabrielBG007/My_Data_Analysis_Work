library(tidyverse)
library(cowplot)
library(datarium)
library(scales)
library(ggnewscale)

p1 <- ggplot() +
  theme_bw() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTRed3000, colour="635 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTRed3000, fill= "635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTGreen3000, colour="525 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTGreen3000, fill= "525 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTBlue3000, colour="450 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTBlue3000, fill= "450 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_x_datetime("",labels=date_format("%b-%d"), breaks="5 day") +
  labs(y=expression("Dispersión Total Aurora 3000 (Mm"^-1*")"), title="Dispersión Total Aurora 3000 VS Día promedio") +
  theme(plot.title=element_text(hjust=0.52, size=12))

title1 <- ggdraw() + draw_label(expression("Días Normales (PM"[10]*"Urbano-PM"[1]*"Urbano)", fontface="bold"))  

 i <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))


    q <- ggplot() +
  theme_bw() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTRed4000, colour="635 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTRed4000, fill= "635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTGreen4000, colour="525 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTGreen4000, fill= "525 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=UrbanoNormal, aes(x=date, y=ScatTBlue4000, colour="450 nm"), alpha=0.7, lwd=1) +
  geom_point(data=UrbanoNormal, aes(x=date, y=ScatTBlue4000, fill= "450 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_x_datetime("",labels=date_format("%b-%d"), breaks="5 day") +
  labs(y=expression("Dispersión Total Aurora 4000 (Mm"^-1*")"), title="Dispersión Total Aurora 4000 VS Día promedio") +
  theme(plot.title=element_text(hjust=0.5))

    title1 <- ggdraw() + draw_label("Días Normales (Urbano)", fontface="bold")  
    
    s <- plot_grid(p,q,ncol=2,nrow=1, rel_widths=c(1,1), labels=c("a)","b)"))

    l<- plot_grid(title1,s,ncol=1,rel_heights=c(0.1,1))  
    