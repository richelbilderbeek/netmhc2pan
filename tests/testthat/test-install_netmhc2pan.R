context("test-install_netmhc2pan")

test_that("use", {
  
  if (!is_netmhc2pan_installed()) {
    expect_silent(
      install_netmhc2pan(
        "http://www.cbs.dtu.dk/download/8BE4F714-0A7A-11E9-9257-2BC5B9CD16B5",
        verbose = TRUE
      )
    )
  }
})
