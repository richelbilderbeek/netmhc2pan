#' Uninstall NetMHCIIpan
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_netmhc2pan <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::uninstall_netmhc2pan() \n"
  )
}
