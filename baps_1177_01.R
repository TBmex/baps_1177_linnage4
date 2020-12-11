#Run hierBAPS.
#install.packages('rhierbaps')
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)
set.seed(1234)
    
#Loading data
fasta.file.name <- "run_alignment_no_resis_1177.fas"
snp.matrix <- load_fasta(fasta.file.name)
  
#We can also check how long hierBAPS takes to run on the test dataset of 515 samples and 744 SNPs.
#system.time(hierBAP  S(snp.matrix, n.cores = 6, max.depth = 6, n.pops = 200, quiet = TRUE))
  
#To run hierBAPS with 2 levels and 20 initial clusters we run
hb.results <- hierBAPS(snp.matrix, n.cores = 6, max.depth = 8, quiet = TRUE)
head(hb.results$partition.df)
            
#Save
write.csv(hb.results$partition.df, "hierbaps_partition_1177_l4.csv", row.names = FALSE)
save_lml_logs(hb.results, "hierbaps_logML_1177_l4.txt")