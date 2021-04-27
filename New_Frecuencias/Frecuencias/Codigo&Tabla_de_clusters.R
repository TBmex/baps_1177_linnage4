#Codigo para calcular Tabla de clusters
Spanis_cluster_cases <- Pre_frecuencias %>% group_by(Genotipo, Cluster_10) %>% 
  filter(In_cluster == "Si") %>% count(Extranjero)

Uno <- Spanis_cluster_cases %>% filter(Genotipo == 1)

Uno <- Uno %>%
  mutate(Extranjero = ifelse(Extranjero == "No",2,1))

#Cuento clusters 2 = Spain, 1 = Foreing 3 = Mixto
Uno %>% group_by(Cluster_10) %>% summarise(sum(Extranjero)) %>% count(`sum(Extranjero)`)


Tabla_Clusters <- New_Frecuencias %>% select(Genotipo) %>%
  mutate(Mix = c(9,13,4,2,0,3,7,5,2,4,2,0,3,1,0,0),
         Sp = c(4,8,7,4,5,2,4,14,5,5,0,0,0,0,1,0),
         For = c(1,3,3,2,0,3,0,1,1,2,0,0,0,0,0,1),
         Na = c(1,11,1,3,2,4,0,3,2,4,1,1,0,4,2,2),
         Total = Mix + Sp + For + Na)

Tabla_Clusters 




#Contruyendo grafico de Only_spain_clusters

#Obtenemos only spain clusters por genotipo
Dos <- Spanis_cluster_cases
Dos <- Dos %>% mutate(Extranjero = ifelse(Extranjero == "No",2,1))
Dos <- Dos %>% group_by(Cluster_10) %>% summarise(sum(Extranjero))
Dos <- Dos %>% filter(`sum(Extranjero)` == 2)

x <- Spanis_cluster_cases %>% summarise(sum(n))
x <- rename(x, Total = "sum(n)")
x <- x %>% mutate(fGenotipo = factor(Genotipo))

only_spain_clusters <- Dos %>% inner_join(x)

# Update the plot
ggplot(only_spain_clusters, aes(x = fGenotipo, y = Total, color = fGenotipo)) +
  geom_dotplot(dotsize = 0.4, binaxis='y', stackdir='center') +
  stat_summary(fun.data="mean_sdl", fun.args = list(mult=1), 
               geom="crossbar", width=0.5) +
  labs(x = "Genotipo", y = "Numero de aislados") +
  theme(legend.position="none")

rm(Dos,x)