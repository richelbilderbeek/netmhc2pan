#' Checks the installation of NetMHC2pan.
#' Throws a helpful error message if incomplete, 
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richel J.C. Bilderbeek
#' @export
check_netmhc2pan_installation <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  if (!is_netmhc2pan_bin_installed(folder_name = folder_name)) {
    bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
    stop(
      "NetMHC2pan binary not found at\n",
      bin_file_path, "\n",
      "\n",
      "Tip 1: from R, run 'netmhc2pan::install_netmhc2pan_bin()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the NetMHC2pan request page at\n",
      "\n",
      "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCIIpan\n"
    )
  }
  if (!is_netmhc2pan_data_installed(folder_name = folder_name)) {
    data_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "data")
    stop(
      "NetMHC2pan data not found at\n",
      data_file_path, "\n",
      "\n",
      "Tip: from R, run 'netmhc2pan::install_netmhc2pan_data()'\n"
    )
  }
  if (!is_netmhc2pan_set_up(folder_name = folder_name)) {
    stop(
      "NetMHC2pan not set up completely\n",
      "\n",
      "Tip: from R, run 'nethmhc2pan::set_up_netmhc2pan()'\n"
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
