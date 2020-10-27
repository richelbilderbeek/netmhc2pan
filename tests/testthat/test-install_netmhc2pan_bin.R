test_that("use", {
  if (!is_netmhc2pan_bin_installed() && is_url_valid()) {
    expect_silent(install_netmhc2pan_bin())
    expect_message(install_netmhc2pan_bin(verbose = TRUE))
  } else {

  }

})
