library(openair)
library(tidyverse)
library(ggnewscale)
library(cowplot)
library(scales)
library(datarium)

lmod1 <- lm(RH3000~0 + RH4000, Humedad)

summary(lmod1)

ggplot() +
  theme_bw() +
  geom_point(data= Humedad, aes(x=RH4000, y=RH3000), pch=21, size=2.7, alpha=0.7, fill= "turquoise1", stroke=1) +
  geom_smooth(data= Humedad, aes(x=RH4000, y=RH3000), method="lm" ,lty=5, colour="black") +
  labs(x="RH 4000 (%)", y="RH 3000 (%)", title="Correlación humedades Aurora 3000 y 4000") +
  theme(plot.title= element_text(hjust=0.5)) +
  annotate("text", x= 17.5, y= 34, label="y=0.9951x - 4.6054", colour="black", size=3) +
  annotate("text", x= 17.5, y= 32, label=expression("R"^2*"=0.9638"), colour="black", size=3) +
  theme(axis.title.y=element_text(size=16),
        axis.title.x=element_text(size=16),
        plot.title= element_text(size=18, face="bold"),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14),
        legend.text=element_text(size=14))
  
