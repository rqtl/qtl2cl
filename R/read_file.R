#' Read a file
#'
#' Read a file that is either RDS, CSV, or JSON, with the method determined by the file extension.
#'
#' @param file Character string of input file path
#' @param ... Passed to whatever function it calls
#'
#' @importFrom qtl2geno read_csv
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @examples
#' \dontrun{x <- read_file("myfile.rds")}
#' \dontrun{y <- read_file("myfile.csv")}
#' \dontrun{z <- read_file("myfile.json")}
read_file <-
    function(file, ...)
{
    tmp <- strsplit(file, "\\.")[[1]]
    file_extension <- tmp[length(tmp)]
    switch(file_extension,
           "csv" = qtl2geno::read_csv(file, ...),
           "rds" = readRDS(file),
           "json" = jsonlite::fromJSON( readLines(file) ),
           stop("Can't handle file extension ", file_extension))
}
