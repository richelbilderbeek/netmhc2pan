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
  is_netmhc2pan_bin_installed(folder_name = folder_name, os = os) && 
    is_netmhc2pan_data_installed(folder_name = folder_name, os = os)
}

#' Measure if NetMHC2pan binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan binary is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_bin_installed <- function(
  folder_name = get_default_netmhc2pan_folder(),
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  file.exists(bin_file_path)
}

#' Measure if NetMHC2pan data folder is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan data folder is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_data_installed <- function(
  folder_name = get_default_netmhc2pan_folder(),
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  data_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "data")
  file.exists(data_file_path)
}