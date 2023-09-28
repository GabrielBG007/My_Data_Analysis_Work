library(tidyverse)
library(cowplot)
library(ggnewscale)
library(datarium)


data2 <- Prueba %>% group_by(Ciudad) %>% summarise("avg_prec"=mean(Precipitaciones),
          "sum"=sum(Precipitaciones)) %>% print()

Prueba

ggplot() +
  geom_col(data=Prueba,aes(x=Ciudad, y=Precipitaciones),fill="blue", show.legend=FALSE) +
  geom_line(data=data2, aes(x=Ciudad, y=avg_prec, group=TRUE), colour="red", lwd=1) +
  geom_text(data=data2, aes(x=Ciudad, y=sum, label=sum), nudge_y=0.8) +
  labs(y="Precipitaciones") +
  theme_bw()
  
  geom_labe
  
  
  
  


     
               
