#' Get the full path to the NetMHC2pan sub-folder
#' @return the full path to the NetMHC2pan sub-folder
#' @author Richel J.C. Bilderbeek
#' @export
get_default_netmhc2pan_subfolder <- function() { # nolint indeed a long name, I keep it for the sake of readability
  file.path(
    netmhc2pan::get_default_netmhc2pan_folder(),
    "netMHCIIpan-3.2"
  )
}
