library(ggplot2)
lmod= lm(ScatBlue4000~0+ScatBlue3000, Calibración)
summary(lmod)
ggplot() +
  geom_point(data= Calibración, aes(x= ScatRed3000, y= ScatRed4000),
  color= "red", pch= 19) + xlim(0,600) + ylim(0,600) +
  geom_smooth(data= Calibración, aes(x= ScatRed3000, y= ScatRed4000),
  method= "lm", se=0, color="red", lty=5, formula= y~0+x) +
  scale_colour_manual(name ="",
  values=c("red","green","blue"),
  labels=c("635 nm", "525 nm", "450 nm")) +
  geom_point(data= Calibración, aes(x= ScatGreen3000, y= ScatGreen4000),
             color= "green", pch= 19) + xlim(0,600) + ylim(0,600) +
  geom_smooth(data= Calibración, aes(x= ScatGreen3000, y= ScatGreen4000),
              method= "lm", se=0, color="green", lty=5,formula= y~0+x) +
  geom_point(data= Calibración, aes(x= ScatBlue3000, y= ScatBlue4000),
             color= "blue", pch= 19) +  xlim(0,600) + ylim(0,600) +
  geom_smooth(data= Calibración, aes(x= ScatBlue3000, y= ScatBlue4000),
              method= "lm", se=0, color="blue", lty=5,formula= y~0+x) + 
  theme_minimal() +
  annotate("text", x=50, y=550, label= "R^2=0.7379", color= "red") +
  annotate("text", x=150, y=550, label= "R^2=0.7704", color= "green") +
  annotate("text", x=250, y=550, label= "R^2=0.858", color= "blue")

