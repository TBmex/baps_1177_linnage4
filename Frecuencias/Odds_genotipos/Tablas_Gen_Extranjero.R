# Comprobar NAs en nuestro data frame y averiguar si afecta a spains
library(tidyverse)
library(GGally)

#Corregimos el error de tener "m",o cosas despues de G000m, G000FE, etc...

#Fake
x2 <- inner_join(ID_Gen_Spa, x1, by = "ID")
x3 <- x2 %>% select(ID, Genotipo, Spain, Extranjero, País.Nacimiento, Cluster_10)
Gen8_x3 <- x3 %>% filter(Genotipo == 8)

#Fake2
x2 <- inner_join(ID_Gen_Spa_2, x1, by = "ID")
x3 <- x2 %>% select(ID, Genotipo, Spain, Extranjero, País.Nacimiento, Cluster_10)


Gen1 <- x3 %>% filter(Genotipo == 1 )
Gen2<- x3 %>% filter(Genotipo == 2)
Gen3 <- x3 %>% filter(Genotipo == 3)
Gen4 <- x3 %>% filter(Genotipo == 4)
Gen5 <- x3 %>% filter(Genotipo == 5)
Gen6 <- x3 %>% filter(Genotipo == 6)
Gen7 <- x3 %>% filter(Genotipo == 7)
Gen8 <- x3 %>% filter(Genotipo == 8)
Gen9 <- x3 %>% filter(Genotipo == 9)
Gen10 <- x3 %>% filter(Genotipo == 10)
Gen11 <- x3 %>% filter(Genotipo == 11)
Gen12 <- x3 %>% filter(Genotipo == 12)
Gen13 <- x3 %>% filter(Genotipo == 13)
Gen14 <- x3 %>% filter(Genotipo == 14)
Gen15 <- x3 %>% filter(Genotipo == 15)
Gen16 <- x3 %>% filter(Genotipo == 16)

inner_join(ID_Gen_Spa_2, x1, by = "ID")
anti_join(ID_Gen_Spa_2, x1, by = "ID")

#Probando GGally
Gen_Grafico <- x3 %>% select(-ID, -País.Nacimiento, -Cluster_10)
ggpairs(Gen_Grafico, mapping = aes(colour = Extranjero))