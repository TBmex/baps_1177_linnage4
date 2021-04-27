#Tabla de Sebastian

Tabla_Sebastian <- Transmission %>% select(Genotipo, N, N_incluster) %>%
  mutate(N_NO_incluster = N - N_incluster)

Genotipos_Españoles_S <- Tabla_Sebastian %>%  
  filter(Genotipo %in% c(5,9,7,8,15,4,1)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

Genotipos_mixtos_S <- Tabla_Sebastian %>%  
  filter(Genotipo %in% c(2,3,10,6,14,12)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

Genotipos_NO_Españoles_S <- Tabla_Sebastian %>%  
  filter(Genotipo %in% c(13, 11, 16)) %>%
  select(-Genotipo) %>% summarise_all(funs(sum))

# Tabla y subset de genotipos Genotipos_Españoles, Genotipos_mixtos, Genotipos_NO_Españoles
Genotipos_3_grupos_S <- bind_rows(Genotipos_Españoles_S, Genotipos_mixtos_S, Genotipos_NO_Españoles_S) %>%
  mutate(Genotipos = c("Genotipos_Españoles", "Genotipos_mixtos", "Genotipos_NO_Españoles")) %>%
  select(Genotipos, N, N_incluster, N_NO_incluster)

write_csv(Genotipos_3_grupos_S, file = "Genotipos_3_grupos_S")

Gen_RefGen <- Genotipos_3_grupos_S[c(1,2),c(3,4)]
fisher.test(Gen_RefGen)

Subset <- Subset %>% 
  mutate(odds_ratio = c(Genotipos_3_grupos_OR[["estimate"]], "reference", NA), 
         conf.low = c(Genotipos_3_grupos_OR[["conf.int"]][[1]],"reference", NA),
         conf.high = c(Genotipos_3_grupos_OR[["conf.int"]][[2]],"reference", NA),
         pvalue = c(Genotipos_3_grupos_OR[["p.value"]],"reference", NA))

fisher.test(Gen_RefGen, alternative = "greater")