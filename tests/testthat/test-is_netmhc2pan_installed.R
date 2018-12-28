context("test-is_netmhc2pan_installed")

test_that("use", {

  if (is_netmhc2pan_installed()) {
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
    install_netmhc2pan("http://www.cbs.dtu.dk/download/8BE4F714-0A7A-11E9-9257-2BC5B9CD16B5") # nolint indeed long URL
    expect_true(is_netmhc2pan_installed())
  } else  {
    testit::assert(!is_netmhc2pan_installed())
    install_netmhc2pan()
    expect_true(is_netmhc2pan_installed())
    uninstall_netmhc2pan()
    expect_false(is_netmhc2pan_installed())
  }

})
