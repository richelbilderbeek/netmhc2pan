#' Get the full path to the default NetMHC2pan binary
#' @inheritParams default_params_doc
#' @return the full path to the default NetMHC2pan binary
#' @examples
#' get_default_netmhc2pan_bin_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhc2pan_bin_path <- function( # nolint indeed a long name, I keep it for the sake of readability
  netmhc2pan_subfolder = get_default_netmhc2pan_subfolder()
) {
  file.path(netmhc2pan_subfolder, "netMHCIIpan")
}
