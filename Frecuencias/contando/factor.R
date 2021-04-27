# Media y mediana de clusters españoles puros
#Para cada uno de los Genotipos
#Cual es el tamaño medio del cluster media y mediana
#Tamaño medio con percentiles plot
library(tidyverse)
library(Hmisc)

only_spain <- clusters %>%
  filter(V5 == "", V6 == "Spain", V7 == "") %>% 
  select(V1,V2,V3) %>% mutate(fV1 = factor(V1))

# Update the plot
ggplot(only_spain, aes(x = fV1, y = V3, color = fV1)) +
  geom_dotplot(dotsize = 0.4, binaxis='y', stackdir='center') +
  stat_summary(fun.data="mean_sdl", fun.args = list(mult=1), 
               geom="crossbar", width=0.5) +
  labs(x = "Genotipo", y = "Numero de aislados") +
  theme(legend.position="none")