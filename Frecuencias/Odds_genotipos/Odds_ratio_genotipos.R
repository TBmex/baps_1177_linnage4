# Obtener OR de variables epidemiologicas para descartar falacias estadisticas.
library(tidyverse)

# Generamos tablas separadas de cada genotipo,  partiendo de la tabla ID_Genotipo_Spain_Cluster.

Gen_2 <- filter(ID_Genotipo_Spain_Cluster, Genotipo == 2)
Gen_5 <- filter(ID_Genotipo_Spain_Cluster, Genotipo == 5)
Gen_7 <- filter(ID_Genotipo_Spain_Cluster, Genotipo == 7)
Gen_8 <- filter(ID_Genotipo_Spain_Cluster, Genotipo == 8)
Gen_9 <- filter(ID_Genotipo_Spain_Cluster, Genotipo == 9)

#Obtenemos la svariables de interes EPI de la tabla x1

Variables_EPI <- select(x1, Sample, Sexo, Alcoholismo:Marginado.a, Transeunte:Residencia.Ancianos, Phylogeny)
Variables_EPI <-rename(Variables_EPI, ID = Sample)

# Hacemos joins, estas tablas eran para observar variables epidemiologicas asociadas a los genotipos pero no habia nada. 

Tablagen2 <- Gen_2 %>% left_join(Variables_EPI)
Tablagen5 <- Gen_5 %>% left_join(Variables_EPI)
Tablagen8 <- Gen_8 %>% left_join(Variables_EPI)
