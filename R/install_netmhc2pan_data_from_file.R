#' Install the NetMHCIIpan data from file
#'
#' Install the NetMHCIIpan data from the NetMHCIIpan data tarball file
#' to the default NetMHCIIpan folder.
#'
#' The NetMHCIIpan data tarball file can be in any path.
#'
#' The data tarball file can be downloaded from
#' \url{https://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz},
#' without filling in a contact form.
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_data_from_file <- function( # nolint long function name indeed
  netmhc2pan_data_tarfile_path,
  netmhc2pan_folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::install_netmhc2pan_data_from_file() \n"
  )
}
