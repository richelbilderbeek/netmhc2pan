context("test-get_default_netmhc2pan_subfolder")

test_that("use", {
  expect_true(
    grepl(
      "netMHCpan-4.0",
      get_default_netmhc2pan_subfolder()
    )
  )
})
