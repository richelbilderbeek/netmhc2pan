#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_bin_from_file <- function( # nolint indeed a long function name
  netmhc2pan_bin_tarfile_path,
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  if (verbose) {
    message(
      "Installing NetMHCIIpan binary from file '",
      netmhc2pan_bin_tarfile_path, "' into folder '", netmhc2pan_folder_name,
      "'. \n"
    )

  }
  bin_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )

  if (file.exists(bin_path)) {
    stop("NetMHCIIpan binary is already installed at '", bin_path, "'")
  }

  dir.create(
    path = netmhc2pan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )

  testit::assert(file.exists(netmhc2pan_bin_tarfile_path))
  # Linux has a tar file
  utils::untar(
    tarfile = netmhc2pan_bin_tarfile_path,
    exdir = path.expand(netmhc2pan_folder_name)
  )
  if (!file.exists(bin_path)) {
    stop("NetMHCIIpan binary not found at path '", bin_path, "'")
  }
  testit::assert(file.exists(bin_path))
}
