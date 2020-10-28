#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_bin_from_file <- function(
  download_url = get_netmhc2pan_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  bin_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  url <- file.path(download_url, netmhc2pan_archive_filename)
  local_path <- file.path(netmhc2pan_folder_name, netmhc2pan_archive_filename)

  if (verbose) {
    message(
      "Installing NetMHCIIpan from ", download_url,
      " (full URL is ", url, ") to ", local_path
    )
  }
  if (file.exists(bin_path)) {
    stop("NetMHCIIpan binary is already installed at '", bin_path, "'")
  }

  dir.create(
    path = netmhc2pan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )

  netmhc2pan::check_can_create_file(filename = local_path, overwrite = FALSE)

  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = local_path,
        quiet = !verbose
      )
    ),
    error = function(e) {
      netmhc2pan_version <- stringr::str_match(
        netmhc2pan_archive_filename,
        "[:digit:]\\.[:digit:]"
      )[1, 1]
      stop(
        "'download_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCIIpan request page at\n",
        "\n",
        paste0(
          "https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-",
          netmhc2pan_version,
          "\n"
        ),
        "\n",
        "Tip: see the YouTube video at https://youtu.be/08A_kf4v2UA\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
    }
  )

  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(netmhc2pan_folder_name)
  )
  if (!file.exists(bin_path)) {
    stop("NetMHCIIpan binary not found at path '", bin_path, "'")
  }
  testit::assert(file.exists(bin_path))
}
