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
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::install_netmhc2pan() \n"
  )
}
