test_that("install NetMHCIIpan binary to a custom location", {

  expect_error(
    install_netmhc2pan_bin_from_file(
      netmhc2pan_bin_tarfile_path = "irrelevant"
    ),
    "Deprecated"
  )
})
