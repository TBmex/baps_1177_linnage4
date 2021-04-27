#Comprobamos genotipos españoles y extranjeros
library(tidyverse)

#Renombramos pata poder hacer join por ID
x1 <- rename(x1_1869y1683_modificados, ID = Sample)

#Generamos tablas para cada Genotipo.

#Gen1 <- x3 %>% filter(Genotipo == 1 )
#Gen2<- x3 %>% filter(Genotipo == 2)
#Gen3 <- x3 %>% filter(Genotipo == 3)
#Gen4 <- x3 %>% filter(Genotipo == 4)
#Gen5 <- x3 %>% filter(Genotipo == 5)
#Gen6 <- x3 %>% filter(Genotipo == 6)
#Gen7 <- x3 %>% filter(Genotipo == 7)
#Gen8 <- x3 %>% filter(Genotipo == 8)
#Gen9 <- x3 %>% filter(Genotipo == 9)
#Gen10 <- x3 %>% filter(Genotipo == 10)
#Gen11 <- x3 %>% filter(Genotipo == 11)
#Gen12 <- x3 %>% filter(Genotipo == 12)
#Gen13 <- x3 %>% filter(Genotipo == 13)
#Gen14 <- x3 %>% filter(Genotipo == 14)
#Gen15 <- x3 %>% filter(Genotipo == 15)
#Gen16 <- x3 %>% filter(Genotipo == 16)

#Filtramos los extranjero con NA y los buscamos en la tablas Allyears & FISABIO

extranjeros.is.na <- x3 %>% filter(is.na(Extranjero))
extranjerosisna_join_DBFISABIO <- inner_join(extranjeros.is.na, DB_FISABIO, by = "ID")
extranjerosisna_join_DBFISABIO_SELECT <- extranjerosisna_join_DBFISABIO %>% select(ID, Genotipo, Spain, SIP)

#Encontramos dos incongruencias muestras 1869 y 1638, las muestras 95 y 1474 se cuentan como perdidas.
SIPs_incongruentes <- inner_join(extranjerosisna_join_DBFISABIO_SELECT, Allyears_one_table_csv)

inner_join(ID_Gen_Spa_2, x1, by = "ID")
anti_join(ID_Gen_Spa_2, x1, by = "ID")
