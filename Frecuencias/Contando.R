# Contando, por un desconocimiento de filtrar datos realizamos este codigo para contar
# Spanish cluster cases: number of cases in clusters composed exclusively by Spanish

Baps <- 15
Contando <- Sp_in_spcluster_NA %>% filter(Genotipo == Baps)
Contando2 <- cbind( Freq=table(Contando$cluster10snps, Contando$Spain))

write.csv(Contando2, file = "contando2")

rm(Baps, Contando, Contando2)
