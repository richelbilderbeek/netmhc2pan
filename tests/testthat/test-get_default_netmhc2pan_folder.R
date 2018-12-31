context("test-get_default_netmhc2pan_folder")

test_that("use", {
  expect_true(
    grepl(
      "/home/[A-Za-z0-9_]*/.local/share", # nolint does correspond to an absolute path
      get_default_netmhc2pan_folder()
    )
  )
})
