#' Check if the download URL is valid
#'
#' Check if the download URL is valid, will stop if not.
#' The download link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_download_url <- function(
  download_url = get_netmhc2pan_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  temp_local_file = tempfile(pattern = "netmhc2pan_check_download_url_")
) {
  url <- file.path(download_url, netmhc2pan_archive_filename)
  if (verbose) {
    message(
      "'download_url': ", download_url, " \n",
      "'netmhc2pan_archive_filename': ", netmhc2pan_archive_filename, " \n",
      "'temp_local_file': ", temp_local_file, " \n",
      "'url': ", url
    )
  }
  writeLines("some random text to test if local path is writable", temp_local_file)
  file.remove(temp_local_file)
  suppressWarnings(
    utils::download.file(
      url = url,
      destfile = temp_local_file,
      quiet = !verbose
    )
  )
  file.remove(temp_local_file)
}
