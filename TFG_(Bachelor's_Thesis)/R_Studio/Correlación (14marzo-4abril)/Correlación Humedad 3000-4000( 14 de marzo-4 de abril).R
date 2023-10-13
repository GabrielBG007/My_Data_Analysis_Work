library(tidyverse)
library(openair)
library(datarium)
library(lubridate)
library(scales)
library(dplyr)
library(ggnewscale)

lmod1=lm(ScatRed3000~0 + ScatRed4000, Humedad)
lmod2=lm(ScatGreen3000~0 + ScatGreen4000, Humedad)
lmod3=lm(ScatBlue3000~0 + ScatBlue4000, Humedad)

summary(lmod1)

ggplot(Humedad) +
  theme_bw() +
  geom_point(aes(x= ScatBlue4000, y= ScatBlue3000, fill="450 nm"), shape=21, alpha=0.6, stroke=1, colour="black", size= 3.3) +
  geom_smooth(aes(x= ScatBlue4000, y= ScatBlue3000),method= "lm",formula= y~0 + x, colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue") +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x= ScatGreen4000, y= ScatGreen3000, fill="525 nm"), shape=21, alpha=0.6, stroke=1, colour="black", size= 3.3) +
  geom_smooth(aes(x= ScatGreen4000, y= ScatGreen3000),method= "lm",formula= y~0 + x, colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green") +
  annotate("text", x= 150, y=470, label= "y= 1.1168x", colour="green", size=4) +
  annotate("text", x= 150, y=448, label=expression("R"^2*"= 0.976"), colour="green", size=4) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x= ScatRed4000, y= ScatRed3000, fill="635 nm"), shape=21, alpha=0.6,stroke=1, colour="black", size= 3.3) +
  geom_smooth(aes(x= ScatRed4000, y= ScatRed3000),method= "lm",formula= y~0 + x, colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red") +
  annotate("text", x= 50, y=470, label= "y= 1.1952x", colour="red", size=4) +
  annotate("text", x= 50, y=448, label=expression("R"^2*"= 0.9735"), colour="red", size=4) +
  annotate("text", x= 250, y=470, label= "y= 1.096x", colour="blue", size=4) +
  annotate("text", x= 250, y=448, label=expression("R"^2*"= 0.9761"), colour="blue", size=4) +
  labs(y= "Dispersión 3000 (húmedo)") + labs(x="Dispersión 4000 (seco)") + labs(title= "Correlación") +
  theme(plot.title= element_text (hjust= 0.5)) + 
  theme(axis.title.y = element_text (hjust= 0.5)) + 
  theme(axis.title.x = element_text (hjust= 0.5)) 
    
  
  