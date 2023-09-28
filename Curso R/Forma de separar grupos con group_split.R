library(tidyverse)
library(datarium)
library(cowplot)

data1 <- Calibración %>% pivot_longer(c("ScatRed3000","ScatGreen3000","ScatBlue3000"),
                                      names_to="Scat3000", values_to="Scat3000V") %>% print()

data2 <- data1 %>% select(Scat3000,everything()) %>% print()

data3 <- data2 %>% group_by(Scat3000) %>% group_split() %>% print()

data3[[1]]

