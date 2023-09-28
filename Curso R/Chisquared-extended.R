library(tidyverse)
library(patchwork)


flowers <- iris %>% 
  mutate(Size= cut(Sepal.Length,
                   breaks= 3,
                   labels= c("Small","Medium","Large"))) %>% 
  select(Species, Size)

table(flowers)

# Chi squared goodness of fit test
# Is there a difference in the proportions of sizes?

table(flowers$Size)

flowers %>% 
  select(Size) %>% 
  table() %>% 
  chisq.test()

# Chi squared test of independence

chisq.test(table(flowers))

# fishers exact test if > 20% of expected values are < 5 or all are if any values of <5 in a 2 X 2


my_test <- flowers %>% 
  table() %>% 
  chisq.test()

attributes(my_test)

my_test$expected

