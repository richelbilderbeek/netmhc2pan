#' Get the full path to the default NetMHC2pan binary
#' @author Richel J.C. Bilderbeek
#' @export
get_default_netmhc2pan_bin_path <- function() {
  file.path(
    get_default_netmhc2pan_subfolder(), "netMHCIIpan"
  )
}
