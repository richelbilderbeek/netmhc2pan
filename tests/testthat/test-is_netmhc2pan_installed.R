test_that("use", {
  expect_silent(is_netmhc2pan_installed())
  is_netmhc2pan_installed(verbose = TRUE)
})

test_that("use", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  if (is_netmhc2pan_installed()) {
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
    install_netmhc2pan()
    expect_true(is_netmhc2pan_installed())
  } else  {
    testit::assert(!is_netmhc2pan_installed())
    install_netmhc2pan()
    expect_true(is_netmhc2pan_installed())
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
  }

})
