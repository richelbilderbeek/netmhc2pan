test_that("use", {
  expect_silent(is_url_valid())
})

test_that("be verbose", {
  if (!is_on_ci()) return()

  expect_message(
    is_url_valid(
      netmhc2pan_bin_url = "invalid",
      verbose = TRUE
    ),
    "netmhc2pan_bin_url"
  )
})
