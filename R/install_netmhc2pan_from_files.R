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
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::install_netmhc2pan_from_files() \n"
  )
}
