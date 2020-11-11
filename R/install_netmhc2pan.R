#' Install NetMHCIIpan
#'
#' Install NetMHCIIpan to a local folder, by downloading the binary and
#' data files. Use \link{install_netmhc2pan_from_files} to install
#' NetMHCIIpan from files that are already downloaded.
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCIIpan binary, using \link{install_netmhc2pan_bin}
#'   \item Install the NetMHCIIpan data, using \link{install_netmhc2pan_data}
#'   \item Set up NetMHCIIpan, using \link{set_up_netmhc2pan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhc2pan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  netmhc2pan_bin_url = get_netmhc2pan_bin_url(),
  netmhc2pan_data_url = get_netmhc2pan_data_url(),
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
    netmhc2pan::install_netmhc2pan_bin(
      netmhc2pan_bin_url = netmhc2pan_bin_url,
      verbose = verbose,
      netmhc2pan_archive_filename = netmhc2pan_archive_filename,
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  }
  is_data_installed <- netmhc2pan::is_netmhc2pan_data_installed(
    netmhc2pan_folder_name
  )
  if (!is_data_installed) { # nolint netmhc2pan function
    netmhc2pan::install_netmhc2pan_data(
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netmhc2pan::is_netmhc2pan_set_up(netmhc2pan_folder_name)
  if (!is_set_up) {
    netmhc2pan::set_up_netmhc2pan(netmhc2pan_folder_name)
  }
  # Cannot install tcsh here
}
