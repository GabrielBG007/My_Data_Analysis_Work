library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)
library(ggalt)


data1 <- Calibración[-c(4040:4436,5552:5744),]

data2 <- data1 %>% mutate(date=hour(data1$date)) %>% group_by(date) %>% 
  summarise(across(everything(), list(mean)))

colnames(data2) <- gsub("_1","", colnames(data2))

data3 <- data2 %>% select(date, "635 nm"=ScatRed4000, "525 nm"=ScatGreen4000, "450 nm"= ScatBlue4000) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="Scat3000", values_to="Scat3000V")

p1 <- ggplot() +
  theme_bw() +
  geom_smooth(data=data3, aes(x=date, y=Scat3000V, colour=Scat3000), alpha=0.7, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data3, aes(x=date, y=Scat3000V, fill=Scat3000), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*") (seco)"), x="") +
  theme(axis.title.y= element_text(size=16),
        axis.text.y=element_text(size=14),
        axis.text.x=element_text(size=14)) +
  theme(
    legend.position = c(.0004, 0.956),
    legend.justification = "left",
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(1.2, "cm"),
    legend.spacing.y = unit(-0.4, "cm"),
    legend.key.size = unit(0.2,"cm"),
    legend.text= element_text(size=12)
  )

data3 <- data2 %>% select(date, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"= fRHBlue,RH3000) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="fRH", values_to="fRHV")

p2 <- ggplot() +
  theme_bw() +
  geom_smooth(data=data3, aes(x=date, y=fRHV, colour=fRH), alpha=0.7, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data3, aes(x=date, y=fRHV, fill=fRH), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data3, aes(x=date, y=RH3000/36, colour= "RH"), alpha=0.7, lwd=1, se=FALSE, span=0.2) +
  geom_point(data=data3, aes(x=date, y=RH3000/36, fill= "RH"), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_colour_manual("", breaks= "RH", values=c("purple3"), guide=guide_legend(order=1, ncol=1)) +
  scale_fill_manual("", breaks= "RH", values=c("purple3"), guide=guide_legend(order=1, ncol=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  scale_y_continuous("fRH", sec.axis=sec_axis(trans~.*36, "RH (3000) (%)"), limits=c(1.152,1.417)) +
  labs(y="fRH", x="") +
  theme(axis.title.y= element_text(size=16),
        axis.title.y.right= element_text(size=16),
        axis.text.y.right=element_text(size=14),
        axis.text.y=element_text(size=14),
        axis.text.x=element_text(size=14)) +
  theme(
    legend.position = c(0.782, 0.173),
    legend.justification = c("left","top"),
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(0.4, "cm"),
    legend.spacing.y = unit(-0.012, "cm"),
    legend.key.size = unit(0.002,"cm"),
    legend.text= element_text(size=12),
    axis.title.y.right= element_text(hjust=0.5, vjust=2)
  ) 


data3 <- data2 %>% select(date, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"= fRHBlue, "SAE"=SAE4000) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="fRH", values_to="fRHV")

p3 <- ggplot() +
  theme_bw() +
  geom_smooth(data=data3, aes(x=date, y=fRHV, colour=fRH), alpha=0.7, lwd=1, span=0.2, se=FALSE) +
  geom_point(data=data3, aes(x=date, y=fRHV, fill=fRH), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1, order=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(ncol=1, order=1)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_smooth(data=data3, aes(x=date, y=SAE*1.106, colour= "SAE"), alpha=0.7, lwd=1, se=FALSE, span=0.14) +
  geom_point(data=data3, aes(x=date, y=SAE*1.106, fill= "SAE"), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_colour_manual("", breaks= "SAE", values=c("orange"), guide=guide_legend(order=1, ncol=1)) +
  scale_fill_manual("", breaks= "SAE", values=c("orange"), guide=guide_legend(order=1, ncol=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  scale_y_continuous("fRH", sec.axis=sec_axis(trans~./1.06, "SAE(seco)"), limits=c(1.152,1.417)) +
  labs(y="fRH", x="") +
  theme(axis.title.y= element_text(size=16),
        axis.title.y.right= element_text(size=16),
        axis.text.y.right=element_text(size=14),
        axis.text.y=element_text(size=14),
        axis.text.x=element_text(size=14)) +
  theme(
    legend.position = c(0.774, 0.173),
    legend.justification = c("left","top"),
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(0.4, "cm"),
    legend.spacing.y = unit(-0.01, "cm"),
    legend.key.size = unit(0.002,"cm"),
    legend.text= element_text(size=12),
    axis.title.y.right= element_text(hjust=0.5, vjust=2)
  ) 




plot_grid(p1,p2,p3,ncol=3,nrow=1, rel_widths=c(1,1,1), labels=c("a)","b)","c)"))






