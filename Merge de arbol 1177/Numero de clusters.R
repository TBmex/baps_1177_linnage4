# Agregamos numeeros de cluster totales, españoles, mixtos y no españoles
library(dplyr)
z <- "1" 

Genotipo_n_spain <- ID_Genotipo_Spain_Cluster [c(2,3,4)]
Genotipo_n_spain <- filter(Genotipo_n_spain, Genotipo == z)
Genotipo_n_spain <- na.omit(Genotipo_n_spain)
Genotipo_n_spain <- factor (Genotipo_n_spain$cluster10snps)
Genotipo_n_spain <- cbind( Freq=table(Genotipo_n_spain))
Genotipo_n_spain <- as.data.frame(Genotipo_n_spain)

Genotipo_n <- ID_Genotipo_Spain_Cluster [c(2,4)]
Genotipo_n <- filter(Genotipo_n, Genotipo == z)
Genotipo_n <- na.omit(Genotipo_n)
Genotipo_n <- factor (Genotipo_n$cluster10snps)
Genotipo_n <- cbind( Freq=table(Genotipo_n))
Genotipo_n <- as.data.frame(Genotipo_n)

rm (z)