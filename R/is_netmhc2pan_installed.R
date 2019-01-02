#' Measure if NetMHC2pan is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_installed <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  is_netmhc2pan_bin_installed(folder_name = folder_name) &&
    is_netmhc2pan_data_installed(folder_name = folder_name) &&
    is_netmhc2pan_set_up(folder_name = folder_name) &&
    is_tcsh_installed()
}

#' Measure if NetMHC2pan binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan binary is installed locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_bin_installed <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
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
  folder_name = get_default_netmhc2pan_folder()
) {
  data_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "data")
  file.exists(data_file_path)
}

#' Measure if NetMHC2pan is set up
#' @inheritParams default_params_doc
#' @return TRUE is NetMHC2pan is set up locally,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_netmhc2pan_set_up <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  lines <- readLines(file_path)
  !any(grepl(x = lines, pattern = "/usr/cbs/bio/src/netMHCIIpan-3.2")) # nolint file does use absolute path
}

#' See if tcsh is installed 
#' @return TRUE is tcsh is installed,
#'   FALSE otherwise 
#' @author Richel J.C. Bilderbeek
#' @export
is_tcsh_installed <- function() {
  tryCatch(
    system2(command = "tcsh"),
    error = function(e) {
      return(FALSE)
    }
  )
  TRUE
}
