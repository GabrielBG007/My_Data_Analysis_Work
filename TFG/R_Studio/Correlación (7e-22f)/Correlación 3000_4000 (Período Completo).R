library(tidyverse)
library(datarium)
library(ggnewscale)
library(scales)
library(cowplot)

lmod1 <- lm(ScatRed3000~0+ScatRed4000, Calibración)
lmod2 <- lm(ScatGreen3000~0+ScatGreen4000, Calibración)
lmod3 <- lm(ScatBlue3000~0+ScatBlue4000, Calibración)

summary(lmod1)
summary(lmod2)
summary(lmod3)

 ggplot() +
  theme_bw() +
  geom_point(data=Calibración, aes(x=ScatRed4000, y=ScatRed3000, colour= "635 nm"), alpha=0.6, pch=21, fill="red", size=2.7) +
  geom_smooth(data=Calibración, aes(x=ScatRed4000, y=ScatRed3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="red") +
  scale_colour_manual("", breaks= "635 nm", values= "black", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=Calibración, aes(x=ScatGreen4000, y=ScatGreen3000, colour= "525 nm"), alpha=0.6, pch=21, fill="green", size=2.7) +
  geom_smooth(data=Calibración, aes(x=ScatGreen4000, y=ScatGreen3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="green") +
  scale_colour_manual("", breaks= "525 nm", values= "black", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=Calibración, aes(x=ScatBlue4000, y=ScatBlue3000, colour= "450 nm"), alpha=0.6, pch=21, fill="blue", size=2.7) +
  geom_smooth(data=Calibración, aes(x=ScatBlue4000, y=ScatBlue3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="blue") +
  scale_colour_manual("", breaks= "450 nm", values= "black", guide=guide_legend(order=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x=expression("Dispersión Aurora 4000 (Mm"^-1*")"),
       title= "Correlación Aurora 3000 y 4000") +
  theme(plot.title= element_text(hjust=0.5, face="bold", size=18),
        axis.title.y= element_text(size=16),
        axis.title.x= element_text(size=16),
        legend.text= element_text(size=16),
        axis.text.x= element_text(size=14),
        axis.text.y= element_text(size=14)) +
  annotate("text", x= 25, y= 365, label= "y=1.0585x", colour="red") +
  annotate("text", x= 25, y= 345, label=expression("R"^2*"=0.8934 "), colour="red") +
  annotate("text", x= 75, y= 365, label= "y=1.015x", colour="green") +
  annotate("text", x= 75, y= 345, label=expression("R"^2*"=0.9069 "), colour="green") +
  annotate("text", x= 125, y= 365, label= "y=0.981x", colour="blue") +
  annotate("text", x= 125, y= 345, label=expression("R"^2*"=0.9477 "), colour="blue") 



