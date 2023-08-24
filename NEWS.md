## qtl2cl 0.23 (2023-08-24)

- Replace calls to `qtl2::read_csv()` which is now `qtl2::fread_csv()`.


## qtl2cl 0.22 (2020-05-21)

- No real changes; just keeping in sync with the qtl2 package.


## qtl2cl 0.20 (2019-06-03)

- Use Markdown for function documentation, throughout


## qtl2cl 0.16 (2018-07-23)

- No real changes; just keeping in sync with the qtl2 package.


## qtl2cl 0.14 (2018-03-09)

- No real changes; just keeping in sync with the qtl2 package.


## qtl2cl 0.12 (2018-01-19)

- Again, no actual changes; just keeping in sync with the qtl2 package.


## qtl2cl 0.10 (2018-01-09)

- No actual changes; just keeping in sync with the qtl2 package.


## qtl2cl 0.8 (2018-01-05)

- First formal release


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
