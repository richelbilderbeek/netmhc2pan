context("test-install_netmhc2pan")

test_that("install_netmhc2pan_bin", {

  if (!is_on_travis()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  testit::assert(!dir.exists(folder_name))

  # Invalid URL
  expect_error(
    install_netmhc2pan_bin(
      folder_name = folder_name,
      download_url = "nonsense"
    ),
    "'download_url' is invalid"
  )

  # Re-install NetMHCIIpan
  install_netmhc2pan_bin(folder_name = folder_name)

  expect_error(
    install_netmhc2pan_bin(folder_name = folder_name),
    "NetMHCIIpan binary is already installed"
  )
})

test_that("install_netmhc2pan_data", {

  if (!is_on_travis()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  testit::assert(!dir.exists(folder_name))

  # Re-install NetMHCIIpan data
  install_netmhc2pan_data(folder_name = folder_name)

  expect_error(
    install_netmhc2pan_data(folder_name = folder_name),
    "NetMHCIIpan data is already installed"
  )
})

test_that("set_up_netmhc2pan", {

  if (!is_on_travis()) return()

  folder_name <- tempdir()
  if (dir.exists(folder_name)) unlink(folder_name, recursive = TRUE)
  testit::assert(!dir.exists(folder_name))

  # Empty folder
  expect_error(
    set_up_netmhc2pan(folder_name = folder_name),
    "NetMHCIIpan binary is absent"
  )

  # Minimal install
  install_netmhc2pan_bin(folder_name = folder_name)
  expect_silent(
    set_up_netmhc2pan(folder_name = folder_name)
  )
})
