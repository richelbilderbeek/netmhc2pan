test_that("use", {
  if (is_netmhc2pan_bin_installed()) return()
  if (!is_url_valid()) return()

  expect_silent(install_netmhc2pan_bin())
  expect_message(install_netmhc2pan_bin(verbose = TRUE))
})

test_that("abuse", {

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
