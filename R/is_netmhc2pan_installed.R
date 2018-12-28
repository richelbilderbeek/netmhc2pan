#' Measure if NetMHC2pan is installed locally
#' @return TRUE is NetMHC2pan is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_installed <- function(
  folder_name = get_default_netmhc2pan_folder(),
  os = rappdirs::app_dir()$os
) {
  TRUE
}