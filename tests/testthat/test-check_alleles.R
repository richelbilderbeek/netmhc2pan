test_that("use", {
  expect_silent(check_alleles(get_netmhc2pan_alleles()))
  expect_error(check_alleles("nonsense"), "Invalid 'alleles'")
})
