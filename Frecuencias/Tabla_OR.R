# Generamos tabla
library(dplyr)

Transmission_in_Spanish <- N_mayor_20_Sp_x_mayor_0.5 %>%
  select(Genotipo, N_incluster, N, Sp_incluster, Spanish_cluster_cases, NClustercasesSpanishclustercases)

# Calculos
x_OR <- Transmission_in_Spanish$Spanish_cluster_cases
y_OR <- Transmission_in_Spanish$NClustercasesSpanishclustercases

#Make the matrix for OR
matrix_genotipos <- matrix(c(x_OR, y_OR), nrow = 8)
Columnas <- c("Spanish_cluster_cases", "NClustercasesSpanishclustercases")
Filas <- c("Baps_01", "Baps_02","Baps_04","Baps_05","Baps_07","Baps_08","Baps_09","Baps_15")
colnames(matrix_genotipos) <- Columnas
rownames(matrix_genotipos) <- Filas

# Mariana, en este caso, se define la matriz primero y puedes ver el orden; la referencia se pone debajo. Te paso un paper para que hagas el ejemplo que dan y veas la interpretación. 
# Veamos para elegir las filas de la matrix hacemos asi: [c(Genotipo, Genotipo de referencia),]
#Gen_RefGen <- matrix_genotipos[c(5,1),]

#Mariana
#     sp_cl
#baps si no
#B3   45 61
#B8    5 16

#Carlos
#matrix_genotipos[c(1,8),]
#Spanish_cluster_cases NClustercasesSpanishclustercases
#Baps_01                     7                               52
#Baps_15                     2                                6

# luego de la matriz se hace el fisher, que puedo hacer a 2 colas o solo a greater
# Como ves el odd.ratio es mayor a 1, pero además de los valores originales surge que hay más casos en cluster de españoles para el B3 que para el B8, entonces se puede probar la opción de una cola "greater"

Gen_RefGen <- matrix_genotipos[c(8,1),]
fisher.test(Gen_RefGen)
fisher.test(Gen_RefGen, alternative = "greater")


#No tengo idea de como automatizar esto lo haremos asi contruimos un vector y lo asignamos a una nueva columna.


Transmission_in_Spanish_ref1 <- Transmission_in_Spanish %>% 
  mutate(pvalue_two_sided = c("reference", 0.1505, 0.01981, 0.0002373, 0.002881, 3.598e-06 ,0.007618, 0.2912 ), 
         pvalue_one_sided = c("reference", 0.0925, 0.01417, 0.0002205, 0.002288, 1.922e-06 ,0.006622, 0.2912),
         Baps_I = c("BAPS_03", "BAPS_03", "BAPS_08", "BAPS_06", "BAPS_07", "BAPS_09", "BAPS_11", "BAPS_02"))

#Transmission_in_Spanish_ref2 <- Transmission_in_Spanish %>% 
#  mutate(pvalue_two_sided = c( 0.1505, "reference", 0.148, 0.005309 , 0.05113, 4.389e-05, 0.1071, 0.68 ), 
#         pvalue_one_sided = c(0.9613 , "reference", 0.1054, 0.003248, 0.03055, 3.384e-05, 0.06191, 0.5436 ))

#Transmission_in_Spanish_ref15 <- Transmission_in_Spanish %>% 
#  mutate(pvalue_two_sided = c( 0.2912, 0.68, 1, 0.426, 0.6993, 0.2655, 0.6925, "reference"), 
#         pvalue_one_sided = c(0.9322, 0.7695, 0.4802, 0.2173, 0.4153, 0.1579, 0.4353,"reference"))
