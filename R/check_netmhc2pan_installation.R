#' Checks the installation of NetMHCIIpan.
#'
#' Checks the installation of NetMHCIIpan.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' # Will stop if NetMHC2pan is not installed
#' try(check_netmhc2pan_installation())
#' @author Richèl J.C. Bilderbeek
#' @export
check_netmhc2pan_installation <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  if (!is_netmhc2pan_bin_installed(
    netmhc2pan_folder_name = netmhc2pan_folder_name)
  ) {
    bin_file_path <- file.path(
      netmhc2pan_folder_name,
      basename(get_default_netmhc2pan_subfolder()),
      basename(get_default_netmhc2pan_bin_path())
    )
    netmhc2pan_version <- stringr::str_match(
      bin_file_path,
      "[:digit:]\\.[:digit:]"
    )[1, 1]
    stop(
      "NetMHCIIpan binary not found at\n",
      bin_file_path, "\n",
      "\n",
      "Tip 1: from R, run 'netmhc2pan::install_netmhc2pan()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the NetMHCIIpan download page at\n",
      "\n",
      "https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2 \n",
      "(under the Downloads tab, use version 3.2)"
    )
  }
  if (!is_netmhc2pan_data_installed(netmhc2pan_folder_name)) {
    data_file_path <- file.path(
      netmhc2pan_folder_name,
      basename(get_default_netmhc2pan_subfolder()),
      "data"
    )
    stop(
      "NetMHCIIpan data not found at\n",
      data_file_path, "\n",
      "\n",
      "Tip: from R, run 'netmhc2pan::install_netmhc2pan()'\n"
    )
  }
  if (!is_netmhc2pan_set_up(netmhc2pan_folder_name)) {
    stop(
      "NetMHCIIpan not set up completely\n",
      "\n",
      "Tip: from R, run 'nethmhc2pan::install_netmhc2pan()'\n"
    )
  }
  if (!is_tcsh_installed()) {
    stop(
      "Debian package 'tcsh' not found\n",
      "\n",
      "Tip: from the terminal, run 'sudo apt install tcsh'"
    )
  }
}
