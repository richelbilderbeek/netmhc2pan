test_that("use", {
  expect_equal(
    get_netmhc2pan_archive_filename(),
    "netMHCIIpan-3.2.Linux.tar.gz"
  )
})
