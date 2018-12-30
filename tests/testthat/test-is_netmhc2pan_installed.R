context("test-is_netmhc2pan_installed")


test_that("use", {
  if (!is_on_travis()) return()
  
  if (is_netmhc2pan_installed()) {
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
    install_netmhc2pan(get_netmhc2pan_url())
    expect_true(is_netmhc2pan_installed())
  } else  {
    testit::assert(!is_netmhc2pan_installed())
    install_netmhc2pan()
    expect_true(is_netmhc2pan_installed())
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
  }

})
