#' Read cross and save as rds
#'
#' Read cross files and save as rds
#'
#' @param input_file Character string with path to the
#' [YAML](http://www.yaml.org) or [JSON](http://www.json.org) file containing all of the control
#' information. This could instead be a zip file containing all of the
#' data files, in which case the contents are unzipped to a temporary
#' directory and then read.
#' @param output_file Character string with path to RDS file for output
#' @param compress If TRUE, save a compressed RDS file (smaller but slower).
#'
#' @importFrom qtl2 read_cross2
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
cross2rds <-
    function(input_file, output_file, compress=FALSE)
{
    saveRDS( qtl2::read_cross2(input_file), file=output_file, compress=compress )
}
