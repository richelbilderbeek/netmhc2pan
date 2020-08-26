test_that("install_netmhc2pan_bin", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  # Invalid URL
  expect_error(
    install_netmhc2pan_bin(
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      download_url = "nonsense"
    ),
    "'download_url' is invalid"
  )

  # Re-install NetMHCIIpan
  install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name)

  expect_error(
    install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan binary is already installed"
  )
})

test_that("install_netmhc2pan_data", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempdir()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  # Re-install NetMHCIIpan data
  install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name)

  expect_error(
    install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan data is already installed"
  )
})

test_that("set_up_netmhc2pan", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  # Empty folder
  expect_error(
    set_up_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan binary is absent"
  )

  # Minimal install
  install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_silent(
    set_up_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  )
})
