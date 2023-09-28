library(tidyverse)
library(datarium)
library(ggnewscale)
library(scales)
library(cowplot)


data1 <- Calibración[c(8191:10137),]
lmod1 <- lm(ScatRed3000~0+ScatRed4000, data1)
lmod2 <- lm(ScatGreen3000~0+ScatGreen4000, data1)
lmod3 <- lm(ScatBlue3000~0+ScatBlue4000, data1)

summary(lmod1)
summary(lmod2)
summary(lmod3)

p1 <- ggplot() +
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
  theme(plot.title= element_text(hjust=0.5)) +
  annotate("text", x= 25, y= 365, label= "y=0.9991x", colour="red") +
  annotate("text", x= 25, y= 345, label=expression("R"^2*"=0.8932 "), colour="red") +
  annotate("text", x= 75, y= 365, label= "y=0.8848x", colour="green") +
  annotate("text", x= 75, y= 345, label=expression("R"^2*"=0.8821 "), colour="green") +
  annotate("text", x= 125, y= 365, label= "y=0.9497x", colour="blue") +
  annotate("text", x= 125, y= 345, label=expression("R"^2*"=0.9332 "), colour="blue") 

title1 <- ggdraw() + draw_label("Período 7 enero - 22 febrero (Días con intrusión de polvo)", fontface="bold")

plot_grid(title1, p1, ncol=1, rel_heights=c(0.1,1))
