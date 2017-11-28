context("cross2rds")

test_that("cross2rds works", {

    infile <- system.file("extdata", "grav2.zip", package="qtl2")
    rdsfile <- paste0(tempfile(), ".rds")

    cross2rds(infile, rdsfile)

    expect_equal(readRDS(rdsfile),
                 qtl2::read_cross2(infile))

    unlink(rdsfile)

})
