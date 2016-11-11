context("read_file")

test_that("read_file works for an RDS file", {

    x <- list(a="a", b="b", c=1:100)
    file <- paste0(tempfile(), ".rds")
    saveRDS(x, file=file)

    expect_equal(read_file(file), x)

    unlink(file)

})


test_that("read_file works for a CSV file", {

    x <- data.frame(rn=sample(letters),
                    a=round(runif(26, 0, 50), 3),
                    b=1:26,
                    c=26:1,
                    stringsAsFactors=FALSE)
    file <- paste0(tempfile(), ".csv")
    utils::write.table(x, file, row.names=FALSE, col.names=TRUE,
                       sep=",", quote=FALSE)

    rownames(x) <- x[,1]
    x <- x[,-1]

    expect_equal(read_file(file), x)

    unlink(file)

})
