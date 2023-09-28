library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Calibración %>% drop_na()

data2 <- data1 %>% mutate(RH3000_4000= RH3000-RH4000) %>% filter(RH3000_4000 >= 20)

lmod1 <- lm(ScatRed3000~0 + ScatRed4000, data2)
lmod2 <- lm(ScatGreen3000~0 + ScatGreen4000, data2)
lmod3 <- lm(ScatBlue3000~0 + ScatBlue4000, data2)


summary(lmod1)
summary(lmod2)
summary(lmod3)


 ggplot() +
  theme_bw() +
  geom_point(data=data2, aes(x=ScatRed4000, y=ScatRed3000, colour= "635 nm"), alpha=0.6, pch=21, fill="red", size=2.7) +
  geom_smooth(data=data2, aes(x=ScatRed4000, y=ScatRed3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="red") +
  scale_colour_manual("", breaks= "635 nm", values= "black", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data2, aes(x=ScatGreen4000, y=ScatGreen3000, colour= "525 nm"), alpha=0.6, pch=21, fill="green", size=2.7) +
  geom_smooth(data=data2, aes(x=ScatGreen4000, y=ScatGreen3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="green") +
  scale_colour_manual("", breaks= "525 nm", values= "black", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_colour() +
  geom_point(data=data2, aes(x=ScatBlue4000, y=ScatBlue3000, colour= "450 nm"), alpha=0.6, pch=21, fill="blue", size=2.7) +
  geom_smooth(data=data2, aes(x=ScatBlue4000, y=ScatBlue3000), se=FALSE, formula= y~0+x, method="lm", lty=5, colour="blue") +
  scale_colour_manual("", breaks= "450 nm", values= "black", guide=guide_legend(order=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), x=expression("Dispersión Aurora 4000 (Mm"^-1*")"),
       title= "Correlación Aurora 3000 y 4000") +
  theme(plot.title= element_text(hjust=0.5, face="bold")) +
  annotate("text", x= 22.5, y= 120, label= "y=1.3594x", colour="red") +
  annotate("text", x= 22.5, y= 110, label=expression("R"^2*"=0.9906 "), colour="red") +
  annotate("text", x= 37.5, y= 120, label= "y=1.3341x", colour="green") +
  annotate("text", x= 37.5, y= 110, label=expression("R"^2*"=0.9911 "), colour="green") +
  annotate("text", x= 52.5, y= 120, label= "y=1.313x", colour="blue") +
  annotate("text", x= 52.5, y= 110, label=expression("R"^2*"=0.9891 "), colour="blue") 


