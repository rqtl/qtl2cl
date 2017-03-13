export PATH=$PATH:~/Rlibs/qtl2cl/scripts/

qtl2cl --cross2rds -i ~/Rlibs/qtl2geno/extdata/iron.zip -o iron.rds

qtl2cl --calc_genoprob -i iron.rds -o iron_probs.rds --map_file=iron_map.rds

qtl2cl --genoprob_to_alleleprob -i iron_probs.rds -o iron_aprobs.rds

qtl2cl --calc_kinship -i iron_aprobs.rds -o iron_kinship.rds

unzip ~/Rlibs/qtl2geno/extdata/iron.zip

qtl2cl --scan1 --genoprobs=iron_aprobs.rds --pheno=iron_pheno.csv --map_file=iron_map.rds > results.json
