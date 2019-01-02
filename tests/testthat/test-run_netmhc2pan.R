context("test-run_netmhc2pan")

test_that("use", {
  testit::assert(is_netmhc2pan_installed())
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  df <- run_netmhc2pan(fasta_filename)
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
  expect_true(is.numeric(df$nM)) # nolint use NetMHC2pan variable names
  expect_true(!is.factor(df$nM)) # nolint use NetMHC2pan variable names
  expect_true(is.numeric(df$Rank))
  expect_true(!is.factor(df$Rank))

  names(df)
  expect_equal(9, nrow(df))
})

test_that("use, multiple alleles", {
  alleles <- c("DRB1_0101", "DRB1_0102")
  testit::assert(is_netmhc2pan_installed())
  testit::assert(all(alleles %in% get_netmhc2pan_alleles()))
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  df <- run_netmhc2pan(fasta_filename = fasta_filename, alleles = alleles)
  # Long form
  expect_equal(18, nrow(df))
})
