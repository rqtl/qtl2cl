#' Calculate kinship matrix
#'
#' Calculate genetic similarity among individuals (kinship matrix)
#' from conditional genotype probabilities.
#'
#' @param input_file Input RDS file containing genotype or allele probabilities
#' @param output_file Output RDS file for calculated kinship matrix
#' @param type Indicates whether to calculate the overall kinship
#' (\code{"overall"}, using all chromosomes), the kinship matrix
#' leaving out one chromosome at a time (\code{"loco"}), or the
#' kinship matrix for each chromosome (\code{"chr"}).
#' @param omit_x If \code{TRUE}, only use the autosomes; ignored when
#' \code{type="chr"}.
#' @param use_allele_probs If \code{TRUE}, assess similarity with
#' allele probabilities (that is, first run
#' \code{\link{genoprob_to_alleleprob}}); otherwise use the genotype
#' probabilities.
#' @param normalize If \code{TRUE}, divide the kinship matrix by a
#' normalizing constant (see Details).
#' @param cores Number of CPU cores to use, for parallel calculations.
#' (If \code{0}, use \code{\link[parallel]{detectCores}}.)
#' Alternatively, this can be links to a set of cluster sockets, as
#' produced by \code{\link[parallel]{makeCluster}}.
#'
#' @importFrom qtl2geno calc_kinship
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_calcgenoprob("b6btbr.rds", "b6btbr_probs.rds")}
#' \dontrun{run_calckinship("b6btbr_probs.rds", "b6btbr_kinship.rds")}
run_calckinship <-
    function(input_file, output_file, type=c("overall", "loco", "chr"),
             omit_x=FALSE,
             use_allele_probs=TRUE, normalize=FALSE, cores=1)
{
    type <- match.arg(type)

    saveRDS( qtl2geno::calc_kinship( readRDS(input_file), type=type,
                                    omit_x=omit_x, use_allele_probs=use_allele_probs,
                                    normalize=normalize, quiet=TRUE, cores=cores),
            file=output_file)
}
