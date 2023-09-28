library(ggplot2)
ggplot() +
  geom_point(data= Prueba, 
  aes(x= ScatRed3000, y= ScatRed4000), color="red") +
  guides(color= guide_legend(title= "635")) +
  geom_point(data= Prueba,
  aes(x= ScatGreen3000, y=ScatGreen4000), color="green") +
  geom_point(data= Prueba,
  aes(x= ScatBlue3000, y=ScatBlue4000), color="blue")
library(openair)
x2<- Prueba$ScatGreen3000
y2<- Prueba$ScatGreen4000
x3<- Prueba$ScatBlue3000
y3<- Prueba$ScatBlue4000
Corr1<- cor(Prueba$ScatRed3000,Prueba$ScatBlue3000)
Corr2<- cor(x2, y2)
Corr3<- cor(x3, y3)
plot(Prueba$ScatRed3000, Prueba$ScatRed4000, col="red", pch=19,
regLine= list(col= "red"))
text(paste("R=", round(Corr1, 3)), x=120, y=800, col="red")
points(x2, y2, col= "green", pch=19)
text(paste("R=", round(Corr2, 3)), x=120, y=700, col="green")
points(x3, y2, col= "blue", pch=19)
text(paste("R=", round(Corr3, 3)), x=120, y=600, col="blue")
