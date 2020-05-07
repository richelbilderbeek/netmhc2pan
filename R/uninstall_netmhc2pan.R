#' Uninstall NetMHCIIpan
#' @param folder_name name of the folder
#'   where the NetMHCIIpan files are installed.
#'   The name of the NetMHCIIpan binary file will be at
#'   \code{[folder_name]/[subfolder_basename]/netMHCIIpan}
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_netmhc2pan <- function(
  folder_name = rappdirs::user_data_dir()
) {
  if (!is_netmhc2pan_installed(folder_name = folder_name)
  ) {
    stop("Cannot uninstall absent NetMHCIIpan at folder '", folder_name, "'")
  }
  bin_file_path <- file.path(
    folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  file.remove(bin_file_path)
  data_folder_path <- file.path(
    folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data"
  )
  unlink(x = data_folder_path, recursive = TRUE)
}
