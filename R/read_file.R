#' Read a file
#'
#' Read a file that is either RDS, CSV, JSON, or YAML, with the method
#' determined by the file extension.
#'
#' @param file Character string of input file; must have file
#' extension \code{.rds}, \code{.csv}, \code{.json}, or \code{.yaml}.
#' @param ... Passed to whatever function it calls
#'
#' @return Could be most anything; whatever gets read in by the
#' corresponding R function for the file type. See Details.
#'
#' @details For CSV files, we use \code{\link[qtl2geno]{read_csv}},
#' which calls \code{\link[data.table]{fread}} with a particular set
#' of options; note that columns are forced to be numeric in this
#' case.
#' For RDS files, we use \code{\link[base]{readRDS}}. For JSON files,
#' we use \code{\link[base]{readLines}} and
#' \code{\link[jsonlite]{fromJSON}}. For YAML files, we use
#' \code{\link[yaml]{yaml.load_file}}.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom yaml yaml.load_file
#' @importFrom qtl2geno read_csv
#' @importFrom optparse make_option
#' @export
#'
#' @examples
#' \dontrun{w <- read_file("myfile.rds")
#' x <- read_file("myfile.csv")
#' y <- read_file("myfile.json")
#' z <- read_file("myfile.yaml")}
read_file <-
    function(file, ...)
{
    tmp <- strsplit(file, "\\.")[[1]]
    file_extension <- tmp[length(tmp)]
    result <- switch(file_extension,
                     "csv" = qtl2geno::read_csv(file, ...),
                     "rds" = readRDS(file),
                     "json" = jsonlite::fromJSON( readLines(file) ),
                     "yaml" = yaml::yaml.load_file(file),
                     stop("Can't handle file extension ", file_extension))

    # for CSV, make sure all of the columns are numeric
    if(file_extension=="csv") {
        rn <- rownames(result)
        result <- as.data.frame(lapply(result, as.numeric))
        rownames(result) <- rn
    }

    result
}
