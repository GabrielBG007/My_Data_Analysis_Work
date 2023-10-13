library(tidyverse)
library(nortest)
library(datarium)
library(cowplot)

data1 <- X14_marzo %>% pivot_longer(c("ScatRed3000","ScatGreen3000","ScatBlue3000"), names_to="Scat3000",
                                   values_to="Scat3000V")

p1 <- ggplot(data=data1, aes(x= Scat3000V, fill= Scat3000, colour= Scat3000)) +
   theme_bw() +
   geom_density(alpha=0.5, lwd=0.7, lty=5) +
   scale_fill_manual("",values=c("blue","green","red")) +
   scale_colour_manual("", values=c("blue","green","red")) +
   labs(y="Densidad", x=expression("Dispersión Aurora (Mm"^-1*")")) +
   facet_grid(~Scat3000)

 data2 <- X14_marzo %>% pivot_longer(c("ScatRed4000","ScatGreen4000","ScatBlue4000"), names_to="Scat4000",
                                    values_to="Scat4000V")

 
 p2 <- ggplot(data=data2, aes(x= Scat4000V, fill= Scat4000, colour= Scat4000)) +
   theme_bw() +
   geom_density(alpha=0.5, lwd=0.7, lty=5) +
   scale_fill_manual("",values=c("blue","green","red")) +
   scale_colour_manual("", values=c("blue","green","red")) +
   labs(y="Densidad", x=expression("Dispersión Aurora (Mm"^-1*")")) +
   facet_grid(~Scat4000)

  title1 <- ggdraw() + draw_label("Distribución de los datos", fontface="bold")  

  x1 <- plot_grid(p1,p2, ncol=1, nrow=2, rel_widths=c(1,1))  

  plot_grid(title1, x1, ncol=1, rel_heights=c(0.1,1))  
  
  
  # ¿Son las distribuciones normales, tanto del scattering green 3000 como del 4000?
  # alpha=0.05
  
  lillie.test(X14_marzo$ScatGreen4000)

  # ¿Tienen el scatgreen3000 y 4000 la misma mediana?
  
  
  data3 <- X14_marzo %>% pivot_longer(c("ScatGreen3000","ScatGreen4000"), names_to="ScatGreen", values_to="ScatGreenV")
  
  wilcox.test(ScatGreenV ~ ScatGreen, data= data3)

    