#' Read MHC2pan output
#'
#' Read the output produced by MHC2pan,
#' which is an \code{XLS} file by default.
#' @inheritParams default_params_doc
#' @return a table
#' @examples
#' xls_filename <- system.file("extdata", "example.xls", package = "netmhc2pan")
#' read_netmhc2pan_xls_output(xls_filename)
#' @export
read_netmhc2pan_xls_output  <- function(
  xls_filename
) {
  t <- readr::read_delim(
    xls_filename,
    delim = "\t",
    skip = 1,
    col_types = readr::cols(
      Pos = readr::col_double(),
      Peptide = readr::col_character(),
      ID = readr::col_character(),
      `1-log50k` = readr::col_double(),
      nM = readr::col_double(),
      Rank = readr::col_double(),
      Ave = readr::col_double(),
      NB = readr::col_double()
    )
  )
  new_names <- names(t)
  testthat::expect_equal("1-log50k", new_names[4])
  new_names[4] <- "one_minus_log50k"
  names(t) <- new_names
  t
}
