library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)


data1 <- Horas %>% select(date,RH3000, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"=fRHBlue) %>% 
  pivot_longer(c("635 nm","525 nm","450 nm"), names_to="fRH", values_to="fRHV")

p1 <- ggplot() +
  theme_bw() +
  geom_line(data=data1, aes(x=RH3000, y=fRHV, colour=fRH), alpha=0.7, lwd=1) +
  geom_point(data=data1, aes(x=RH3000, y=fRHV, fill=fRH), pch=21, alpha=0.7, colour="black", stroke=1) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(order=1, nrow=1)) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(order=1, nrow=1)) +
  labs(y= "fRH(%)", x="RH(%)") +
  theme(
    legend.background= element_rect(colour="black"),
    legend.position= c(1,0.92),
    legend.justification= "right",
    legend.box.just = "right",
    legend.margin=margin(6,6,6,6),
    legend.key.size= unit(0.7,"cm"),
    legend.key.width= unit(2,"cm"),
    legend.spacing.y= unit(-0.15,"cm"),
    aspect.ratio=0.21
  )


p2 <- ggplot() +
  theme_bw() +
  geom_smooth(data=data1, aes(x=RH3000, y=fRHV, colour=fRH), se=FALSE, method= "lm", formula= y~0+x, lty=5) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(order=1, nrow=1)) +
  labs(y= "fRH(%)", x="RH(%)") +
  theme(
    legend.background= element_rect(colour="black"),
    legend.position= c(0.2622,0.921),
    legend.justification= "right",
    legend.box.just = "right",
    legend.margin=margin(6,6,6,6),
    legend.key.size= unit(0.7,"cm"),
    legend.key.width= unit(2,"cm"),
    legend.spacing.y= unit(-0.15,"cm"),
    aspect.ratio=0.21
  )

plot_grid(p1,p2,ncol=1,nrow=2, rel_heights=c(1,1), labels=c("a)","b)"))



geom_smo






 