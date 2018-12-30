context("test-get_download_url")

test_that("use", {
    expect_true(
    grepl(
      "(http://richelbilderbeek.nl/tmp_tmhmm-2.0c.Linux.tar.gz)|http://www.cbs.dtu.dk/download/[0-9A-F-]*$)",
      get_download_url()
    )
  )
})
