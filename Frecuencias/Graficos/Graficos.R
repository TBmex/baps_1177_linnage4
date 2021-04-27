# Graficos
library(tidyverse)

### Grafico Sp_inclusters vs Sp_nocluster
#Españoles vs Españoles no estan en Cluster

Uno <- Frecuencias %>% select(Genotipo:Sp_incluster_x) %>%
  mutate(Sp_nocluster_x = 1 - Sp_incluster_x)

ggplot(Uno, aes(x=Sp_incluster, y=Sp_nocluster, label = rownames(Uno), group = Genotipo)) +
  geom_point(shape = 21, size = 3, color = "gray40", fill = c("#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a","#ffff99","#b15928","#a6cee3","#1f78b4","#b2df8a","#33a02c")) +
  ylab("Sp_nocluster") + xlab("Sp_incluster") +
  ggtitle("") +
  theme(plot.title=element_text(hjust = 0.5, size = 12)) +
  geom_text(vjust = c(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-2,-1,-0.5), hjust = c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,-1,0.5,0.5,0.5,0.5,0.5,0.5,-1), size = 3) +
  theme(axis.text=element_text(size=11),axis.title.x = element_text (size=14, margin = margin(t = 8, r = 0, b = 0, l = 0)),axis.title.y = element_text(size=14, margin = margin(t = 0, r = 5, b = 0, l = 0 )))

### Grafico Spanish_cluster_cases vs Foreign_cluster_cases
#Rehacer los calculos quitando los mixtos, clusterss solo españoles vs clusters solo extranjeros

# Spanish cluster cases: number of cases in clusters composed exclusively by Spanish
Transmission <- Frecuencias %>% select(Genotipo, N_incluster, N, Sp_incluster, NClustercasesSpanishclustercases)
Calculando = c(7, 25, 15, 10, 15, 4, 18, 35, 12, 15, 0, 0, 0, 3, 2, 0)
Calculando2 = c(2, 20, 10, 4, 0, 11, 0, 8, 2, 9, 8, 0, 0, 3, 0, 5)
Transmission <- cbind(Transmission, Spanish_cluster_cases = Calculando)
Transmission <- cbind(Transmission, Foreign_cluster_cases = Calculando2)
Transmission <- Transmission %>% mutate(Mixtos_cluster_cases = NClustercasesSpanishclustercases-Foreign_cluster_cases)
Transmission <- select(Transmission, -NClustercasesSpanishclustercases)

ggplot(Transmission, aes(x=Spanish_cluster_cases, y=Foreign_cluster_cases, label = rownames(Transmission), group = Genotipo)) +
  geom_point(shape = 21, size = 3, color = "gray40", fill = c("#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a","#ffff99","#b15928","#a6cee3","#1f78b4","#b2df8a","#33a02c")) +
  xlab("Spanish_cluster_cases") + ylab("Foreign_cluster_cases") +
  ggtitle("") +
  theme(plot.title=element_text(hjust = 0.5, size = 12)) +
  geom_text(vjust = c(-1,-1,-1,-1,-1,-1,-1,-2,-1,-1,-1,-1,-1,-2,-1,-0.5), hjust = c(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,-1,0.5,0.5,0.5,0.5,0.5,0.5,-1), size = 3) +
  theme(axis.text=element_text(size=11),axis.title.x = element_text (size=14, margin = margin(t = 8, r = 0, b = 0, l = 0)),axis.title.y = element_text(size=14, margin = margin(t = 0, r = 5, b = 0, l = 0 )))

Odds_ratio <- Transmission %>% select(Spanish_cluster_cases, Foreign_cluster_cases)

### OR y Grafico de ... 5 asociado fuertemente a españles vs genotipo 16
#Genotipo 5 en Españoles + alguna otra variable
#Genotipo 5 en no Españoles + alguna otra variable
#Dividir por cuadrantes agrupar
#Genotipos Españoles 5 9 7 8 15 4 1
#Genotipos mixtos 2 3 10 6 14 12
#Genotipos no Españoles 13 11 16

mutate(Transmission_in_Spanish_ref2, No_Spanish_cluster_cases = Foreign_cluster_cases + Mixtos_cluster_cases)


Genotipos_Españoles <- Transmission %>%
  filter(Genotipo %in% c(5,9,7,8,15,4,1)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

Genotipos_mixtos <- Transmission %>%
  filter(Genotipo %in% c(2,3,10,6,14,12)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

Genotipos_NO_Españoles <- Transmission %>%
  filter(Genotipo %in% c(13, 11, 16)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

Genotipos_mixtos_mas_NO_Españoles <- Transmission %>%
  filter(Genotipo %in% c(2,3,10,6,14,12,13,11,16)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

# Tabla y subset de genotipos Genotipos_Españoles, Genotipos_mixtos, Genotipos_NO_Españoles
Genotipos_3_grupos <- bind_rows(Genotipos_Españoles, Genotipos_mixtos, Genotipos_NO_Españoles) %>%
  mutate(NO_Spanish_cluster_cases = Foreign_cluster_cases + Mixtos_cluster_cases, Genotipos = c("Genotipos_Españoles", "Genotipos_mixtos", "Genotipos_NO_Españoles"))

Subset <- Genotipos_3_grupos %>% select(Genotipos, Spanish_cluster_cases, NO_Spanish_cluster_cases)

Gen_RefGen <- Subset[c(1,2),c(2,3)]
Genotipos_3_grupos_OR <- fisher.test(Gen_RefGen)

Subset <- Subset %>%
  mutate(odds_ratio = c(Genotipos_3_grupos_OR[["estimate"]], "reference", NA),
         conf.low = c(Genotipos_3_grupos_OR[["conf.int"]][[1]],"reference", NA),
         conf.high = c(Genotipos_3_grupos_OR[["conf.int"]][[2]],"reference", NA),
         pvalue = c(Genotipos_3_grupos_OR[["p.value"]],"reference", NA))


# Tabla y subset de genotipos Genotipos_Españoles, Genotipos_mixtos_mas_NO_Españoles
Genotipos_2_grupos <- bind_rows(Genotipos_Españoles, Genotipos_mixtos_mas_NO_Españoles) %>%
  mutate(NO_Spanish_cluster_cases = Foreign_cluster_cases + Mixtos_cluster_cases, Genotipos = c("Genotipos_Españoles", "Genotipos_mixtos_mas_NO_Españoles"))

Subset2.0 <- Genotipos_2_grupos %>% select(Genotipos, Spanish_cluster_cases, NO_Spanish_cluster_cases)

Gen_RefGen <- Subset[c(1,3),c(2,3)]
Genotipos_3_grupos_OR2.0 <- fisher.test(Gen_RefGen)

Subset_OR2.0 <- Subset %>%
  mutate(odds_ratio = c(Genotipos_3_grupos_OR2.0[["estimate"]], NA, "reference"),
         conf.low = c(Genotipos_3_grupos_OR2.0[["conf.int"]][[1]],NA, "reference"),
         conf.high = c(Genotipos_3_grupos_OR2.0[["conf.int"]][[2]],NA, "reference"),
         pvalue = c(Genotipos_3_grupos_OR2.0[["p.value"]],NA, "reference"))

#Para cada uno de los Genotipos
#clusters puros de españoles cual es el tamaño medio del cluster media y mediana de solo clsuertes puros
#Tamaño medio con percentiles plot
