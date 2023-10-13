library(tidyverse)
library(cowplot)
library(datarium)
library(scales)
library(ggnewscale)

p2 <- ggplot() +
  theme_bw() +
  geom_line(data=SuburbanoPolvo, aes(x=date, y=ScatTRed3000, colour="635 nm"), alpha=0.7, lwd=1) +
  geom_point(data=SuburbanoPolvo, aes(x=date, y=ScatTRed3000, fill= "635 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  scale_fill_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=SuburbanoPolvo, aes(x=date, y=ScatTGreen3000, colour="525 nm"), alpha=0.7, lwd=1) +
  geom_point(data=SuburbanoPolvo, aes(x=date, y=ScatTGreen3000, fill= "525 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  scale_fill_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=SuburbanoPolvo, aes(x=date, y=ScatTBlue3000, colour="450 nm"), alpha=0.7, lwd=1) +
  geom_point(data=SuburbanoPolvo, aes(x=date, y=ScatTBlue3000, fill= "450 nm"), pch=21, colour="black", stroke=1, size=2) +
  scale_colour_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_fill_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  scale_x_datetime("",labels=date_format("%b-%d"), breaks="day") +
  labs(y=expression("Dispersión Total Aurora 3000 (Mm"^-1*")"), title="Dispersión Total Aurora 3000 VS Día promedio") +
  theme(plot.title=element_text(hjust=0.52, size=12))

title2 <- ggdraw() + draw_label(expression("Días con intrusión de polvo (PM"[10]*"Suburbano-PM"[1]*"Urbano)", fontface="bold"))  

o <- plot_grid(title2,p2,ncol=1,rel_heights=c(0.1,1))
