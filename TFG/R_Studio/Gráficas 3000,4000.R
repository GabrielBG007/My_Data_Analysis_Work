library(openair)
time <- timeVariation(X3000_4000_R, pollutant=c("ScatRed3000",
  "ScatRed4000","ScatGreen3000","ScatGreen4000","ScatBlue3000",
  "ScatBlue4000"), 
  cols=c("red","red","green","green","blue","blue"),
  lty=c(1,5,1,5,1,5),fontsize=8,
  ylab="", ci= FALSE)
plot(time, subset= "day.hour")
timePlot(X3000_4000_R, pollutant= "ScatRed3000", cols= "red",
         avg.time= "day", date.pad= FALSE)
scatterPlot(X3000_4000_R, x="Angstrom4000", y="ScatBlue4000",
            method= "hexbin", cols= "jet",
            ref.x= list(v=1, lty=5))

library(ggplot2)
ggplot(data= X3000_4000_R,aes(x= Angstrom4000, y= ScatBlue4000)) +
  stat_density_2d(aes(fill=..level..),geom= "polygon", colour= "white") +
  scale_fill_distiller(palette="Blues", direction= -1)
ggplot(data= X3000_4000_R,aes(x= Angstrom4000, y= ScatBlue4000)) +
  geom_hex(bins=50) +
  scale_fill_continuous(type="gradient")

install.packages("padr")
library("padr")
mydata_new <- pad(X3000_4000_R)
library(openair)
timePlot(X3000_4000_R, pollutant=c("ScatRed3000","ScatRed4000","ScatGreen3000",
 "ScatGreen4000","ScatBlue3000","ScatBlue4000"), cols=c("red","red",
   "green","green","blue","blue"), lwd=2, lty=c(1,5,1,5,1,5), group=TRUE,
   avg.time= "day", ylab= "", main= "Scattering(3000,4000)(Mm^-1) VS Date(by day)")

scatterPlot(X3000_4000_R, x="Angstrom4000", y="ScatBlue4000",
method= "density", cols=c("jet"), avg.time= "day",
ylab= "ScatteringBlue4000(Mm^-1)", xlab="Angström4000",
main= "ScatteringBlue4000(Mm^-1) VS Angström4000")
smoothTrend(X3000_4000_R, pollutant=c("ScatRed3000"), avg.time= "day")
calendarPlot(X3000_4000_R, pollutant= "Angstrom4000",
   avg.time= "day", cols= "Purples",
   main= "Angström4000")
time <- timeVariation(X3000_4000_R, pollutant=c("ScatRed3000",
"ScatRed4000", "ScatGreen3000", "ScatGreen4000", 
"ScatBlue3000","ScatBlue4000"), cols=c("red","red","green",
  "green","blue","blue"), lwd=2, lty=c(1,5,1,5,1,5), avg.time= "day",
  ci=FALSE, ylab= "", fontsize= 8)
plot(time, subset= "day")

plot<- timePlot(X3000_4000_R, pollutant=c("ScatRed3000","ScatRed4000","ScatGreen3000",
"ScatGreen4000","ScatBlue3000","ScatBlue4000"), cols=c("red","red",
"green","green","blue","blue"), lwd=2, lty=c(1,5,1,5,1,5), group=TRUE,
avg.time= "day", ylab= "", main= "Scattering(3000,4000)(Mm^-1) VS Date(by day)")
scatterPlot(X3000_4000_R, x="Angstrom4000", y="ScatBlue4000",
            method= "density", cols=c("jet"), avg.time= "day",
            ylab= "ScatteringBlue4000(Mm^-1)", xlab="Angström4000",
            main= "ScatteringBlue4000(Mm^-1) VS Angström4000")
trendLevel(X3000_4000_R, pollutant= "Angstrom3000",
 x= "weekday", y= "ScatRed3000", brakes=c(0,1,2), cols= c("yellow","darkblue"))
timePlot(X3000_4000_R, pollutant=c("Angstrom3000","Angstrom4000"),
         cols= c("orange","violet"), avg.time="day", group=TRUE, lwd=2, lty=1,
         ref.y= list(h=1,lty=5))
install.packages("datarium")
library(tidyverse)
library(datarium)
library(openair)
Daily<- timeAverage(X3000_4000_R, avg.time= "day")
data1<- Daily %>% 
  pivot_longer(c("ScatRed3000","ScatGreen3000","ScatBlue3000",
   "Angstrom3000"), names_to= "SA", values_to= "SAV") %>% 
  print()
ggplot(data1, aes(x= date, y= SAV, colour= SA)) +
  geom_point(pch=19) +
  scale_color_manual(values=c("orange","blue","green","red")) +
  geom_line(lwd=0.5, lty= 6) +
  labs(colour= "") +
  labs(y= "") +
  labs(title= "Scattering3000(Mm^-1), Angström3000 VS Date(by Day)") +
  theme(plot.title = element_text(hjust= 0.5)) +
  theme_bw() +
  facet_wrap(~ fct_rev(SA), ncol=1, scales="free_y")
 

