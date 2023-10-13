library(tidyverse)
library(openair)
library(ggnewscale)
library(datarium)
library(scales)
library(cowplot)

 p <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración, aes(x=date, y=ScatRed3000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración, aes(x=date, y=ScatGreen3000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración, aes(x=date, y=ScatBlue3000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.0896,0.939),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.4, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=11),
    axis.text.y= element_text(size=10),
    axis.text.x=element_blank(),
    aspect.ratio=0.2
  ) +
   scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days")


q <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración, aes(x=date, y=ScatRed4000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración, aes(x=date, y=ScatGreen4000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración, aes(x=date, y=ScatBlue4000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.0896,0.945),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.4, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=11),
    axis.text.y= element_text(size=10),
    axis.text.x=element_blank(),
    aspect.ratio=0.2
  ) +
  scale_y_continuous(limits=c(0,300)) +
  scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days")

x <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración, aes(x=date, y=RH3000, fill= "RH (3000)"),pch=21, stroke=0.5, colour="black", alpha=0.7, size=1.4) +
  geom_point(data=Calibración, aes(x=date, y=RH4000, fill= "RH (4000)"),pch=21, stroke=0.5, alpha=0.7,colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("RH (3000)", "RH (4000)"), values=c("purple3","turquoise1"), guide=guide_legend(nrow=1)) +
  labs(y="RH (%)", x="") +
  theme(
    legend.position=c(0.075,0.0959),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.1, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=11),
    axis.text.y= element_text(size=10),
    axis.text.x= element_text(size=8.2),
    aspect.ratio=0.184) +
  scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days")



plot_grid(p,q,x,nrow=3,ncol=1,rel_heights=c(1,1,1), labels=c("a)","b)","c)"), label_y=c(1,1.04,1.07),label_x= c(0.15,0.15,0.15))


