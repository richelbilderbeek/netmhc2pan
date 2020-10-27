test_that("use", {
  if (is_url_valid()) {
    expect_silent(check_download_url())
  } else {
    expect_error(check_download_url())
  }
})

test_that("be verbose", {
  if (!is_on_travis()) return()
  if (is_url_valid()) {
    expect_message(
      check_download_url(verbose = TRUE)
    )
  }
})

test_that("error message for invalid URL", {
  expect_error(
    check_download_url(download_url = "does_not_exist"),
    "YouTube"
  )
})
