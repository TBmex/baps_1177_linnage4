#Chi cuadrada

Sp_incluster <- c(74,5,16,37,13,30,19,22)
Sp_in_sp <- c(45,3,9,13,5,22,11,18)

matrixx <- matrix(c(Sp_incluster, Sp_in_sp), nrow = 8)

# Vectors region and titles, used for naming
Columnas <- c("Sp in cluster", "Sp in Sp cluster")
Filas <- c("Baps03","Baps04","Baps06","Baps07","Baps08","Baps09","Baps10","Baps11")

colnames(matrixx) <- Columnas
rownames(matrixx) <- Filas

# Print out
matrixx <- matrixx[c(1,4),1:2]
matrixx

matrixx <- matrix(c(37,74,13,45), nrow =2)
matrixx

chisq.test(matrixx)
fisher.test(matrixx, simulate.p.value=TRUE)