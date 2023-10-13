library(tidyverse)
library(openair)
library(ggnewscale)
library(datarium)
library(scales)
library(cowplot)

p <- ggplot() +
  theme_bw() +
  geom_point(data=Points, aes(x=date, y=ScatRed3000, fill= "635 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Points, aes(x=date, y=ScatGreen3000, fill= "525 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Points, aes(x=date, y=ScatBlue3000, fill= "450 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x="")


q <- ggplot() +
  theme_bw() +
  geom_point(data=Points, aes(x=date, y=ScatRed4000, fill= "635 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Points, aes(x=date, y=ScatGreen4000, fill= "525 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Points, aes(x=date, y=ScatBlue4000, fill= "450 nm"),pch=21, stroke=1, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), x="")

title1 <- ggdraw() + draw_label("Período 7 enero - 22 febrero", fontface="bold")

plot_grid(title1,p,q,nrow=3,ncol=1,rel_heights=c(0.1,1,1), labels=c("","a)","b)"))


