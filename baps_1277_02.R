#Run hierBAPS.
#install.packages('rhierbaps')
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)
set.seed(1234)

#Plotting results
newick.file.name <- "run_alignment_no_coinf.fas.treefile"
iqtree_1277 <- phytools::read.newick(newick.file.name)

baps_1277 <- read.csv("hierbaps_partition_1277.csv", sep = ",", header = T)
baps_1277$Isolate <- as.character(baps_1277$Isolate)
baps_1277$level.1 <- as.double(baps_1277$level.1)
baps_1277$level.2 <- as.double(baps_1277$level.2)

#A simple coloured tree allows us to see the top level cluster assignment from hierBAPS.
gg <- ggtree(iqtree_1277, layout = "circular")
gg_1277 <- gg %<+% baps_1277
gg_1277 <- gg_1277 + geom_tippoint(aes(color = factor(level.2)))
gg_1277

gg <- ggtree(iqtree_1277, layout = "circular", branch.length = "none")
gg_1277 <- gg %<+% baps_1277
gg_1277 <- gg_1277 + geom_tippoint(aes(color = factor(level.2)))
gg_1277 <- gg_1277 + theme(legend.position = "right")
gg_1277 <- gg_1277 + geom_tiplab(aes(label = level.2), size = 1, offset = 1)
gg_1277

plot_sub_cluster(hb.results, iqtree_1277, level = 1, sub.cluster = 1)