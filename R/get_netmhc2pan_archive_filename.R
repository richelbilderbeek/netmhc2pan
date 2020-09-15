#' Get the filename of the NetMHC2pan archive file
#' @inheritParams default_params_doc
#' @return the filename of the NetMHC2pan archive file
#' @examples
#' get_netmhc2pan_archive_filename()
#' @export
get_netmhc2pan_archive_filename <- function( # nolint indeed a long function name
  netmhc2pan_version = get_default_netmhc2pan_version()
) {
  paste0("netMHCIIpan-", netmhc2pan_version, ".Linux.tar.gz")
}
