library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data0 <- Calibración_Marzo_Mayo %>% select(date,"635 nm"=ScatRed3000, "525 nm"=ScatGreen3000, "450 nm"=ScatBlue3000)

data1 <- data0 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to="Scat3000", values_to="Scat3000V")

  p1 <- ggplot() +
  theme_bw() +
  geom_line(data=data1, aes(x=date, y=as.numeric(Scat3000V), colour=Scat3000), lwd=1, alpha=0.7) +
  scale_colour_manual("",values=c("blue", "green","red"), guide=guide_legend(nrow=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*") (húmedo)"), x="") +
  theme(axis.text.x= element_blank()) +
  theme(axis.title.y= element_text(size=8)) +
   theme(
     legend.position = c(.0004, 0.90),
     legend.justification = "left",
     legend.box.just = "left",
     legend.margin = margin(6, 6, 6, 6),
     legend.background= element_rect(colour="black"),
     legend.key.width= unit(0.8, "cm"),
     legend.spacing.y = unit(-0.15, "cm"),
     legend.key.size = unit(0.1,"cm")
   )

  p2 <- ggplot() +
  theme_bw() +
  geom_line(data=Calibración_Marzo_Mayo, aes(x=date, y= as.numeric(Angstrom3000), colour="SAE"),lwd=1, alpha=0.7) +
  scale_colour_manual("", breaks="SAE", values="orange") +
  labs(y="SAE (húmedo)", x="") +
  theme(axis.text.x= element_blank()) +
  theme(axis.title.y= element_text(size=8)) +
    theme(
      legend.position = c(.0004, 0.90),
      legend.justification = "left",
      legend.box.just = "left",
      legend.margin = margin(6, 6, 6, 6),
      legend.background= element_rect(colour="black"),
      legend.key.width= unit(0.8, "cm"),
      legend.spacing.y = unit(-0.15, "cm"),
      legend.key.size = unit(0.1,"cm")
    )

data4 <- Calibración_Marzo_Mayo %>% select(date, "635 nm"=fRHRed, "525 nm"=fRHGreen, "450 nm"=fRHBlue) %>%  pivot_longer(c("635 nm","525 nm","450 nm"), names_to="fRH3000", values_to="fRH3000V")


 p3 <- ggplot() +
  theme_bw() +
  geom_line(data=data4, aes(x=date, y=as.numeric(fRH3000V), colour=fRH3000),alpha=0.7, lwd=1) +
  scale_colour_manual("", values=c("blue","green","red"), guide=guide_legend(nrow=1)) +
  labs(y="fRH") +
  scale_x_datetime("", labels= date_format("%Y-%m-%d"), breaks= date_breaks("5 day")) +
  theme(axis.text.x= element_text(angle=315)) +
  theme(axis.title.y= element_text(size=8)) +
   theme(
     legend.position = c(.0004, 0.90),
     legend.justification = "left",
     legend.box.just = "left",
     legend.margin = margin(6, 6, 6, 6),
     legend.background= element_rect(colour="black"),
     legend.key.width= unit(0.8, "cm"),
     legend.spacing.y = unit(-0.09, "cm"),
     legend.key.size = unit(0.1,"cm")
   )
  
 
 title1 <- ggdraw() + draw_label("")

plot_grid(title1,p1,p2,p3,ncol=1,nrow=4,rel_heights=c(0.2,1,1,1.3),labels=c("","a)","b)","c)"), label_x=0, label_y=c(1,1.15,1.09,1.06), label_size=12)







