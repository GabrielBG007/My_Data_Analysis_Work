library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- Horas[-c(340:373,466:482),]

data2 <- data1 %>% select(date,RH3000, "635 nm"=fRHRed, fRHGreen, "450 nm"=fRHBlue) 

lmod1 <- nls(log(fRHGreen) ~ log(a*exp(b*RH3000)), data2, start = c(a = 0.7886, b = 0.0092))

summary(lmod1)


  ggplot() +
  theme_bw() +
  geom_point(data=data2, aes(x=RH3000, y=fRHGreen), pch=21, alpha=0.7, colour="black", stroke=1, fill= "green", size=2.7) +
  geom_smooth(data=data2, aes(x=RH3000, y=fRHGreen), se=FALSE, method= "nls", formula= y ~ a * exp(b * x),
              method.args= list(start=coef(lmod1)),lty=5, colour= "black", size=1.5) +
  annotate("text", x=37.5, y=2.2, label= expression("y= 0.7866e"^"0.0092x"), colour="black", size=5.8) +
  annotate("text", x=36, y=2.1, label= expression("R"^2*"= 0.2294"), colour="black", size=5.8) +
  labs(y= "fRH (525 nm)", x="RH (%)") +
  theme(
    axis.text.x=element_text(size=14),
    axis.title.x=element_text(size=16),
    axis.title.y=element_text(size=16),
    axis.text.y=element_text(size=14),
    aspect.ratio= 0.7) +
    scale_y_continuous(limits=c(0,2.5)) +
    scale_x_continuous(limits=c(25,75))
  


p2 <- ggplot() +
  theme_bw() +
  geom_smooth(data=data2, aes(x=RH3000, y=fRHGreen), se=FALSE, method= "lm", formula= (y~exp(x)), lty=5, colour= "black") +
  labs(y= "fRH (525 nm)", x="RH(%)") +
  theme(
    axis.text.y=element_text(size=14),
    axis.title.y=element_text(size=16),
    axis.text.x=element_text(size=14),
    axis.title.x=element_text(size=16)) +
    scale_y_continuous(limits=c(0,3))
   
  

plot_grid(p1,p2,ncol=1,nrow=2, rel_heights=c(1,1), labels=c("a)","b)"))


geom_smo




