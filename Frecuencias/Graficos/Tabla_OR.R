# Generamos tabla
library(dplyr)

Gen_RefGen <- Odds_ratio[c(16,2),]
B16 <- fisher.test(Gen_RefGen)
#fisher.test(Gen_RefGen, alternative = "greater")

Transmission_in_Spanish_ref2 <- Transmission %>% 
  mutate(odds_ratio = c(B1[["estimate"]], "reference", B3[["estimate"]],B4[["estimate"]],
                        B5[["estimate"]],B6[["estimate"]],B7[["estimate"]],B8[["estimate"]],
                        B9[["estimate"]],B10[["estimate"]],B11[["estimate"]],B12[["estimate"]],
                        B13[["estimate"]],B14[["estimate"]],B15[["estimate"]],B16[["estimate"]]),
         conf.low = c(B1[["conf.int"]][[1]],"reference",B3[["conf.int"]][[1]],B4[["conf.int"]][[1]],
                      B5[["conf.int"]][[1]],B6[["conf.int"]][[1]],B7[["conf.int"]][[1]],B8[["conf.int"]][[1]],
                      B9[["conf.int"]][[1]],B10[["conf.int"]][[1]],B11[["conf.int"]][[1]],B12[["conf.int"]][[1]],
                      B13[["conf.int"]][[1]],B14[["conf.int"]][[1]],B15[["conf.int"]][[1]],B16[["conf.int"]][[1]]),
         conf.high = c(B1[["conf.int"]][[2]],"reference",B3[["conf.int"]][[2]],B4[["conf.int"]][[2]],
                      B5[["conf.int"]][[2]],B6[["conf.int"]][[2]],B7[["conf.int"]][[2]],B8[["conf.int"]][[2]],
                      B9[["conf.int"]][[2]],B10[["conf.int"]][[2]],B11[["conf.int"]][[2]],B12[["conf.int"]][[2]],
                      B13[["conf.int"]][[2]],B14[["conf.int"]][[2]],B15[["conf.int"]][[2]],B16[["conf.int"]][[2]]),
         pvalue = c(B1[["p.value"]],"reference",B3[["p.value"]],B4[["p.value"]],
                    B5[["p.value"]],B6[["p.value"]],B7[["p.value"]],B8[["p.value"]],
                    B9[["p.value"]],B10[["p.value"]],B11[["p.value"]],B12[["p.value"]],
                    B13[["p.value"]],B14[["p.value"]],B15[["p.value"]],B16[["p.value"]]))


##Creamos csv
write.csv(Transmission_in_Spanish_ref2, file = "Transmission_in_Spanish_ref2")

#redondeamos en calc
#quitamos x
Transmission_in_Spanish_ref2 <- select(Transmission_in_Spanish_ref2, -X)
write.csv(Transmission_in_Spanish_ref2, file = "Transmission_in_Spanish_ref2")
