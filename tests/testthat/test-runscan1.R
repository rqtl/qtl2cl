context("run_scan1")

test_that("run_scan1 works", {

    cross_file <- system.file("extdata", "grav2.zip", package="qtl2")
    cross_rdsfile <- paste0(tempfile(), ".rds")
    prob_file <- paste0(tempfile(), ".rds")
    pheno_file <- paste0(tempfile(), ".rds")
    out_file <- paste0(tempfile(), ".rds")

    cross2rds(cross_file, cross_rdsfile)
    run_calcgenoprob(cross_rdsfile, prob_file, step=1, error_prob=0.002, map_function="c-f")
    cross <- readRDS(cross_rdsfile)
    saveRDS(cross$pheno, file=pheno_file)

    run_scan1(prob_file, pheno_file, out_file)

    pr <- readRDS(prob_file)
    out <- qtl2::scan1(pr, cross$pheno)

    expect_equal(readRDS(out_file), out)

    unlink(cross_rdsfile)
    unlink(prob_file)
    unlink(pheno_file)
    unlink(out_file)

})
