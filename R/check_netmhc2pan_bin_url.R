#' Check the URL of the NetMHCIIpan binary tarball
#'
#' Check the URL of the NetMHCIIpan binary tarball is valid,
#' will stop if not.
#' This URL link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_netmhc2pan_bin_url <- function(
  netmhc2pan_bin_url = get_netmhc2pan_bin_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  temp_local_file = tempfile(pattern = "check_netmhc2pan_bin_url_")
) {
  url <- file.path(netmhc2pan_bin_url, netmhc2pan_archive_filename)
  if (verbose) {
    message(
      "netmhc2pan_bin_url: ", netmhc2pan_bin_url, " \n",
      "netmhc2pan_archive_filename: ", netmhc2pan_archive_filename, " \n",
      "temp_local_file: ", temp_local_file, " \n",
      "url: ", url
    )
  }
  netmhc2pan::check_can_create_file(
    filename = temp_local_file,
    overwrite = FALSE
  )
  tryCatch({
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = temp_local_file,
        quiet = !verbose
      )
    )
  }, error = function(e) {
      stop(
        "'netmhc2pan_bin_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCIIpan request page at\n",
        "\n",
        "https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2 ",
        "(under the Downloads tab, use version 3.2)\n",
        "\n",
        "Tips:\n",
        " * you must request a download link for NetMHCIIpan v3.2\n",
        " * be quick: the download link expires in 4 hours\n",
        " * see the YouTube video at https://youtu.be/08A_kf4v2UA\n",
        "\n",
        "Note that I, the non-academic maintainer, ",
        "cannot test the installation of this package,\n",
        "as DTU will not make an exception for me.\n",
        "If my package fails installing NetMHCIIpan\n",
        "I may need your help.\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
  })
  file.remove(temp_local_file)
}
