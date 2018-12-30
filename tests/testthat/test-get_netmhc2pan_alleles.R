context("test-get_netmhc2pan_alleles")

test_that("use", {
  alleles <- get_netmhc2pan_alleles()
  expect_true(length(alleles) > 5000)
})
