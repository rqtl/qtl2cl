### qtl2cl

[Karl Broman](http://kbroman.org)

[qtl2cl](https://github.com/rqtl/qtl2cl) is a command-line interface
to a restricted set of [R/qtl2](http://kbroman.org/qtl2) functions.

Currently, it can just do one thing:
  - read in genotype probabilities and phenotypes (and, optionally, additive covariates and a kinship matrix)
  - run `scan1`
  - if an (RDS) output file name is provided, save the results to that; otherwise, print them to stdout as JSON

The file [`create_example.R`](create_example.R) contains code to create the `genoprobs.rds` and `pheno.rds` files for the [B6xBTBR data](https://github.com/rqtl/qtl2data/tree/master/B6BTBR).

So you might try:

    R -e "source('create_example.R')"

and then:

    qtl2cl -o output.rds

---

#### License

[Licensed](License.md) under [GPL-3](http://www.r-project.org/Licenses/GPL-3).
