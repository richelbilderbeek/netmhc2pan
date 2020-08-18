test_that("uninstall absent NetMHCIIpan must throw", {

  if (is_netmhc2pan_installed()) return()

  expect_error(
    uninstall_netmhc2pan(netmhc2pan_folder_name = "/abs/ent"), # nolint use absolute path
    "Cannot uninstall absent NetMHCIIpan at"
  )
})
