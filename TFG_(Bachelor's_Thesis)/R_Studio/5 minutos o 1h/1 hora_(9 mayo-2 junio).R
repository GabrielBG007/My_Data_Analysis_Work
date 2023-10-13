library(tidyverse)
library(openair)
library(ggnewscale)
library(datarium)
library(scales)
library(cowplot)

p <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración_1, aes(x=date, y=ScatRed3000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración_1, aes(x=date, y=ScatGreen3000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración_1, aes(x=date, y=ScatBlue3000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.065,0.063),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.43, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=8),
    axis.text.x= element_blank()
    
  ) +
  scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days") +
  scale_y_continuous(limits= c(0,120))


q <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración_1, aes(x=date, y=ScatRed4000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración_1, aes(x=date, y=ScatGreen4000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=Calibración_1, aes(x=date, y=ScatBlue4000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.065,0.064),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.43, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=8),
    axis.text.x=element_blank()
    
  ) +
  scale_y_continuous(limits=c(0,120)) +
  scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days")


x <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración_1, aes(x=date, y=RH3000, fill= "RH (3000)"),pch=21, stroke=0.5, colour="black", alpha=0.7, size=1.4) +
  geom_point(data=Calibración_1, aes(x=date, y=RH4000, fill= "RH (4000)"),pch=21, stroke=0.5, alpha=0.7,colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("RH (3000)", "RH (4000)"), values=c("purple3","turquoise1"), guide=guide_legend(nrow=1)) +
  labs(y="RH (%)", x="") +
  theme(
    legend.position=c(0.056,0.065),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.48, "cm"),
    legend.key.size=unit(0.2, "cm"),
    axis.title.y=element_text(size=8)) +
  scale_x_datetime("", labels=date_format("%b %d"), date_breaks="2 days")




plot_grid(p,q,x,nrow=3,ncol=1,rel_heights=c(1,1,1), labels=c("a)","b)","c)"),
          label_y=c(1.02,1.07,1.07))
