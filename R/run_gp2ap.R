#' Run genoprob_to_alleleprob
#'
#' Read in genotype probabilities, convert them to allele
#' probabilities, and write them back out.
#'
#' @md
#'
#' @param input_file Name of input file (should be RDS)
#' @param output_file Name of output file (will be RDS)
#' @param cores Number of CPU cores to use, for parallel calculations.
#' (If `0`, use [parallel::detectCores()].)
#' Alternatively, this can be links to a set of cluster sockets, as
#' produced by [parallel::makeCluster()].
#' @param compress If TRUE, save a compressed RDS file (smaller but slower).
#'
#' @importFrom qtl2 genoprob_to_alleleprob
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_calcgenoprob("b6btbr.rds", "b6btbr_probs.rds")}
#' \dontrun{run_gp2ap("b6btbr_probs.rds", "b6btbr_aprobs.rds")}
run_gp2ap <-
    function(input_file, output_file, cores=1, compress=FALSE)
{
    saveRDS( qtl2::genoprob_to_alleleprob( readRDS(input_file),
                                          quiet=TRUE, cores=cores),
            file=output_file, compress=compress)
}
