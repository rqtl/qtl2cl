#' Run calc_genoprob and save result to rds
#'
#' Run calc_genoprob and save result to rds
#'
#' @md
#'
#' @param cross_file Character string with path to RDS file containing cross
#' @param output_file Character string with path to RDS file for output
#' @param map_file Character string with path to RDS file for writing genetic map
#' (with inserted pseudomarkers)
#' @param step Distance between pseudomarkers and markers; if
#' `step=0` no pseudomarkers are inserted.
#' @param off_end Distance beyond terminal markers in which to insert
#' pseudomarkers.
#' @param stepwidth Indicates whether to use a fixed grid
#' (`stepwidth="fixed"`) or to use the maximal distance between
#' pseudomarkers to ensure that no two adjacent markers/pseudomarkers
#' are more than `step` apart.
#' @param error_prob Assumed genotyping error probability
#' @param map_function Character string indicating the map function to
#' use to convert genetic distances to recombination fractions.
#' @param cores Number of CPU cores to use, for parallel calculations.
#' (If `0`, use [parallel::detectCores()].)
#' Alternatively, this can be links to a set of cluster sockets, as
#' produced by [parallel::makeCluster()].
#' @param compress If TRUE, save compressed RDS files (smaller but slower).
#'
#' @importFrom qtl2 calc_genoprob insert_pseudomarkers
#' @export
#'
#' @examples
#' input_file <- paste0("https://github.com/rqtl/qtl2data/",
#'                      "blob/master/B6BTBR/b6btbr.zip")
#' \dontrun{cross2rds(input_file, "b6btbr.rds")}
#' \dontrun{run_calcgenoprob("b6btbr.rds", "b6btbr_probs.rds", "b6btbr_gmap.rds")}
run_calcgenoprob <-
    function(cross_file, output_file, map_file=NULL, step=0, off_end=0, stepwidth=c("fixed", "max"),
         error_prob=1e-4, map_function=c("haldane", "kosambi", "c-f", "morgan"),
         cores=1, compress=FALSE)
{
    stepwidth <- match.arg(stepwidth)
    map_function <- match.arg(map_function)

    cross <- readRDS(cross_file)
    map <- qtl2::insert_pseudomarkers(cross$gmap, step=step, off_end=off_end, stepwidth=stepwidth)

    if(!is.null(map_file) && map_file != "")
        saveRDS( map, file=map_file, compress=compress )

    saveRDS( qtl2::calc_genoprob(cross=cross, map=map,
                                 error_prob=error_prob, map_function=map_function,
                                 lowmem=FALSE, quiet=TRUE, cores=cores),
            file=output_file, compress=compress )
}
