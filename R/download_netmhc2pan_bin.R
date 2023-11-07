#' Download the NetMHCIIpan binary
#'
#' Download the NetMHCIIpan binary tarball file
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
download_netmhc2pan_bin <- function(
  netmhc2pan_bin_url = get_netmhc2pan_bin_url(),
  netmhc2pan_bin_tarfile_path = get_default_netmhc2pan_bin_tarfile_path(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  temp_local_file = tempfile(pattern = "netmhc2pan_download_netmhc2pan_")
) {
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::download_netmhc2pan_bin() \n"
  )
}
