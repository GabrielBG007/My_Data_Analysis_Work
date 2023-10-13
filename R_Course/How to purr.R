library(tidyverse)

map(1:5,sqrt)

map_dbl(1:5,sqrt)

View(faithful)

faithful_chr <- faithful %>% map_df(as.character)

glimpse(faithful_chr)


#Convertimos los minutos de la columna de erupción y waiting a segundo aplicando una fórmula primero

min_to_sec <- function(x){x*60}

faithful_sec <- faithful %>% 
  map_df(min_to_sec)

glimpse(faithful_sec)


# additional arguments

means <- c(1,10,20,50)

map(means,rnorm,n=5)


#multiple iterations

sds <- c(.1,1,3,5)

map2(means,sds,\(m,s) rnorm(5,m))


# If you want all the combinations , use expand_grid

expand_grid(means,sds)
