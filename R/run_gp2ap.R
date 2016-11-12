#' Run genoprob_to_alleleprob
#'
#' Read in genotype probabilities, convert them to allele
#' probabilities, and write them back out.
#'
#' @param input_file Name of input file (should be RDS)
#' @param output_file Name of output file (will be RDS)
#' @param quiet IF \code{FALSE}, print progress messages.
#' @param cores Number of CPU cores to use, for parallel calculations.
#' (If \code{0}, use \code{\link[parallel]{detectCores}}.)
#' Alternatively, this can be links to a set of cluster sockets, as
#' produced by \code{\link[parallel]{makeCluster}}.
#'
#' @importFrom qtl2geno genoprob_to_alleleprob
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_calcgenoprob("b6btbr.rds", "b6btbr_probs.rds")}
#' \dontrun{run_gp2ap("b6btbr_probs.rds", "b6btbr_aprobs.rds")}
run_gp2ap <-
    function(input_file, output_file, quiet=TRUE, cores=1)
{
    saveRDS( qtl2geno::genoprob_to_alleleprob( readRDS(input_file),
                                              quiet=quiet, cores=cores),
            file=output_file)
}
