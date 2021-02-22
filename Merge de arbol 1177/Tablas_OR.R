#Adecuamos a tabla de Mariana
## Libreria
library(tidyverse)

#Tabla_Mariana <- Frecuencias[,c(1,9,2,6)]
#Sp_in_spcluster_NA

#Filtramos
Sp_in_spcluster <- filter(Sp_in_spcluster_NA, Genotipo == 1)
Sp_in_spcluster <- Sp_in_spcluster[2:3]


filter(Sp_in_spcluster, cluster10snps != "x" & Spain == "Spain")
Sp_in_spcluster %>% mutate(cond = case_when(Spain == "Spain" & cluster10snps != "x" ~ 1))