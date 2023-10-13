library(tidyverse)
library(ggplot2)
library(datarium)
library(openair)
library(cowplot)
library(dplyr)
library(viridis)
library(ggforce)
Daily <- timeAverage(X3000_4000_R, avg.time= "day")
  Data1 <-Daily %>% 
  pivot_longer(c("ScatRed3000","ScatGreen3000","ScatBlue3000"), names_to= "SA", values_to= "SAV") %>% 
   print()
 
  ggplot(Data1 , aes(x= Angstrom3000, y= SAV, shape= SA, colour= SA, fill= SA)) +
    geom_point() +
    scale_colour_viridis(discrete= TRUE) +
    scale_fill_viridis(discrete= TRUE) +
    geom_mark_ellipse(expand= 0, aes(fill= SA))
  
  
    
    
  
  
 
  
   



