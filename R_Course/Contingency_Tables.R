install.packages("ISLR2")

library(ISLR2)

View(Carseats)

t <- table(Carseats$Urban,Carseats$ShelveLoc)

str(t)
dim(t)
addmargins(t)
proportions(t)
