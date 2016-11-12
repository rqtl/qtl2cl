context("run_getXcovar")

test_that("run_getXcovar works", {

    infile <- system.file("extdata", "iron.zip", package="qtl2geno")
    rdsfile <- paste0(tempfile(), ".rds")
    cross2rds(infile, rdsfile)

    cross <- readRDS(rdsfile)

    xcovar_file <- paste0(tempfile(), ".rds")
    run_getXcovar(rdsfile, xcovar_file)

    expect_equal(readRDS(xcovar_file), qtl2geno::get_x_covar(cross))

    unlink(rdsfile)
    unlink(xcovar_file)

})
