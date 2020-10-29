test_that("use", {
  if (!is_on_travis()) return()
  expect_silent(check_netmhc2pan_data_url())
})

test_that("be verbose", {
  if (!is_on_travis()) return()
  expect_message(
    check_netmhc2pan_data_url(verbose = TRUE)
  )
})

test_that("error message for invalid URL", {
  expect_error(
    check_netmhc2pan_data_url(netmhc2pan_data_url = "does_not_exist"),
    "does_not_exist"
  )
})
