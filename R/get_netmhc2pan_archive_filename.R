#' Get the filename of the NetMHC2pan archive file
#' @export
get_netmhc2pan_archive_filename <- function(
  netmhc2pan_version = get_default_netmhc2pan_version()
) { #nolint indeed a long function
  paste0("netMHCIIpan-", netmhc2pan_version, ".Linux.tar.gz")
}
