
library(tidyverse)

#Renombramos "Sample" por "ID" en tabla x1
#x1 <- rename(x1_1869y1683_modificados, ID = Sample)

#Buscamos todas las filas que tengan en comun las dos tablas.
x2 <- left_join(ID_Gen_Spa_2, x1, by = "ID")

#Filtramos las variables de interes en un nuevo subset
x3 <- x2 %>% select(ID, Genotipo, Extranjero, Cluster_10)
Pre_frecuencias <- x3 %>% mutate(In_cluster = ifelse(!is.na(Cluster_10), "Si", "No"))

#Obtenemos las frecuencias de Sp, For & No_data
Freq_Extranjeros <- Pre_frecuencias %>% group_by(Genotipo) %>% count(Extranjero)
#Filtramos Sp, For & No_data
b <- Freq_Extranjeros %>% filter(Extranjero == "No")
b <- Freq_Extranjeros %>% filter(Extranjero == "Si") 
b <- Freq_Extranjeros %>% filter(is.na(Extranjero))

#Obtenemos N_incluster
Freq_In_cluster <- Pre_frecuencias %>% group_by(Genotipo) %>% count(In_cluster)
#Filtramos los que estan en cluster
b <- Freq_In_cluster %>% filter(In_cluster == "Si")


#Obtenemos Sp_incluster & Sp_nocluster
Freq_Sp_incluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(Extranjero == "No",In_cluster == "Si") %>% count(In_cluster)
Freq_Sp_incluster$n
Freq_Sp_nocluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(Extranjero == "No",In_cluster == "No") %>% count(In_cluster)
Freq_Sp_nocluster$n

#Obtenemos For_incluster & For_nocluster
Freq_For_incluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(Extranjero == "Si",In_cluster == "Si") %>% count(In_cluster)
Freq_For_incluster$n
Freq_For_nocluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(Extranjero == "Si",In_cluster == "No") %>% count(In_cluster)
Freq_For_nocluster$n

Freq_NA_incluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(is.na(Extranjero), In_cluster == "Si") %>% count(In_cluster)
Freq_NA_incluster$n
Freq_NA_nocluster <- Pre_frecuencias %>% group_by(Genotipo) %>% filter(is.na(Extranjero), In_cluster == "No") %>% count(In_cluster)
Freq_NA_nocluster$n

New_Frecuencias <- Pre_frecuencias %>% count(Genotipo) %>% rename(N = n)
New_Frecuencias <- New_Frecuencias %>% mutate(Sp = c(69,132,33,61,52,47,56,110,55,46,5,1,5,17,20,3),
                                              For = c(36,70,31,23,8,44,20,38,15,41,14,0,10,14,7,21),
                                              NA_ = c(4,16,2,5,6,7,3,3,5,9,2,1,0,4,3,3))
New_Frecuencias <- New_Frecuencias %>% 
  mutate(Sp_x = Sp * 1 / N,
  For_x = For * 1 /N,
  N_incluster = c(59,118,43,29,31,61,49,69,33,54,10,2,7,16,8,11),
  Sp_incluster = c(41,73,25,20,27,37,38,51,27,32,2,1,4,7,6,1),
  #Sp_nocluster = c(28,59,8,41,25,10,18,59,28,14,3,0,1,10,14,2),
  For_incluster = c(15,32,17,6,1,17,11,15,4,16,7,0,3,5,0,8),
  #For_nocluster = c(21,38,14,17,7,27,9,23,11,25,7,0,7,9,7,13),
  NA_incluster = c(3,13,1,3,3,7,0,3,2,6,1,1,0,4,2,2),
  #NA_nocluster = c(1,3,1,2,3,0,3,0,3,3,1,0,0,0,1,1)
  )

New_Frecuencias <- New_Frecuencias %>%
  mutate(Sp_incluster_x = Sp_incluster * 1 / N_incluster,
         For_incluster_x = For_incluster * 1 / N_incluster,
         NA_incluster_x = NA_incluster * 1 / N_incluster)
         
         
#Foreing_incluster_x = Proporcion de "Foreing_incluster" en relacion a "N_incluster"
#extranjeros_totaldecasos_x = Proporcion de "No_sp" en relacion a "N"

New_Frecuencias <- round (New_Frecuencias, 3)


rm(x1,x2,x3,b)
rm(Freq_Extranjeros, Freq_In_cluster,Freq_Sp_incluster,Freq_Sp_nocluster,Freq_For_incluster,Freq_For_nocluster,Freq_NA_incluster,Freq_NA_nocluster)