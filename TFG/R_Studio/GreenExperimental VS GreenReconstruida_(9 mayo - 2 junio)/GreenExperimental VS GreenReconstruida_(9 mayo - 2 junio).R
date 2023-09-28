library(tidyverse)
library(scales)        
library(datarium)
library(ggnewscale)
library(cowplot)

lmod1 <- lm(ScatGreen3000~0 + ScatGreen3000_C, data=Reco)

summary(lmod1)


ggplot() +
  theme_bw() +
  geom_point(data= Reco, aes(x=ScatGreen3000_C, y= ScatGreen3000), colour= "black", pch=21, fill="green", alpha= 0.6, size=2.7, stroke=1) +
  geom_smooth(data= Reco, aes(x=ScatGreen3000_C, y= ScatGreen3000), method="lm", colour= "black", lty=5, se= FALSE) +
  annotate("text", x=31.25, y= 86, label= "y= 1.0001x", colour= "black", size= 5.8) +
  annotate("text", x=31.25, y= 79, label= expression("R"^2*"= 0.9225"), colour= "black", size= 5.8) +
  labs(x= "Dispersión (525 nm) reconstruida", y= "Dispersión (525 nm) experimental") +
  theme(
    axis.title.x= element_text(size=16),
    axis.title.y= element_text(size=16),
    axis.text.x= element_text(size=14),
    axis.text.y = element_text(size=14),
    axis.title.y.right= element_text(vjust=0.5),
    aspect.ratio=0.7
  )


