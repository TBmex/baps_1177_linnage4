## Realizar tablas de valores de Rhierbaps & Baps
  
# Data cambiamos variables valor de X dependiendo lo que quiero obtener
x <- Fastbaps_lvl2
y <- Fastbaps_lvl2$Genotipo
    
# Obtenemos tabla de frecuencias
#cbind( Freq=table(x), Cumul=cumsum(table(x)), relative=prop.table(table(x)))
Freq <- cbind( Freq=table(y))
  
# Realizamos merge de Frecuencias con españoles
ID_Genotipo_Spain <- merge (x, Spain, by = "ID", all.x=TRUE)
Genotipo_Spain <- ID_Genotipo_Spain [c(2,3)]
  
# Obtenemos numero de españoles por genotipo
Freq_spain <- table(Genotipo_Spain)
Freq_spain <- as.data.frame.matrix (Freq_spain)
  
# Juntamos frecuencias
Frecuencias <- cbind.data.frame (Freq, Freq_spain)
write.csv(Frecuencias, "Frecuencias")
  
# Agregamos Cluster (en proceso)
ID_Genotipo_Spain_Cluster <- merge (ID_Genotipo_Spain, Clusters_10snps, by = "ID", all.x=TRUE)
Genotipo_Cluster <- ID_Genotipo_Spain_Cluster [c(2,4)]
write.csv(ID_Genotipo_Spain_Cluster, "ID_Genotipo_Spain_Cluster")
  
# Borramos archivos intermedios
rm (x, y, Freq, Freq_spain, ID_Genotipo_Spain, Genotipo_Cluster, Genotipo_Spain)