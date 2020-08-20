#' Get a NetMHCIIpan download URL
#'
#' Get a NetMHCIIpan download URL. These expire after 4 hours.
#' @seealso Use \link{is_url_valid} to determine if the download URL
#'   is still valid
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_url <- function() {
  "https://services.healthtech.dtu.dk/download/9512eb7c-5f63-48d8-b3f5-22434f8aa7c4" # nolint indeed a long URL
}
