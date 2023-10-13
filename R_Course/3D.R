library(scatterplot3d)
library(tidyverse)
library(datarium)
library(openair)
library(rgl)
library(magick)
layout(matrix(c(1:6), ncol=3))
data1 <- Calibración %>% select(RH3000,Angstrom3000,ScatRed3000)
data2 <- Calibración %>% select(RH3000,Angstrom3000,ScatGreen3000)
data3 <- Calibración %>% select(RH3000,Angstrom3000,ScatBlue3000)
data4 <- Calibración %>% select(RH4000,Angstrom4000,ScatRed4000)
data5 <- Calibración %>% select(RH4000,Angstrom4000,ScatGreen4000)
data6 <- Calibración %>% select(RH4000,Angstrom4000,ScatBlue4000)


scatterplot3d(data1[,1:3], angle= 350, color= "black", bg= "red" ,pch= 21,cex.symbols = 1, main="ScatRed3000")
scatterplot3d(data4[,1:3],angle= 350, color= "black", bg= "red" ,pch= 21,cex.symbols = 1, main="ScatRed4000", xlim =c(5,40))
scatterplot3d(data2[,1:3],angle= 350, color= "black", bg= "green" ,pch= 21,cex.symbols = 1,main="ScatGreen3000")
scatterplot3d(data5[,1:3],angle= 350, color= "black", bg= "green" ,pch= 21,cex.symbols = 1,main="ScatGreen4000", xlim =c(5,40))
scatterplot3d(data3[,1:3],angle= 350, color= "black", bg= "blue" ,pch= 21,cex.symbols = 1, main= "ScatBlue3000")
scatterplot3d(data6[,1:3],angle= 350, color= "black", bg= "blue" ,pch= 21,cex.symbols = 1, main= "ScatBlue4000", xlim =c(5,40))



