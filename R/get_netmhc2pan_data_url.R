#' Get the NetMHCIIpan data tarball URL.
#'
#' Get the NetMHCIIpan data tarball URL.
#' @seealso
#' Use \link{is_url_valid} to determine if the download URL is still valid.
#' Use \link{check_netmhc2pan_data_url} to get a helpful error message if this
#' URL is invalid.
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_data_url <- function() {
  file.path(
    "https://www.cbs.dtu.dk/services",
    netmhc2pan::capitalize_first_char(
      basename(
        netmhc2pan::get_default_netmhc2pan_subfolder()
      )
    ),
    "data.Linux.tar.gz"
  )

}
