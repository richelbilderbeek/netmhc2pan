#' Install NetMHCIIpan
#'
#' Install NetMHCIIpan to a local folder.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  download_url = get_netmhc2pan_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  temp_local_file = tempfile(pattern = "netmhc2pan_install_netmhc2pan_")
) {
  netmhc2pan::check_download_url(
    download_url = download_url,
    verbose = verbose,
    netmhc2pan_archive_filename = netmhc2pan_archive_filename,
    temp_local_file = temp_local_file
  )
  is_bin_installed <- netmhc2pan::is_netmhc2pan_bin_installed(
    netmhc2pan_folder_name = netmhc2pan_folder_name,
    verbose = verbose
  )
  if (!is_bin_installed) {
    netmhc2pan::install_netmhc2pan_bin(
      download_url = download_url,
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
