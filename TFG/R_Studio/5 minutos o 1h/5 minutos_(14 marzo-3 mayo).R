library(tidyverse)
library(openair)
library(ggnewscale)
library(datarium)
library(scales)
library(cowplot)

p <- ggplot() +
  theme_bw() +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatRed3000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatGreen3000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatBlue3000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.0582,0.9),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.1, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=8)
    
  )


q <- ggplot() +
  theme_bw() +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatRed4000, fill= "635 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatGreen4000, fill= "525 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  geom_point(data=X5minutos_M_My, aes(x=date, y=ScatBlue4000, fill= "450 nm"),pch=21, stroke=0.5, alpha=0.7, colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("635 nm", "525 nm", "450 nm"), values=c("red","green","blue"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), x="") +
  theme(
    legend.position=c(0.0581,0.905),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.1, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=8)
  ) +
  scale_y_continuous(limits=c(0,750))

x <- ggplot() +
  theme_bw() +
  geom_point(data=X5minutos_M_My, aes(x=date, y=RH3000, fill= "HR (3000)"),pch=21, stroke=0.5, colour="black", alpha=0.7, size=1.4) +
  geom_point(data=X5minutos_M_My, aes(x=date, y=RH4000, fill= "HR (4000)"),pch=21, stroke=0.5, alpha=0.7,colour="black", size=1.4) +
  scale_fill_manual("", breaks=c("HR (3000)", "HR (4000)"), values=c("purple3","turquoise1"), guide=guide_legend(nrow=1)) +
  labs(y="HR (%)", x="") +
  theme(
    legend.position=c(0.049,0.908),
    legend.background=element_rect(colour="black"),
    legend.spacing.y=unit(-0.1, "cm"),
    legend.key.size=unit(0.1, "cm"),
    axis.title.y=element_text(size=8))


plot_grid(p,q,x,nrow=3,ncol=1,rel_heights=c(1,1,1), labels=c("a)","b)","c)"),
          label_y=c(1.01,1.01,1.01))





