#Run hierBAPS.
#install.packages('rhierbaps')
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)
set.seed(1234)

#Plotting results
newick.file.name <- "run_alignment_no_resis_1177.fas.treefile"
iqtree_1177 <- phytools::read.newick(newick.file.name)

baps_1177 <- read.csv("hierbaps_partition_1177_l4.csv", sep = ",", header = T)
baps_1177$Isolate <- as.character(baps_1177$Isolate)
baps_1177$level.1 <- as.double(baps_1177$level.1)
baps_1177$level.2 <- as.double(baps_1177$level.2)

#A simple coloured tree allows us to see the top level cluster assignment from hierBAPS.
gg <- ggtree(iqtree_1177, layout = "circular")
gg_1177 <- gg %<+% baps_1177
gg_1177 <- gg_1177 + geom_tippoint(aes(color = factor(level.7)))
gg_1177

gg <- ggtree(iqtree_1177, layout = "circular", branch.length = "none")
gg_1177 <- gg %<+% baps_1177
gg_1177 <- gg_1177 + geom_tippoint(aes(color = factor(level.2)))
gg_1177 <- gg_1177 + theme(legend.position = "right")
gg_1177 <- gg_1177 + geom_tiplab(aes(label = level.2), size = 1, offset = 1)
gg_1177

plot_sub_cluster(hb.results, iqtree_1177, level = 3, sub.cluster = 1)