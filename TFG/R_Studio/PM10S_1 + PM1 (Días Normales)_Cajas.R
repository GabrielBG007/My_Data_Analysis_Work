library(tidyverse)
library(cowplot)
library(datarium)
library(scales)
library(ggnewscale)


SuburbanoNormal1 <- SuburbanoNormal %>% rename("635 nm"=ScatTRed3000 , "525 nm"=ScatTGreen3000 , "450 nm"=ScatTBlue3000)

SuburbanoNormal2 <- SuburbanoNormal1 %>% pivot_longer(
  c("635 nm","525 nm","450 nm"), names_to= "Scat3000", values_to="Scat3000V")


p1 <- ggplot() +
  theme_bw() +
  geom_boxplot(data=SuburbanoNormal2, aes(x=Nombre1, y=Scat3000V, fill= Scat3000), alpha=0.7) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Total Aurora (Mm"^-1*")"), x="") +
  theme(axis.text.x=element_text(face ="bold", size=12)) +
  labs(title= "") +
  theme(plot.title=element_text(hjust=0.52, size=12))

title1 <- ggdraw() + draw_label(expression("Días Normales (PM"[10]*"Suburbano-PM"[1]*"Urbano)", fontface="bold"))  

 i <- plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))  
 