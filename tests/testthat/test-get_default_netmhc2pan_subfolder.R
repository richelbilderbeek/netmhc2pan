context("test-get_default_netmhc2pan_subfolder")

test_that("use", {
  expect_equal(
    basename(get_default_netmhc2pan_subfolder()),
    "netMHCIIpan-3.2"
  )
})
