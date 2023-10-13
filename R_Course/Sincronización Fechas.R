library(tidyverse)
library(datarium)
library(dplyr)
library(ggnewscale)

data1_3000 <- Fechas_3000 %>% filter(date %in% Fechas_4000$date) %>% print()

 new_dataF <- merge(data1_3000, Fechas_4000, by= "date") 
 
 new_data <- new_dataF[-c(1:6527,18398:19794,9727:10673),] %>% na.omit() %>%  print()
 
 
 write.csv(new_data, "C:\\Users\\gabri\\OneDrive\\Documentos\\Universidad\\Ejemplo.csv", row.names=FALSE)

 



