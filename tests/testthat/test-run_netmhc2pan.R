context("test-run_netmhc2pan")

test_that("use", {
  testit::assert(is_netmhc2pan_installed())
  fasta_filename <- 
  expect_silent(run_netmhc2pan())
})
