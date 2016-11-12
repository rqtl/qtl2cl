context("run_gp2ap")

test_that("run_gp2ap works", {

    cross_file <- system.file("extdata", "grav2.zip", package="qtl2geno")
    cross_rdsfile <- paste0(tempfile(), ".rds")
    prob_file <- paste0(tempfile(), ".rds")
    aprob_file <- paste0(tempfile(), ".rds")

    cross2rds(cross_file, cross_rdsfile)
    run_calcgenoprob(cross_rdsfile, prob_file, step=1, error_prob=0.002, map_function="c-f")
    run_gp2ap(prob_file, aprob_file)

    pr <- readRDS(prob_file)
    apr <- genoprob_to_alleleprob(pr)

    expect_equal(readRDS(aprob_file), apr)

    unlink(cross_rdsfile)
    unlink(prob_file)
    unlink(aprob_file)

})
