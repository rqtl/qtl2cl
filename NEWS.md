## qtl2cl 0.5-2 (2017-03-07)

### New features

- Revised to deal with
  changes to R/qtl2 data structures in
  [qtl2geno](https://github.com/rqtl/qtl2geno) and
  [qtl2scan](https://github.com/rqtl/qtl2scan).

- With `--calc_genoprob`, you can now specify
  `--map_file=some_file.rds`; if provided, the genetic map of
  markers/pseudomarkers is saved to an RDS file.

- With `--scan1`, you can now specify `--map_file=some_file.rds`; if
  provided and `--output` is not, the printed JSON object includes
  chromosome and position columns.
