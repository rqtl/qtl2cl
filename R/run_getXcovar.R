#' Get X covariates and write to file
#'
#' Read cross from RDS file, determine X chromosome covariates, and write to another RDS file.
#'
#' @param input_file Input RDS file for cross
#' @param output_file Output RDS file for X chromosome covariates
#'
#' @importFrom qtl2geno get_x_covar
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_getXcovar("b6btbr.rds", "b6btbr_xcovar.rds")}
run_getXcovar <-
    function(input_file, output_file)
{
    saveRDS( qtl2geno::get_x_covar( readRDS(input_file) ), file=output_file )
}
