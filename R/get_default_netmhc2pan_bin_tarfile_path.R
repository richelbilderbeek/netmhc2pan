#' Get the default path for the NetMHCIIpan binary tarball file
#'
#' Get the default path for the NetMHCIIpan binary tarball file.
#' This is the location where it will be saved to after downloading.
#' @inheritParams default_params_doc
#' @return the default path for the NetMHCIIpan binary tarball file
#' @examples
#' get_default_netmhc2pan_bin_tarfile_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhc2pan_bin_tarfile_path <- function( # nolint indeed a long function name
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename()
) {
  file.path(
    netmhc2pan_folder_name,
    netmhc2pan_archive_filename
  )
}
