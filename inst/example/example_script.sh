export PATH=$PATH:~/Rlibs/qtl2cl/scripts/

qtl2cl --cross2rds -i ~/Rlibs/qtl2geno/extdata/grav2.zip -o grav2.rds

qtl2cl --calc_genoprob -i grav2.rds -o grav2_probs.rds

qtl2cl --genoprob_to_alleleprob -i grav2_probs.rds -o grav2_aprobs.rds

qtl2cl --calc_kinship -i grav2_aprobs.rds -o grav2_kinship.rds

unzip ~/Rlibs/qtl2geno/extdata/grav2.zip

qtl2cl --scan1 --genoprobs=grav2_aprobs.rds --pheno=grav2_pheno.csv > results.json
