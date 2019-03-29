#' Get the full path to the NetMHC2pan subfolder
#' @return the full path to the NetMHC2pan subfolder
#' @author Richel J.C. Bilderbeek
#' @export
get_default_netmhc2pan_subfolder <- function() {
  file.path(get_default_netmhc2pan_folder(), "netMHCIIpan-3.2")
}