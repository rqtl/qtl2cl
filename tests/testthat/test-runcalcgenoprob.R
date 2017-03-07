context("run_calcgenoprob")

test_that("run_calcgenoprob works", {

    cross_file <- system.file("extdata", "grav2.zip", package="qtl2geno")
    cross_rdsfile <- paste0(tempfile(), ".rds")
    outfile <- paste0(tempfile(), ".rds")

    cross2rds(cross_file, cross_rdsfile)

    run_calcgenoprob(cross_rdsfile, outfile, step=1, error_prob=0.002, map_function="c-f")

    cross <- readRDS(cross_rdsfile)
    map <- insert_pseudomarkers(cross$gmap, step=1)
    pr <- calc_genoprob(cross, map, error_prob=0.002, map_function="c-f")

    expect_equal(readRDS(outfile), pr)

    unlink(cross_rdsfile)
    unlink(outfile)

})
