#' Get the NetMHCIIpan binary download URL.
#'
#' Get the URL for the NetMHCIIpan binary, as is emailed.
#' These expire after 4 hours.
#' @seealso
#' Use \link{is_url_valid} to determine if the download URL is still valid.
#' Use \link{check_netmhc2pan_bin_url} to get a helpful error message if this
#' URL is invalid.
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_bin_url <- function() {
  "https://services.healthtech.dtu.dk/download/0adf4f0a-19dd-4d9f-add2-01618dae082d" # nolint indeed a long URL

}
