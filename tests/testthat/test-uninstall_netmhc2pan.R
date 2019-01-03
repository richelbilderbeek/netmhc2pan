context("test-uninstall_netmhc2pan")

test_that("uninstall absent NetMHCIIpan must throw", {

  expect_error(
    uninstall_netmhc2pan(folder_name = "/abs/ent"), # nolint use absolute path 
    "Cannot uninstall absent NetMHCIIpan at"
  )
})
