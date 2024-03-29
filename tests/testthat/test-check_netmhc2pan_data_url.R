test_that("use", {
  if (!is_on_ci()) return()

  if (is_url_valid()) {
    # This test will break if www.cbs.dtu.dk is down,
    # here I assume it is usually up :-)
    expect_silent(check_netmhc2pan_data_url())
  }
})

test_that("be verbose", {
  if (!is_on_ci()) return()
  if (is_url_valid()) {
    expect_message(
      check_netmhc2pan_data_url(verbose = TRUE),
      "netmhc2pan_data_url"
    )
  }
})

test_that("error message for invalid URL", {
  expect_error(
    check_netmhc2pan_data_url(netmhc2pan_data_url = "does_not_exist"),
    "does_not_exist"
  )
})
