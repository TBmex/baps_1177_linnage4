
#Referencia se va cambiando el numero de genotipo para poder calcular los casos en clusters: Mix, Sp, For & Na 
Uno <- Spanis_cluster_cases %>% filter(Genotipo == 16)

Uno <- Uno %>%
  mutate(Extranjero = ifelse(Extranjero == "No",2,1))

##Sumar aislados por cluster
Aislados_por_cluster <- Uno %>% group_by(Cluster_10) %>% summarise(sum(n))

#Cuento numero de casos only_sp & only_foreing & NA

Dos <- Uno %>% group_by(Cluster_10) %>% summarise(sum(Extranjero))

Mix <- Dos %>% filter(`sum(Extranjero)` == 3)
Mix <- Mix %>% inner_join(Aislados_por_cluster)

Sp <- Dos %>% filter(`sum(Extranjero)` == 2)
Sp <- Sp %>% inner_join(Aislados_por_cluster)
 
For <- Dos %>% filter(`sum(Extranjero)` == 1) 
For <- For %>% inner_join(Aislados_por_cluster)

Na <- Dos %>% filter(is.na(`sum(Extranjero)`))
Na <- Na %>% inner_join(Aislados_por_cluster)

colSums(Mix[,3])
colSums(Sp[,3])
colSums(For[,3])
colSums(Na[,3])

rm(Dos, Mix, For, Sp, Na)

Tabla_only_cases_cluster <- New_Frecuencias %>% select(Genotipo, N_incluster) %>%
  mutate(Spanish_cluster_cases = c(19,30,15,13,23,4,18,35,17,15,0,0,0,0,2,0),
         Foreing_cluster_cases = c(2,7,8,4,0,9,0,3,2,9,0,0,0,0,0,2),
         Mixes_cluster_cases = c(32,37,18,5,0,12,31,24,6,9,8,0,7,2,0,0),
         Na_cluster_cases = c(6,44,2,7,8,36,0,7,8,21,2,2,0,14,6,9))
#Comprobacion = Spanish_cluster_cases + Foreing_cluster_cases + Mixes_cluster_cases + Na_cluster_cases)