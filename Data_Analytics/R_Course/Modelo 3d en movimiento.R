library(rgl)
library(tidyverse)
library(scales)
library(ggnewscale)
library(cowplot)





data4 <- Calibración %>% pivot_longer(c("ScatRed3000","ScatGreen3000","ScatBlue3000"), names_to="Scat3000", values_to="Scat3000V")

data5 <- data4 %>% mutate(colors= case_when(Scat3000=="ScatRed3000"~"red",
                                            Scat3000=="ScatGreen3000"~"green",
                                            Scat3000=="ScatBlue3000"~"blue",
                                            TRUE~NA_character_))

plot3d(data5$Angstrom3000,data5$RH3000,data5$Scat3000V, pch=21, col=data5$colors, type="s", size=1, xlab="Angstrom",
       ylab="Humedad (%)", zlab=expression("Dispersión Aurora 3000 (Mm"^-1*")"))

movie3d(spin3d(axis=c(0,0,1), rpm=1), duration= 180, dir= "./")       

legend3d("left", legend=c("635 nm", "525 nm","450 nm"), col=c("blue","green","red"),inset=c(0.1), pch=16)