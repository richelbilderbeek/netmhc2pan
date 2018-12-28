#' Measure if NetMHC2pan is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_installed <- function(
  folder_name = get_default_netmhc2pan_folder(),
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  file.exists(bin_file_path)
}