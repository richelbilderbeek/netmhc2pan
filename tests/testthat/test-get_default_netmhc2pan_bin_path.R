context("test-get_default_netmhc2pan_bin_path")

test_that("use", {
  expect_true(
    grepl(
      "netMHCpan",
      get_default_netmhc2pan_bin_path()
    )
  )
})
