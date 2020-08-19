#' Is the download URL valid?
#'
#' The download link expires after 4 hours.
#' @export
is_url_valid <- function(
  download_url = get_netmhc2pan_url(),
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename()
) {
  url <- file.path(download_url, netmhc2pan_archive_filename)
  local_path <- tempfile()
  is_valid <- FALSE
  tryCatch({
      suppressWarnings(
        utils::download.file(
          url = url,
          destfile = local_path,
          quiet = TRUE
        )
      )
      is_valid <- TRUE
      file.remove(local_path)
    },
    error = function(e) {} # nolint ignore error
  )
  is_valid
}
