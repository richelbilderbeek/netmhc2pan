test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  alleles <- get_netmhc2pan_alleles()
  expect_true(length(alleles) > 5000)
})
