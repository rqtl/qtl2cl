#' Run scan1
#'
#' Read in a bunch of data and then run \code{\link[qtl2scan]{scan1}}.
#'
#' @param genoprobs_file Name of file with genotype probabilities
#' @param pheno_file Name of file with phenotypes
#' @param output_file Optional output RDS file. If NULL, print output as a table.
#' @param map_file Optional (RDS) file containing map. Needed if \code{output_file} is NULL.
#' @param kinship_file Optional file containing kinship matrix
#' @param addcovar_file Optional file containing additive covariates
#' @param Xcovar_file Optional file containing X chromosome covariates
#' @param intcovar_file Optional file containing interactive covariates
#' @param weights_file Optional file containing covariates
#' @param reml If TRUE, use REML; otherwise, use maximum likelihood
#' @param cores Number of CPU cores to use
#'
#' @importFrom qtl2scan scan1
#' @importFrom qtl2convert scan_qtl2_to_qtl
#' @export
run_scan1 <-
    function(genoprobs_file,
             pheno_file,
             output_file=NULL,
             map_file=NULL,
             kinship_file=NULL,
             addcovar_file=NULL,
             Xcovar_file=NULL,
             intcovar_file=NULL,
             weights_file=NULL,
             reml=TRUE,
             cores=1)
{
    # read file if not NULL; otherwise pass along the NULL
    read_file0 <-
        function(filename)
        {
            if(is.null(filename) || filename=="") return(NULL)
            else return(read_file(filename))
        }

    result <- qtl2scan::scan1(genoprobs=read_file(genoprobs_file),
                              pheno=read_file(pheno_file),
                              kinship=read_file0(kinship_file),
                              addcovar=read_file0(addcovar_file),
                              Xcovar=read_file0(Xcovar_file),
                              intcovar=read_file0(intcovar_file),
                              weights=read_file0(weights_file),
                              reml=reml, cores=cores)

    if(is.null(output_file)) {
        if(!is.null(map_file) && map_file != "") map <- readRDS(map_file)
        else stop("Need map_file")

        tab <- qtl2convert::scan_qtl2_to_qtl(result, map)
        tab <- cbind(marker=rownames(tab),
                     as.data.frame(tab))
        rownames(tab) <- NULL

        # print as JSON
        cat(jsonlite::toJSON(tab), "\n")
    }
    else {
        saveRDS(result, file=output_file)
    }
}
