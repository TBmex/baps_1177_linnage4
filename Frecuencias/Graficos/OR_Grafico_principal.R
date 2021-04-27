# Calculo de OR del grafico principal agrupado en Genotipos
#N_sp_incluster_x (x) = Proporcion de "Sp_incluster" en relacion a "N_incluster"
#extranjeros_totaldecasos_x (y) = Proporcion de "No_sp" en relacion a "N"
library(tidyverse)

Genotipos_Españoles_N <- Genotipos_3_grupos_N %>%
  filter(Genotipo %in% c(5,9,7,8,15,4,1)) %>%
  select(-Genotipo) %>% summarise_all(funs(mean))

Genotipos_mixtos_N <- Genotipos_3_grupos_N %>%
  filter(Genotipo %in% c(2,3,10,6,14,12)) %>%
  select(-Genotipo) %>% summarise_all(funs(mean))

Genotipos_NO_Españoles_N <- Genotipos_3_grupos_N %>%
  filter(Genotipo %in% c(13, 11, 16)) %>%
  select(-Genotipo) %>% summarise_all(funs(mean))

#Genotipos_mixtos_mas_NO_Españoles_N <- Transmission %>%
  #filter(Genotipo %in% c(2,3,10,6,14,12,13,11,16)) %>%
  #select(-Genotipo) %>% summarise_all(funs(sum))

# Tabla y subset de genotipos Genotipos_Españoles, Genotipos_mixtos, Genotipos_NO_Españoles
Genotipos_3_grupos_N_N <- bind_rows(Genotipos_Españoles_N, Genotipos_mixtos_N, Genotipos_NO_Españoles_N) %>%
  mutate(Genotipos = c("Genotipos_Españoles", "Genotipos_mixtos", "Genotipos_NO_Españoles"), 
                       N_sp_incluster_x = N_sp_incluster_x * 100, 
                       extranjeros_totaldecasos_x = extranjeros_totaldecasos_x *100) %>% select(Genotipos, N_sp_incluster_x, extranjeros_totaldecasos_x)

Gen_RefGen <- Genotipos_3_grupos_N_N[c(1,3),c(2,3)]
chisq.test(Gen_RefGen, simulate.p.value = TRUE)
fisher.test(Gen_RefGen)

Subset_N <- Genotipos_3_grupos_N_N %>% 
  mutate(Xsquared = c("7.627", "reference",NA),
  pvalue = c("0.006997","reference",NA))

Subset_N2 <- Genotipos_3_grupos_N_N %>% 
  mutate(Xsquared = c("44.875", NA, "reference"),
         pvalue = c("0.0004998",NA, "reference"))
