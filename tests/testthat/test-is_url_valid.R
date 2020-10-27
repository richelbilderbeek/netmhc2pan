test_that("use", {
  expect_silent(is_url_valid())
})

test_that("be verbose", {
  if (!is_on_travis()) return()
  expect_message(
    is_url_valid(verbose = TRUE),
    "download_url"
  )
})
