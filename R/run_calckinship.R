#' Calculate kinship matrix
#'
#' Calculate genetic similarity among individuals (kinship matrix)
#' from conditional genotype probabilities.
#'
#' @param input_file Input RDS file containing genotype or allele probabilities
#' @param output_file Output RDS file for calculated kinship matrix
#' @param ... Passed to \code{\link[qtl2geno]{calc_kinship}}.
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
    function(input_file, output_file, ...)
{
    saveRDS( qtl2geno::calc_kinship( readRDS(input_file), ...), file=output_file)
}
