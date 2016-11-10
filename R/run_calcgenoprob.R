#' Run calc_genoprob and save result to rds
#'
#' Run calc_genoprob and save result to rds
#'
#' @param cross_file Character string with path to RDS file containing cross
#' @param output_file Character string with path to RDS file for output
#' @param ... Passed to \code{\link[qtl2geno]{calc_genoprob}}
#'
#' @return Name of output file
#'
#' @importFrom qtl2geno calc_genoprob
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_calcgenoprob("b6btbr.rds", "b6btbr_probs.rds")}
run_calcgenoprob <-
    function(input_file, output_file, ...)
{
    saveRDS( qtl2geno::calc_genoprob( readRDS(input_file), ...), file=output_file )
}
