library(tidyverse)
library(scales)
library(datarium)
library(cowplot)
library(openair)

data0 <- timeAverage(Calibración, avg.time= "day") %>% print()

data1 <- Calibración %>% mutate(date=cut.POSIXt(Calibración$date, breaks="hour")) %>% select(date,
                                                                                             ScatRed3000,
                                                                                             ScatGreen3000,
                                                                                             ScatBlue3000) %>% print()

data2 <- data0 %>% group_by(date) %>% summarise("635 nm"=unique(ScatRed3000),
                                                "525 nm"=unique(ScatGreen3000),
                                                "450 nm"=unique(ScatBlue3000)) %>% print(n=890)


data3 <- data2 %>% mutate(date=as.POSIXct(data2$date)) %>% pivot_longer(c("635 nm","525 nm","450 nm"),
                                                                        names_to="Scat3000", values_to="Scat3000V") %>% print()


ggplot() +
  theme_bw() +
  geom_line(data=data3, aes(x=date, y=Scat3000V, colour=Scat3000), alpha=0.7,lwd=0.7) +
  scale_colour_manual("", values=c("blue","green","red")) +
  scale_x_datetime("", labels= date_format("%b %d"), breaks= date_breaks("5 days")) +
  labs(y=expression("Dispersión Aurora 3000 (Mm"^-1*")"), title="Dispersión Aurora 3000 vs Días") +
  theme(plot.title=element_text(hjust=0.5)) 

class(Calibración$date)
  



