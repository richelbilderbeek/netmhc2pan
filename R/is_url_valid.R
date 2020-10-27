#' Is the download URL valid?
#'
#' The download link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
is_url_valid <- function(
  download_url = get_netmhc2pan_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  temp_local_file = tempfile(pattern = "netmhc2pan_is_url_valid_")
) {
  is_valid <- FALSE
  tryCatch({
      suppressWarnings(
        check_download_url(
          download_url = download_url,
          verbose = verbose,
          netmhc2pan_archive_filename = netmhc2pan_archive_filename,
          temp_local_file = temp_local_file
        )
      )
      is_valid <- TRUE
    },
    error = function(e) {
      if (verbose) message("Error message: '", e, "'")
    }
  )
  is_valid
}
