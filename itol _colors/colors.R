## Merges

View(basp_lvls3)
basp_lvl2 <- read.csv("~/itol _colors/basp_lvl2.csv", stringsAsFactors=TRUE)
View(basp_lvl2)
View(multi2_baps_lvl1)
basp_lvl2 <- read.csv("~/itol _colors/basp_lvl2.csv", stringsAsFactors=TRUE)
View(basp_lvl2)
Rhierbapslvl2 <-merge (basp_lvl2, `12_colors`, by = "lvl", all.x=TRUE)
View(Rhierbapslvl2)
write.csv(Rhierbapslvl2, file="Rhierbapslvl2", row.names = F)