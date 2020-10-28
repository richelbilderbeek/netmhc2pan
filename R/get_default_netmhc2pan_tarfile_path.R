#' Get the default path for the NetMHCIIpan tarball file
#'
#' Get the default path for the NetMHCIIpan tarball file.
#' This is the location where it will be saved to after downloading.
#' @inheritParams default_params_doc
#' @return the path to the folder where this package installs
#'   NetMHCIIpan by default
#' @examples
#' get_default_netmhc2pan_tarfile_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhc2pan_tarfile_path <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename()
) {
  file.path(
    netmhc2pan_folder_name,
    netmhc2pan_archive_filename
  )
}
