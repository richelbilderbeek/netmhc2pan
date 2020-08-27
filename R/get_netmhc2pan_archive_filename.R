#' Get the filename of the NetMHC2pan archive file
#' @inheritParams default_params_doc
#' @export
get_netmhc2pan_archive_filename <- function(
  netmhc2pan_version = get_default_netmhc2pan_version()
) {
  paste0("netMHCIIpan-", netmhc2pan_version, ".Linux.tar.gz")
}
