# script to create example data to illustrate qtl2cl, the command-line interface to R/qtl2

# grab B6xBTBR intercross data
library(qtl2geno)
file <- paste0("https://raw.githubusercontent.com/rqtl/",
               "qtl2data/master/B6BTBR/b6btbr.zip")
b6btbr <- read_cross2(file)

# calculate genotype probabilities
pr <- calc_genoprob(b6btbr, step=1, err=0.002, map_function="c-f", cores=0)

# save stuff to file
saveRDS(pr, file="genoprobs.rds")
saveRDS(b6btbr$pheno, file="pheno.rds")
