context("test-check_netmhc2pan_installation")

test_that("use", {
  testit::assert(is_netmhc2pan_installed())
  expect_silent(check_netmhc2pan_installation())
})
