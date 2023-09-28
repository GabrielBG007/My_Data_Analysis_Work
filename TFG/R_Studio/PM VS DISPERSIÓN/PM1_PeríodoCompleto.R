library(tidyverse)
library(datarium)
library(scales)
library(cowplot)
library(ggnewscale)


data1 <- left_join(Calibración,PM1SU, by=c("date"="date")) %>% drop_na()


lmod1 <- lm(ScatRed3000~0 + PM1, data1)
lmod2 <- lm(ScatGreen3000~0 + PM1, data1)
lmod3 <- lm(ScatBlue3000~0 + PM1, data1)


summary(lmod3)

p1 <- data1 %>% 
  ggplot() +
  theme_bw() +
  geom_point(aes(x=PM1, y=ScatRed3000, fill= "635 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatRed3000), method="lm",formula= y~0+x,colour="red", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="635 nm", values= "red", guide=guide_legend(order=3)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatGreen3000, fill= "525 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatGreen3000), method="lm",formula= y~0+x,colour="green", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="525 nm", values= "green", guide=guide_legend(order=2)) +
  ggnewscale::new_scale_fill() +
  geom_point(aes(x=PM1, y=ScatBlue3000, fill= "450 nm"), pch=21, colour= "black", alpha=0.7, size= 2.7) +
  geom_smooth(aes(x=PM1, y=ScatBlue3000), method="lm",formula= y~0+x,colour="blue", se=FALSE, lty=5) +
  scale_fill_manual("", breaks="450 nm", values= "blue", guide=guide_legend(order=1)) +
  annotate("text", x=6.3, y=118, label= "y= 3.3237x", colour="red", size=3) +
  annotate("text", x=6.3, y=111, label= expression("R"^2*"=0.8144 "), colour="red", size=3) +
  annotate("text", x=8.8, y=118, label= "y= 4.7220x", colour="green", size=3) +
  annotate("text", x=8.8, y=111, label= expression("R"^2*"=0.8573  "), colour="green", size=3) +
  annotate("text", x=11.3, y=118, label= "y= 6.0579x", colour="blue", size=3) +
  annotate("text", x=11.3, y=111, label= expression("R"^2*"=0.8582 "), colour="blue", size=3) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")")) +
  labs(x="") +
  labs(title=expression("Dispersión Aurora 3000 VS PM"[1]*" (Zona Suburbana)")) +
  theme(plot.title= element_text(hjust=0.5, size=12)) +
  theme(axis.title.x=element_text(size=10)) +
  theme(axis.title.y=element_text(size=10)) +
  labs(x=expression("PM"[1]*"(µg/m"^3*")"))

title1 <- ggdraw() + draw_label("Período completo", fontface="bold")

plot_grid(title1,p1,ncol=1,rel_heights=c(0.1,1))