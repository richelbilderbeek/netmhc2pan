#' Create a \code{.xls} file
#' @export
create_temp_xls_filename <- function() {
  tempfile(
    pattern = "temp_",
    tmpdir = rappdirs::user_cache_dir(),
    fileext = ".xls"
  )
}
