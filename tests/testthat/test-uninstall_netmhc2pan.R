context("test-uninstall_netmhc2pan")

test_that("uninstall absent NetMHC2pan must throw", {

  expect_error(
    uninstall_netmhc2pan(folder_name = "/abs/ent"),
    "Cannot uninstall absent NetMHC2pan at"
  )
})
