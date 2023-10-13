library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)


data1 <- Calibración_Marzo_Mayo %>% drop_na()

data2 <- data1 %>% mutate(date=hour(data1$date)) %>% group_by(date) %>% 
  summarise(across(everything(), list(mean)))

colnames(data2) <- gsub("_1","", colnames(data2))

data3 <- data2 %>% select(date, "635 nm"=ScatRed3000, "525 nm"=ScatGreen3000, "450 nm"= ScatBlue3000) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="Scat3000", values_to="Scat3000V")

p1 <- ggplot() +
  theme_bw() +
  geom_line(data=data3, aes(x=date, y=Scat3000V, colour=Scat3000), alpha=0.7, lwd=1) +
  geom_point(data=data3, aes(x=date, y=Scat3000V, fill=Scat3000), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*") (húmedo)"), x="") +
  theme(axis.title.y= element_text(size=10)) +
  theme(
    legend.position = c(.0004, 0.972),
    legend.justification = "left",
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(1.2, "cm"),
    legend.spacing.y = unit(-0.15, "cm"),
    legend.key.size = unit(0.2,"cm"),
    legend.text= element_text(size=12)
  )

data3 <- data2 %>% select(date, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"= fRHBlue) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="fRH", values_to="fRHV")

p2 <- ggplot() +
  theme_bw() +
  geom_line(data=data3, aes(x=date, y=fRHV, colour=fRH), alpha=0.7, lwd=1) +
  geom_point(data=data3, aes(x=date, y=fRHV, fill=fRH), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  labs(y="fRH", x="") +
  theme(axis.title.y= element_text(size=10)) +
  theme(
    legend.position = c(.0004, 0.972),
    legend.justification = "left",
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(1.2, "cm"),
    legend.spacing.y = unit(-0.15, "cm"),
    legend.key.size = unit(0.2,"cm"),
    legend.text= element_text(size=12)
  )


data3 <- data2 %>% select(date, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"= fRHBlue, "SAE"=SAE3000) %>% 
  pivot_longer(c("635 nm","525 nm", "450 nm"), names_to="fRH", values_to="fRHV")

 p3 <- ggplot() +
  theme_bw() +
  geom_line(data=data3, aes(x=date, y=fRHV, colour=fRH), alpha=0.7, lwd=1) +
  geom_point(data=data3, aes(x=date, y=fRHV, fill=fRH), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_fill_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1, order=1)) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1, order=1)) +
  ggnewscale::new_scale_colour() +
  ggnewscale::new_scale_fill() +
  geom_line(data=data3, aes(x=date, y=SAE*1.6, colour= "SAE"), alpha=0.7, lwd=1) +
  geom_point(data=data3, aes(x=date, y=SAE*1.6, fill= "SAE"), alpha=0.7, pch=21, colour="black", stroke=1) +
  scale_colour_manual("", breaks= "SAE", values=c("orange"), guide=guide_legend(order=1, nrow=1)) +
  scale_fill_manual("", breaks= "SAE", values=c("orange"), guide=guide_legend(order=1, nrow=1)) +
  scale_x_discrete("", limits=c(0,4,8,12,16,20)) +
  scale_y_continuous("fRH", sec.axis=sec_axis(trans~./1.6, "SAE(húmedo)")) +
  labs(y="fRH", x="") +
  theme(axis.title.y= element_text(size=10)) +
  theme(
    legend.position = c(.0004, 0.130),
    legend.justification = c("left","top"),
    legend.box.just = "left",
    legend.margin = margin(6, 6, 6, 6),
    legend.background= element_rect(colour="black"),
    legend.key.width= unit(0.4, "cm"),
    legend.spacing.y = unit(-0.00001, "cm"),
    legend.key.size = unit(0.002,"cm"),
    legend.text= element_text(size=12),
    axis.title.y.right= element_text(hjust=0.5, vjust=2)
  )

 
 plot_grid(p1,p2,p3,ncol=3,nrow=1, rel_widths=c(1,1,1), labels=c("a)","b)","c)"))
