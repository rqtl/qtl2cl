#' Read cross and save as rds
#'
#' Read cross files and save as rds
#'
#' @param input_file Character string with path to the
#' \href{http://www.yaml.org}{YAML} or \href{http://www.json.org/}{JSON} file containing all of the control
#' information. This could instead be a zip file containing all of the
#' data files, in which case the contents are unzipped to a temporary
#' directory and then read.
#' @param output_file Character string with path to RDS file for output
#'
#' @importFrom qtl2geno read_cross2
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
cross2rds <-
    function(input_file, output_file)
{
    saveRDS( qtl2geno::read_cross2(input_file), file=output_file )
}
