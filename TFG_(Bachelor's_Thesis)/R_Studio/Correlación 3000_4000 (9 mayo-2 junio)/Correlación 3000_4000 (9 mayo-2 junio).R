library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración %>% drop_na()

lmod1 <- lm(ScatRed3000~0 + ScatRed4000, data1)
lmod2 <- lm(ScatGreen3000~0 + ScatGreen4000, data1)
lmod3 <- lm(ScatBlue3000~0 + ScatBlue4000, data1)


summary(lmod1)
summary(lmod2)
summary(lmod3)


ggplot() +
  theme_bw() +
  geom_point(data=data1, aes(x=ScatRed4000, y=ScatRed3000, colour= "635 nm"), alpha=0.6, pch=21, fill="red", size=2.7) +
  geom_smooth(data=data1, aes(x=ScatRed4000, y=ScatRed3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="red") +
  scale_colour_manual("", breaks= "635 nm", values= "black", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data1, aes(x=ScatGreen4000, y=ScatGreen3000, colour= "525 nm"), alpha=0.6, pch=21, fill="green", size=2.7) +
  geom_smooth(data=data1, aes(x=ScatGreen4000, y=ScatGreen3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="green") +
  scale_colour_manual("", breaks= "525 nm", values= "black", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data1, aes(x=ScatBlue4000, y=ScatBlue3000, colour= "450 nm"), alpha=0.6, pch=21, fill="blue", size=2.7) +
  geom_smooth(data=data1, aes(x=ScatBlue4000, y=ScatBlue3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="blue") +
  scale_colour_manual("", breaks= "450 nm", values= "black", guide=guide_legend(order=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x=expression("Dispersión Aurora 4000 (Mm"^-1*")"),
       title= "Correlación Aurora 3000 y 4000") +
  theme(plot.title= element_text(hjust=0.5, face="bold", size=18),
        axis.title.y=element_text(size=16),
        axis.title.x=element_text(size=16),
        legend.text=element_text(size=16),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14)) +
  annotate("text", x= 75, y= 580, label= "y=1.3088x", colour="red") +
  annotate("text", x= 75, y= 540, label=expression("R"^2*"=0.9748 "), colour="red") +
  annotate("text", x= 125, y= 580, label= "y=1.2205x", colour="green") +
  annotate("text", x= 125, y= 540, label=expression("R"^2*"=0.9796 "), colour="green") +
  annotate("text", x= 175, y= 580, label= "y=1.1886x", colour="blue") +
  annotate("text", x= 175, y= 540, label=expression("R"^2*"=0.9805 "), colour="blue") 


