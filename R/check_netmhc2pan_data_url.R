#' Check the URL of the NetMHCIIpan binary tarball
#'
#' Check the URL of the NetMHCIIpan binary tarball is valid,
#' will stop if not.
#' This URL link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_netmhc2pan_data_url <- function(
  netmhc2pan_data_url = get_netmhc2pan_data_url(),
  verbose = FALSE,
  temp_local_file = tempfile(pattern = "check_netmhc2pan_data_url_")
) {
  if (verbose) {
    message(
      "'netmhc2pan_data_url': ", netmhc2pan_data_url, " \n",
      "'temp_local_file': ", temp_local_file, " \n"
    )
  }
  netmhc2pan::check_can_create_file(
    filename = temp_local_file,
    overwrite = FALSE
  )
  tryCatch({
    suppressWarnings(
      utils::download.file(
        url = netmhc2pan_data_url,
        destfile = temp_local_file,
        quiet = !verbose
      )
    )
  }, error = function(e) {
      stop(
        "'netmhc2pan_data_url' is invalid.\n",
        "netmhc2pan_data_url: ", netmhc2pan_data_url, "\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
  })
  file.remove(temp_local_file)
}
