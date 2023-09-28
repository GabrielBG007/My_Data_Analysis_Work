library(tidyverse)
library(datarium)
library(scales)
library(ggnewscale)
library(cowplot)

data1 <- left_join(X3000,X4000, by=c("date"="date")) %>% drop_na()

data2 <- data1 %>% mutate("fRHRed"= ScatRed3000/ScatRed4000,
                          "fRHGreen"= ScatGreen3000/ScatGreen4000,
                          "fRHBlue"= ScatBlue3000/ScatBlue4000)
data3 <- data2 %>% mutate(fRHRed= if_else(fRHRed >= 2.7, NA_integer_,unique(data2$fRHRed)),
                          fRHGreen= if_else(fRHGreen >= 2.7, NA_integer_,unique(data2$fRHGreen)),
                          fRHBlue= if_else(fRHBlue >= 2.7, NA_integer_,unique(data2$fRHBlue)))

write.csv(data3,"C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\Nuevos Excel Corregidos por días no válidos\\14 marzo-3 mayo\\3000_4000 (14marzo-3mayo)_intervalo_5_minutos.csv", row.names=FALSE)

Hours <- data3 %>% mutate(date=cut.POSIXt(data3$date, breaks="hour")) %>% 
  group_by(date) %>% summarise(across(everything(), list(mean)))

colnames(Hours) <- gsub("_1","", colnames(Hours))

write.csv(Hours,"C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\Nuevos Excel Corregidos por días no válidos\\14 marzo-3 mayo\\3000_4000 (14marzo-3mayo)_intervalo_hora_promedio.csv", row.names=FALSE)
