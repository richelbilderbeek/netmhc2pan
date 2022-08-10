#' Download the NetMHCIIpan binary
#'
#' Download the NetMHCIIpan binary tarball file
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhc2pan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
download_netmhc2pan_bin <- function(
  netmhc2pan_bin_url = get_netmhc2pan_bin_url(),
  netmhc2pan_bin_tarfile_path = get_default_netmhc2pan_bin_tarfile_path(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  temp_local_file = tempfile(pattern = "netmhc2pan_download_netmhc2pan_")
) {
  netmhc2pan::check_netmhc2pan_bin_url(
    netmhc2pan_bin_url = netmhc2pan_bin_url,
    verbose = verbose,
    netmhc2pan_archive_filename = netmhc2pan_archive_filename,
    temp_local_file = temp_local_file
  )

  url <- file.path(netmhc2pan_bin_url, netmhc2pan_archive_filename)

  if (verbose) {
    message(
      "Downloading NetMHCIIpan from ", netmhc2pan_bin_url,
      " (full URL is ", url, ") to ", netmhc2pan_bin_tarfile_path
    )
  }
  dir.create(
    path = dirname(netmhc2pan_bin_tarfile_path),
    showWarnings = FALSE,
    recursive = TRUE
  )

  netmhc2pan::check_can_create_file(
    filename = netmhc2pan_bin_tarfile_path,
    overwrite = FALSE
  )

  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = netmhc2pan_bin_tarfile_path,
        quiet = !verbose
      )
    ),
    error = function(e) {
      netmhc2pan_version <- stringr::str_match(
        netmhc2pan_archive_filename,
        "[:digit:]\\.[:digit:]"
      )[1, 1]
      stop(
        "'netmhc2pan_bin_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCIIpan request page at\n",
        "\n",
        "https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2 \n",
        "(under the Downloads tab, use version 3.2)\n",
        "\n",
        "Tip: see the YouTube video at https://youtu.be/08A_kf4v2UA\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
    }
  )
  testit::assert(file.exists(netmhc2pan_bin_tarfile_path))
}
