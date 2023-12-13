library(tidyverse)
library(nortest)
library(cowplot)
library(datarium)
library(scales)

data1 <- left_join(Calibración1, Calibración2, by=c("date"="date")) %>% 
  drop_na()

View(data1)

data2 <- data1 %>%  mutate(date= as.factor(cut.POSIXt(data1$date, breaks="hour"))) %>% 
  group_by(date) %>% summarise(across(everything(), list(mean))) 

View(data2)

colnames(data2) <-  gsub("_1","",colnames(data2))

View(data2)                             

write.csv(data2, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Trabajo Fin De Grado\\Archivos Excel\\Nuevos Excel Corregidos por días no válidos\\3000_4000 (7e-22f)_intervalo_horas_promedio.csv", row.names=FALSE)

