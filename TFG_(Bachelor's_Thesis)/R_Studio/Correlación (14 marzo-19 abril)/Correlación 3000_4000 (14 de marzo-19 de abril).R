library(tidyverse)
library(datarium)
library(cowplot)
library(scales)
library(ggnewscale)



lmod1 <- lm(ScatRed3000~0 + ScatRed4000, Calibración_Humedad)
lmod2 <- lm(ScatGreen3000~0 + ScatGreen4000, Calibración_Humedad)
lmod3 <- lm(ScatBlue3000~0 + ScatBlue4000, Calibración_Humedad)

summary(lmod3)

p1 <- ggplot() +
  theme_bw() +
  geom_point(data=Calibración_Humedad, aes(x=ScatRed4000, y=ScatRed3000, fill="635 nm"), alpha=0.7, colour="black", size=3.3, stroke=1, shape=21) +
  geom_smooth(data=Calibración_Humedad, aes(x=ScatRed4000, y=ScatRed3000), method="lm", formula= y~0 + x, se=FALSE, lty=5, colour="red") +
  scale_fill_manual("", breaks="635 nm", values="red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(data=Calibración_Humedad, aes(x=ScatGreen4000, y=ScatGreen3000, fill="525 nm"), alpha=0.7, colour="black", size=3.3, stroke=1, shape=21) +
  geom_smooth(data=Calibración_Humedad, aes(x=ScatGreen4000, y=ScatGreen3000), method="lm", formula= y~0 + x, se=FALSE, lty=5, colour="green") +
  scale_fill_manual("", breaks="525 nm", values="green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(data=Calibración_Humedad, aes(x=ScatBlue4000, y=ScatBlue3000, fill="450 nm"), alpha=0.7, colour="black", size=3.3, stroke=1, shape=21) +
  geom_smooth(data=Calibración_Humedad, aes(x=ScatBlue4000, y=ScatBlue3000), method="lm", formula= y~0 + x, se=FALSE, lty=5, colour="blue") +
  scale_fill_manual("", breaks="450 nm", values="blue", guide=guide_legend(order=1)) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*") (húmedo)"), x=expression("Dispersión Aurora 4000 (Mm"^-1*") (seco)"), title="Correlación") +
  theme(plot.title=element_text(hjust=0.517)) +
  annotate("text", x=50, y=480, label="y= 1.2134x", colour="red") +
  annotate("text", x=50, y=440, label=expression("R"^2*"= 0.967"), colour="red") +
  annotate("text", x=150, y=480, label="y= 1.134x", colour="green") +
  annotate("text", x=150, y=440, label=expression("R"^2*"= 0.9697"), colour="green") +
  annotate("text", x=250, y=480, label="y= 1.1121x", colour="blue") +
  annotate("text", x=250, y=440, label=expression("R"^2*"= 0.9706"), colour="blue") 


title1 <- ggdraw() + draw_label("Período 4 de marzo - 19 de abril", fontface="bold")

plot_grid(title1, p1, ncol=1, rel_heights=c(0.1,1))


  
  