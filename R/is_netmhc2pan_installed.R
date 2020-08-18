#' Measure if NetMHCIIpan is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhc2pan_installed <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  is_netmhc2pan_bin_installed(netmhc2pan_folder_name) &&
    is_netmhc2pan_data_installed(netmhc2pan_folder_name) &&
    is_netmhc2pan_set_up(netmhc2pan_folder_name) &&
    is_tcsh_installed()
}

#' Measure if NetMHCIIpan binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan binary is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhc2pan_bin_installed <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  bin_file_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  file.exists(bin_file_path)
}

#' Measure if NetMHCIIpan data folder is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan data folder is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhc2pan_data_installed <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  data_file_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data"
  )
  file.exists(data_file_path)
}

#' Measure if NetMHCIIpan is set up
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan is set up locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhc2pan_set_up <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  file_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  lines <- readLines(file_path)
  # Used to be: !any(grepl(x = lines, pattern = "/usr/cbs/bio/src/netMHCIIpan-3.2")) # nolint file does use absolute path
  !any(
    grepl(
      x = lines,
      pattern = paste0(
        "/usr/cbs/bio/src/",  # nolint file does use absolute path
        basename(get_default_netmhc2pan_subfolder())
      )
    )
  )
}

#' See if tcsh is installed
#' @return TRUE is tcsh is installed,
#'   FALSE otherwise
#' @note To install \code{tcsh} under Linux, do \code{sudo apt install tcsh}
#' @author Richèl J.C. Bilderbeek
#' @export
is_tcsh_installed <- function() {
  error_code <- NA
  tryCatch(
    suppressWarnings(
      error_code <- system2(
        command = "tcsh",
        args = "--version",
        stdout = FALSE,
        stderr = FALSE
      )
    ),
    error = function(e) {
      return(FALSE)
    }
  )
  error_code == 0
}
