library(tidyverse)
library(datarium)
library(ggnewscale)
library(cowplot)
library(scales)





data1 <- Calibración %>% rename("635 nm"=ScatRed3000, "525 nm"=ScatGreen3000, "450 nm"=ScatBlue3000)

data2 <- data1 %>% na.omit()

data3 <- data2[-c(8191:10137,1:322,3188:3336,1422:1661,4131:4239,5258:5582,6445,6933),]

data4 <- data3 %>% mutate(weekday=as.character(wday(data3$date, label=TRUE, abbr=FALSE, week_start=1))) %>% print()

data5 <- data4 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat3000", values_to="Scat3000V") %>% print()



p1 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data5, aes(x=weekday,y=Scat3000V, fill=Scat3000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title= "Dispersión Aurora 3000 VS Días de la semana") +
  scale_x_discrete("", limits=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),
                   labels=c("Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo")) +
  ylim(0,210) +
  theme(plot.title=element_text(hjust=0.5, size=12)) +
  theme(axis.title.y=element_text(size=10))
 

title1 <- ggdraw() + draw_label("Días Normales", fontface="bold")

x1 <- plot_grid(title1, p1,ncol=1, rel_heights=c(0.1,1))




data1 <- Calibración %>% select(1:4,13:15) %>% rename("635 nm"=ScatRed4000, "525 nm"=ScatGreen4000, "450 nm"=ScatBlue4000)

data2 <- data1 %>% na.omit()

data3 <- data2[-c(8635:10665,1:324,3292:3460,1438:1827,4144:4396,5476:5800,6798,7368),]

data4 <- data3 %>% mutate(weekday=as.character(wday(data3$date, label=TRUE, abbr=FALSE, week_start=1))) %>% print()

data5 <- data4 %>% pivot_longer(c("635 nm","525 nm","450 nm"), names_to= "Scat4000", values_to="Scat4000V") %>% print()



p2 <- ggplot() +
  theme_bw() +
  geom_boxplot(data= data5, aes(x=weekday,y=Scat4000V, fill=Scat4000), alpha=0.7, outlier.shape=NA) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Aurora 4000 (Mm"^-1*")"), title= "Dispersión Aurora 4000 VS Días de la semana") +
  scale_x_discrete("", limits=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),
                   labels=c("Lunes","Martes","Miércoles","Jueves","Viernes","Sábado","Domingo")) +
  ylim(0,210) +
  theme(plot.title=element_text(hjust=0.5)) 



title2 <- ggdraw() + draw_label("Días Normales", fontface="bold")

 x2 <- plot_grid(title2, p2,ncol=1, rel_heights=c(0.1,1))

d1 <- plot_grid(x1,x2, ncol=2, rel_widths=c(1,1))










