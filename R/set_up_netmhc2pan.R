#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
set_up_netmhc2pan <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  verbose = FALSE
) {
  stop(
    "Deprecated, as this violates CRAN policy.\n ",
    " \n",
    "Tip: use 'netmhc2paninstall' from \n",
    "https://github.com/richelbilderbeek/netmhc2paninstall: \n",
    " \n",
    "remotes::install_github(\"richelbilderbeek/netmhc2paninstall\") \n",
    "netmhc2paninstall::set_up_netmhc2pan() \n"
  )
}
