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

    install.packages("qtl2", repos="http://rqtl.org/qtl2cran")

You then need to install the [qtl2cl](https://github.com/rqtl/qtl2cl)
package. The [optparse](https://CRAN.R-project.org/package=optparse) package
will also be installed.

    install.packages("qtl2cl", repos="http://rqtl.org/qtl2cran")

The command-line script will be located at
`$R_LIBS/qtl2cl/scripts/qtl2cl` where `$R_LIBS` is the path to the R
packages within your R installation. You may want to add this to your
`PATH`. Once you've installed the R/qtl2cl package, you can use the following to
find the path to the `qtl2cl` script.

    Rscript -e "system.file('scripts', 'qtl2cl', package='qtl2cl')"

---

### Usage

Currently, the command-line interface to R/qtl2 can do the following
things.

#### Import cross data and save to RDS file

With the option `--cross2rds`, you can load data for a cross and save
the resulting `"cross2"` object to an RDS file. For example, we can
download the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data and save it to a local RDS file.

    qtl2cl --cross2rds --input=https://raw.githubusercontent.com/rqtl/qtl2data/master/B6BTBR/b6btbr.zip --output=b6btbr.rds

#### Calculate genotype probabilities

With the option `--calc_genoprob`, you can load data for a cross from
an RDS file and calculate QTL genotype probabilities. Control of the
calculations is through the following arguments:
- `--step`
- `--off_end`
- `--stepwidth`
- `--error_prob`
- `--map_function`
- `--cores`

It may also be important to *write* the genetic marker map, with
pseudomarkers inserted, to an RDS file. This is accomplished by
providing the `--map_file` argument.

Here's an example using the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data.  We've split
the command across two lines so that it's easier to read.


    qtl2cl --calc_genoprob --input=b6btbr.rds --output=b6btbr_probs.rds --map_file=b6btbr_map.rds \
       --step=0.5 --stepwidth=max --error_prob=0.002 --map_function=c-f

#### Convert genotype probabilities to allele dosages

With the option `--genoprob_to_alleleprob`, you can convert genotype
probabilities to allele dosages. This is useful for performing a
genome scan with an additive allele model. The allele dosages can also
be used to calculate the kinship matrix.

Here's an example using the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data.

    qtl2cl --genoprob_to_alleleprob --input=b6btbr_probs.rds --output=b6btbr_aprobs.rds


#### Calculate kinship matrices

With the option `--calc_kinship`, you can calculate a kinship matrix
from previously calculated genotype or allele probabilities.  These
are used in a linear mixed model to adjust for background polygenic
effects. Control of the calculations is through the following
arguments:
- `--type` (`overall`, `loco`, or `chr`)
- `--use_grid_only`
- `--omit_x`
- `--use_allele_probs`
- `--normalize`

Here's an example using the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data.

    qtl2cl --calc_kinship --input=b6btbr_aprobs.rds --output=b6btbr_kinship.rds


#### Grab X chromosome covariates

With the option `--get_x_covar`, you can grab the special X chromosome
covariates needed for QTL analysis with some cross types. The input is
a cross object saved as an RDS file. The result is saved to another
RDS file.

Here's an example using the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data.

    qtl2cl --get_x_covar --input=b6btbr.rds --output=b6btbr_xcovar.rds

#### Perform single-QTL genome scan

With the option `--scan1`, you can perform a single-QTL genome scan.
The minimal inputs are genotype (or allele) probabilities and
phenotypes. You can also provide additive covariates, interactive
covariates, special X chromosome covariates, kinship matrices, and
weights. Each of these is provided as a file name, which may be for a CSV,
RDS, JSON, or YAML file (except for the genotype probabilities, which
must be in an RDS file). In each case, the contents should be a
rectangle of numeric values with a header row and with the first
column being a set of individual identifiers.

If an output file is provided, the results are saved as an RDS file.
If no output file is provided, the results are printed to STDOUT as
JSON. In the latter case, one would generally want to provide the
genetic marker/pseudomarker map as an RDS file (via `--map_file`),
created when running `--calc_genoprob`. Otherwise the LOD scores will
be provided but without information about chromosomes and positions.

Here's an example using the
[B6xBTBR intercross](https://github.com/rqtl/qtl2data/blob/master/B6BTBR/ReadMe.md)
data, with the phenotypes grabbed from the web and the X chromosome
covariates derived above (with `qtl2cl --get_x_covar`). We've split
the command across two lines, because the URL for phenotypes is so
long.

In this case, the genome scan results will be saved to an RDS file, `b6btbr_scan.rds`.

    qtl2cl --scan1 --genoprobs=b6btbr_aprobs.rds --Xcovar=b6btbr_xcovar.rds --output=b6btbr_scan.rds \
        --pheno=https://raw.githubusercontent.com/rqtl/qtl2data/master/B6BTBR/b6btbr_pheno.csv

Alternatively, if `--output` is not provided, the results are printed
to STDOUT as a JSON object. In this case, it's best to provide
`--map_file` (as used, to save the map object, when running
`--calc_genoprob`), so that the JSON output includes chromosome and
position information.

    qtl2cl --scan1 --genoprobs=b6btbr_aprobs.rds --Xcovar=b6btbr_xcovar.rds --map_file=b6btbr_map.rds \
        --pheno=https://raw.githubusercontent.com/rqtl/qtl2data/master/B6BTBR/b6btbr_pheno.csv


---

### License

[Licensed](License.md) under [GPL-3](https://www.r-project.org/Licenses/GPL-3).
