library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)





data1 <- Calibración %>% rename("635 nm"=ScatRed3000, "525 nm"=ScatGreen3000, "450 nm"=ScatBlue3000)

data2 <- data1 %>% na.omit()

data3 <- data2[9864:10137,]

data4 <- data3 %>% mutate(hour=as.character(hour(data3$date))) %>% print()

data5 <- data4 %>% filter(hour %in% c(7,8,9,10,11,12,13,14,15,16,17)) 

data6 <- data5 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat3000", values_to="Scat3000V") %>% print()



p1 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data6, aes(x=hour,y=Scat3000V, fill=Scat3000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title= "Dispersión Aurora 3000 VS Horas diurnas") +
  ylim(50,160) +
  scale_x_discrete("", limits=c("7","8","9","10","11","12","13","14","15","16","17")) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(axis.title.y=element_text(size=6)) +
  theme(plot.title=element_text(size=6))


title1 <- ggdraw() + draw_label("Días con intrusión de polvo (Mañana)", fontface="bold", size=8)

  x2 <- plot_grid(title1, p1,ncol=1, rel_heights=c(0.1,1))




data1 <- Calibración %>% select(1:4,13:15) %>% rename("635 nm"=ScatRed4000, "525 nm"=ScatGreen4000, "450 nm"=ScatBlue4000)

data2 <- data1 %>% na.omit()

data3 <- data2[8635:10665,]

data4 <- data3 %>% mutate(hour=as.character(hour(data3$date))) %>% print()

data5 <- data4 %>% filter(hour %in% c(7,8,9,10,11,12,13,14,15,16,17)) 

data6 <- data5 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat4000", values_to="Scat4000V") %>% print()



p2 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data6, aes(x=hour,y=Scat4000V, fill=Scat4000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), title= "Dispersión Aurora 4000 VS Horas diurnas") +
  ylim(0,200) +
  scale_x_discrete("", limits=c("7","8","9","10","11","12","13","14","15","16","17")) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(axis.title.y=element_text(size=6)) +
  theme(plot.title=element_text(size=6))


title2 <- ggdraw() + draw_label("Días con intrusión de polvo (Mañana)", fontface="bold", size=8)

 x2 <- plot_grid(title2, p2,ncol=1, rel_heights=c(0.1,1))












data1 <- Calibración %>% rename("635 nm"=ScatRed3000, "525 nm"=ScatGreen3000, "450 nm"=ScatBlue3000)

data2 <- data1 %>% na.omit()

data3 <- data2[9864:10137,]

data4 <- data3 %>% mutate(hour=as.character(hour(data3$date))) %>% print()

data5 <- data4 %>% filter(hour %in% c(18,19,20,21,22,23,0,1,2,3,4,5,6)) 

data6 <- data5 %>% group_by(hour) %>% summarise("635 nm"= `635 nm`, 
                                                "525 nm"= `525 nm`,
                                                "450 nm"=`450 nm`) %>% print()

data7 <- data6 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat3000", values_to="Scat3000V")







p3 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data7,aes(x= hour,y=Scat3000V, fill=Scat3000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  scale_x_discrete("", limits=c("18","19","20","21","22","23","0","1","2","3","4","5","6")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title= "Dispersión Aurora 3000 VS Horas nocturnas") +
  ylim(50,250) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(axis.title.y=element_text(size=6)) +
  theme(plot.title=element_text(size=6))


title3 <- ggdraw() + draw_label("Días con intrusión de polvo (Noche)", fontface="bold", size=8)

 x4 <- plot_grid(title3, p3,ncol=1, rel_heights=c(0.1,1))
 
 
  g2 <- plot_grid(x2,x4,ncol=2,nrow=1,rel_widths=c(1,1))






data1 <- Calibración %>% select(1:4,13:15) %>% rename("635 nm"=ScatRed4000, "525 nm"=ScatGreen4000, "450 nm"=ScatBlue4000)

data2 <- data1 %>% na.omit()

data3 <- data2[-c(8635:10665,1:324,3292:3460,1438:1827,4144:4396,5476:5800,6798,7368),]

data4 <- data3 %>% mutate(hour=as.character(hour(data3$date))) %>% print()

data5 <- data4 %>% filter(hour %in% c(18,19,20,21,22,23,0,1,2,3,4,5,6)) 

data6 <- data5 %>% group_by(hour) %>% summarise("635 nm"= `635 nm`, 
                                                "525 nm"= `525 nm`,
                                                "450 nm"=`450 nm`) %>% print()

data7 <- data6 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat4000", values_to="Scat4000V")







p4 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data7,aes(x=hour,y=Scat4000V, fill=Scat4000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  scale_x_discrete("", limits=c("18","19","20","21","22","23","0","1","2","3","4","5","6")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), title= "Dispersión Aurora 4000 VS Horas nocturnas") +
  ylim(0,100) +
  theme(plot.title=element_text(hjust=0.5)) +
  theme(axis.title.y=element_text(size=6)) +
  theme(plot.title=element_text(size=6))


title4 <- ggdraw() + draw_label("Días con intrusión de polvo (Noche)", fontface="bold", size=8)

 x4 <- plot_grid(title4, p4,ncol=1, rel_heights=c(0.1,1))


m2 <- plot_grid(x1,x2,x3,x4,ncol=2, nrow=2, rel_widths=c(1,1))

