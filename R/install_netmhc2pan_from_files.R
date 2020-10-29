#' Install NetMHCIIpan from files.
#'
#' Install NetMHCIIpan to a local folder from (already downloaded)
#' binary and date tarball files.
#' Use \link{install_netmhc2pan} to install
#' NetMHCIIpan by downloading these files
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCIIpan binary,
#'     using \link{install_netmhc2pan_bin_from_file}
#'   \item Install the NetMHCIIpan data,
#'     using \link{install_netmhc2pan_data_from_file}
#'   \item Set up NetMHCIIpan, using \link{set_up_netmhc2pan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_from_files <- function(
  netmhc2pan_bin_tarfile_path,
  netmhc2pan_data_tarfile_path,
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  temp_local_file = tempfile(pattern = "netmhc2pan_install_netmhc2pan_")
) {
  is_bin_installed <- netmhc2pan::is_netmhc2pan_bin_installed(
    netmhc2pan_folder_name = netmhc2pan_folder_name,
    verbose = verbose
  )
  if (!is_bin_installed) {
    if (verbose) {
      message(
        "NetMHCIIpan binary not found at folder '", netmhc2pan_folder_name,
        "'. \n"
      )
    }
    netmhc2pan::install_netmhc2pan_bin_from_file(
      netmhc2pan_bin_tarfile_path = netmhc2pan_bin_tarfile_path,
      verbose = verbose,
      netmhc2pan_archive_filename = netmhc2pan_archive_filename,
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  }
  is_data_installed <- netmhc2pan::is_netmhc2pan_data_installed(
    netmhc2pan_folder_name
  )
  if (!is_data_installed) { # nolint netmhc2pan function
    netmhc2pan::install_netmhc2pan_data_from_file(
      netmhc2pan_data_tarfile_path = netmhc2pan_data_tarfile_path,
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netmhc2pan::is_netmhc2pan_set_up(netmhc2pan_folder_name)
  if (!is_set_up) {
    if (verbose) {
      message(
        "NetMHCIIpan not set up at folder '", netmhc2pan_folder_name,
        "'. \n"
      )
    }
    netmhc2pan::set_up_netmhc2pan(
      netmhc2pan_folder_name,
      verbose = verbose
    )
  }
  # Cannot install tcsh here
}
