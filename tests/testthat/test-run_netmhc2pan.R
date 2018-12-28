context("test-run_netmhc2pan")

test_that("use", {
  testit::assert(is_netmhc2pan_installed())
  fasta_filename <- system.file("extdata", "example.fasta", package = "netmhc2pan")
  df <- run_netmhc2pan(fasta_filename)
  expect_equal(9, nrow(df))
})

test_that("use, filter", {
  testit::assert(is_netmhc2pan_installed())
  fasta_filename <- system.file("extdata", "example.fasta", package = "netmhc2pan")
  df <- run_netmhc2pan(fasta_filename, do_filter = TRUE)
  expect_equal(9, nrow(df))
})
