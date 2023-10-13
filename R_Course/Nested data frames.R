library(tidymodels)
library(tidyverse)

glimpse(penguins)


penguins_nested <- penguins %>% group_by(species) %>% nest()

View(penguins_nested)

View(penguins_nested$data[[1]])

penguins_lm <- function(df){lm(bill_length_mm~bill_depth_mm, data=df)}

penguins_nested <- penguins_nested %>% mutate(model= map(data, penguins_lm),
                                              model_tidy=map(model,tidy),
                                              model_glance=map(model,glance))

View(penguins_nested$model_glance[[1]])

penguins_g <- penguins_nested %>% unnest(model_glance)


View(penguins_m)


# Let's get a plot showing the linear models in the 3 groups

penguins_wider <- penguins_m %>% pivot_wider(names_from=term,values_from=estimate:model_glance)


View(penguins_wider)


ggplot() +
  theme_bw() +
  geom_point(data=penguins,
             aes(x=bill_depth_mm,
                 y=bill_length_mm,
                 color=species)) +
  geom_abline(data=penguins_wider, aes(slope=estimate_bill_depth_mm,
                                      intercept= `estimate_(Intercept)`,
                                      color=species)) +
  scale_color_brewer(palette="Dark2")
