#' Get the path to the folder where this package installs
#' NetMHC2pan by default
#' @return the path to the folder where this package installs
#'   NetMHC2pan by default
#' @author Richel J.C. Bilderbeek
#' @examples
#'   if (rappdirs::app_dir()$os == "unix") {
#'     testit::assert(
#'       grepl(
#'         "/home/[A-Za-z0-9_]*/.local/share",
#'         get_default_netmhc2pan_folder()
#'       )
#'     )
#'   }
get_default_netmhc2pan_folder <- function() {
  rappdirs::user_data_dir()
}
