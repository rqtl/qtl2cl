## qtl2cl

[Karl Broman](http://kbroman.org)

[![Build Status](https://travis-ci.org/rqtl/qtl2cl.svg?branch=master)](https://travis-ci.org/rqtl/qtl2cl)

[qtl2cl](https://github.com/rqtl/qtl2cl) is an R package that provides
a command-line interface to a restricted set of
[R/qtl2](http://kbroman.org/qtl2) functions.

---

### Installation

You first need to install R/qtl2 using the following. (For more
detail, see the instructions at <http://kbroman.org/qtl2/>.)

    install.packages(c("devtools", "yaml", "jsonlite", "data.table", "RcppEigen"))
    library(devtools)
    install_github(paste0("rqtl/qtl2", c("geno", "scan", "plot", "convert")))

You also need to install the
[optparse](https://CRAN.R-project.org/package=optparse) package from
CRAN, and then the present [qtl2cl](https://github.com/rqtl/qtl2cl)
package.

    install.packages("optparse")
    devtools::install_github("qtl2cl")

The command-line script will be located at
`$R_LIBS/qtl2cl/scripts/qtl2cl` where `$R_LIBS` is the path to the R
packages within your R installation. You may want to add this to your
`PATH`.

---

### Usage

Currently, the command-line interface to R/qtl2 can do the following
five things.

#### `--cross2rds`

With the option `--cross2rds`, you can load data for a cross and save
the resulting `"cross2"` object to an RDS file. For example, we can
download the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data and save it to a local RDS file.

    qtl2cl --cross2rds --input=https://raw.githubusercontent.com/rqtl/qtl2data/master/B6BTBR/b6btbr.zip --output=b6btbr.rds

#### `--calc_genoprob`

#### `--genoprob_to_alleleprob`

#### `--calc_kinship`

#### `--scan1`

---

### License

[Licensed](License.md) under [GPL-3](http://www.r-project.org/Licenses/GPL-3).
