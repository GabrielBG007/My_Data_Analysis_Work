library(tidyverse)
library(scales)
library(ggnewscale)


data1 <- Humedad4000 %>% select(date, RH4000="RH 4000") %>% print()


ggplot() +
  theme_bw() +
  geom_line(data=Humedad3000, aes(x=date, y= RH3000, colour="RH3000"), lwd=1) +
  scale_colour_manual("", breaks="RH3000", values="darkblue") +
  ggnewscale::new_scale_colour() +
  geom_line(data=data1, aes(x=date, y= RH4000, colour="RH4000"), lwd=1) +
  scale_colour_manual("", breaks="RH4000", values="lightblue") +
  labs(x="", y="RH3000 y RH4000 (%)", title="Humedad Aurora 3000 VS Humedad Aurora 4000") +
  scale_x_datetime("", labels= date_format("%b %d"), breaks= date_breaks("5 days")) +
  theme(plot.title=element_text(hjust=0.5))
