## qtl2cl 0.5-4 (2017-06-07)

### New features

- Add argument `compress` for indicating whether to save compressed
  RDS files or not; default is *not* to compress (so bigger files, but
  faster to write/read).


## qtl2cl 0.5-3 (2017-06-05)

### Minor changes

- Remove `normalize` option for `calc_kinship` because no longer
  present in [qtl2geno](https://github.com/rqtl/qtl2geno).

- Revised installation instructions.


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
