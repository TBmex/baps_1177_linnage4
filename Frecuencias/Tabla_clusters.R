## Tabla de clusters
library(dplyr)

#Calculamos a mano las siguientes columnas.

# Total_clusters, calculamos ese dato
Total_clusters <- c(14, 27, 9, 7, 11, 20, 9, 3)

# Mixed_clusters, calculamos ese dato
Mixed_clusters <- c(12, 19, 6, 3, 7, 6, 5, 2)

#Spanish_clusters, calculamos ese dato
Spanish_clusters2.0 <- c(2, 8, 3, 4, 4, 14, 4, 1)

## Hacemos un subset de la tabla de Frecuencias filtradas
Tabla_de_clusters <- N_mayor_20_Sp_x_mayor_0.5 %>%
  select(Genotipo, N_incluster, N, Sp_incluster, Spanish_cluster_cases)

## Agreganmos las columnas
Tabla_de_clusters <- Tabla_de_clusters %>% mutate(Spanish_clusters2.0, Mixed_clusters, Total_clusters)

## Exportamos
write.csv(Tabla_de_clusters, file = "Tabla_de_clusters")
