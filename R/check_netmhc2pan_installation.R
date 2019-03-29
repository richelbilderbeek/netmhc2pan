#' Checks the installation of NetMHCIIpan.
#' Throws a helpful error message if incomplete, 
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples 
#'   check_netmhc2pan_installation()
#' @author Richel J.C. Bilderbeek
#' @export
check_netmhc2pan_installation <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  if (!is_netmhc2pan_bin_installed(folder_name = folder_name)) {
    bin_file_path <- file.path(
      folder_name, 
      basename(get_default_netmhc2pan_subfolder()), 
      basename(get_default_netmhc2pan_bin_path())
    )
    stop(
      "NetMHCIIpan binary not found at\n",
      bin_file_path, "\n",
      "\n",
      "Tip 1: from R, run 'netmhc2pan::install_netmhc2pan()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the NetMHCIIpan request page at\n",
      "\n",
      "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCIIpan\n"
    )
  }
  if (!is_netmhc2pan_data_installed(folder_name = folder_name)) {
    data_file_path <- file.path(
      folder_name, 
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
  if (!is_netmhc2pan_set_up(folder_name = folder_name)) {
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
