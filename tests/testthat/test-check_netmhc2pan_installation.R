context("test-check_netmhc2pan_installation")

test_that("use", {
  testit::assert(is_netmhc2pan_installed())
  expect_silent(check_netmhc2pan_installation())
})

test_that("abuse", {

  if (!is_on_travis()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  testit::assert(!dir.exists(folder_name))

  testit::assert(!is_netmhc2pan_installed(folder_name = folder_name))
  expect_error(
    check_netmhc2pan_installation(folder_name = folder_name),
    "NetMHC2pan binary not found at"
  )

  install_netmhc2pan_bin(folder_name = folder_name)
  expect_error(
    check_netmhc2pan_installation(folder_name = folder_name),
    "NetMHC2pan data not found at"
  )

  install_netmhc2pan_data(folder_name = folder_name)
  expect_error(
    check_netmhc2pan_installation(folder_name = folder_name),
    "NetMHC2pan not set up"
  )

  set_up_netmhc2pan(folder_name = folder_name)
  expect_silent(
    check_netmhc2pan_installation(folder_name = folder_name)
  )
})
