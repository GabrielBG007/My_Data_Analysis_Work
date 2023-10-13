library(tidyverse)
library(cowplot)
library(datarium)
library(scales)
library(ggnewscale)


SuburbanoEstabilidad1 <- SuburbanoEstabilidad %>% rename("635 nm"=ScatTRed3000 , "525 nm"=ScatTGreen3000 , "450 nm"=ScatTBlue3000)

SuburbanoEstabilidad2 <- SuburbanoEstabilidad1 %>% pivot_longer(
  c("635 nm","525 nm","450 nm"), names_to= "Scat3000", values_to="Scat3000V")


p3 <- ggplot() +
  theme_bw() +
  geom_boxplot(data=SuburbanoEstabilidad2, aes(x=Nombre1, y=Scat3000V, fill= Scat3000), alpha=0.7) +
  scale_fill_manual("", values=c("blue","green","red")) +
  labs(y=expression("Dispersión Total Aurora (Mm"^-1*")"), x="") +
  theme(axis.text.x=element_text(face ="bold", size=12)) +
  labs(title= "") +
  theme(plot.title=element_text(hjust=0.52, size=12))

title3 <- ggdraw() + draw_label(expression("Días con gran estabilidad atmosférica (PM"[10]*"Suburbano-PM"[1]*"Urbano)", fontface="bold"))  

p <- plot_grid(title3,p3,ncol=1,rel_heights=c(0.1,1)) 

plot_grid(i,o,p,ncol=3,nrow=1,rel_widths=c(1,1))
