test_that("use", {
  if (!is_netmhc2pan_installed()) return()

  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  netmhc2pan::get_netmhc2pan_alleles()
  temp_xls_filename <- tempfile()
  df <- run_netmhc2pan(
    fasta_filename,
    alleles = "HLA-DPA10105-DPB112501",
    temp_xls_filename = temp_xls_filename
  )

  # Must do cleanup
  expect_false(file.exists(temp_xls_filename))

  expect_equal(
   colnames(df),
   c("Pos", "Peptide", "ID", "Allele", "one_minus_log50k", "nM", "Rank")
  )
  expect_true(is.numeric(df$Pos))
  expect_true(!is.factor(df$Pos))
  expect_true(is.character(df$Peptide))
  expect_true(!is.factor(df$Peptide))
  expect_true(is.character(df$ID))
  expect_true(!is.factor(df$ID))
  expect_true(is.character(df$Allele))
  expect_true(!is.factor(df$Allele))
  expect_true(is.numeric(df$one_minus_log50k))
  expect_true(!is.factor(df$one_minus_log50k))
  expect_true(is.numeric(df$nM))
  expect_true(!is.factor(df$nM))
  expect_true(is.numeric(df$Rank))
  expect_true(!is.factor(df$Rank))

  names(df)
  expect_equal(9, nrow(df))
})

test_that("use, multiple alleles", {
  if (!is_netmhc2pan_installed()) return()

  alleles <- c("DRB1_0101", "DRB1_0102")
  testit::assert(is_netmhc2pan_installed())
  testit::assert(all(alleles %in% get_netmhc2pan_alleles()))
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  temp_xls_filename <- tempfile()
  df <- run_netmhc2pan(
    fasta_filename = fasta_filename,
    alleles = alleles,
    temp_xls_filename = temp_xls_filename
  )
  df

  # Long form
  expect_equal(18, nrow(df))
})

test_that("abuse", {

  if (!is_netmhc2pan_installed()) return()

  fasta_filename <- tempfile()
  writeLines("Nonsense", fasta_filename)
  expect_error(
    run_netmhc2pan(
      fasta_filename = fasta_filename,
      alleles = "HLA-DPA10105-DPB112501"
    ),
    "'fasta_filename' is not a valid FASTA file"
  )


  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  expect_error(
    run_netmhc2pan(
      fasta_filename = fasta_filename,
      alleles = "nonsense"
    ),
    "Invalid 'alleles'"
  )
})
