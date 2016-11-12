context("run_calckinship")

test_that("run_calckinship works", {

    cross_file <- system.file("extdata", "grav2.zip", package="qtl2geno")
    cross_rdsfile <- paste0(tempfile(), ".rds")
    prob_file <- paste0(tempfile(), ".rds")
    kinship_file <- paste0(tempfile(), ".rds")

    cross2rds(cross_file, cross_rdsfile)
    run_calcgenoprob(cross_rdsfile, prob_file, step=1, error_prob=0.002, map_function="c-f")
    run_calckinship(prob_file, kinship_file, type="loco")

    pr <- readRDS(prob_file)
    k <- qtl2geno::calc_kinship(pr, "loco")

    expect_equal(readRDS(kinship_file), k)

    unlink(cross_rdsfile)
    unlink(prob_file)
    unlink(kinship_file)

})
