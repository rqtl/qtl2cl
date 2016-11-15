context("command-line interface")

qtl2cl <- system.file("scripts", "qtl2cl", package="qtl2cl")

test_that("qtl2cl --cross2rds works", {

    zfile <- system.file("extdata", "iron.zip", package="qtl2geno")
    ofile <- paste0(tempfile(), ".rds")

    system(paste(qtl2cl, "--cross2rds -i",  zfile, "-o", ofile))

    cross <- qtl2geno::read_cross2(zfile)
    out <- readRDS(ofile)

    expect_equal(cross, out)

    unlink(ofile)

})



test_that("qtl2cl --calc_genoprob works", {

    zip_file <- system.file("extdata", "iron.zip", package="qtl2geno")

    tmp <- tempfile()
    cross_file <- paste0(tmp, "_cross.rds")
    probs_file <- paste0(tmp, "_probs.rds")

    cross <- qtl2geno::read_cross2(zip_file)
    cross <- cross[1:10, c(18,19,"X")]
    saveRDS(cross, cross_file)

    system(paste(qtl2cl, "--calc_genoprob --step=0.5 --map_function=c-f --error_prob=0.002 -i", cross_file, "-o", probs_file))

    pr <- calc_genoprob(cross, step=0.5, map_function="c-f", error_prob=0.002)
    pr2 <- readRDS(probs_file)

    expect_equal(pr, pr2)

    unlink(cross_file)
    unlink(probs_file)

})
