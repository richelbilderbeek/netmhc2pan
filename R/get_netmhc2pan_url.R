#' Get a NetMHCIIpan download URL
#'
#' Get a NetMHCIIpan download URL. These expire after 4 hours.
#' @seealso Use \link{is_url_valid} to determine if the download URL
#'   is still valid
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_url <- function() {
  "https://services.healthtech.dtu.dk/download/3e5c3e60-c43d-4cbc-913e-32ed9c3de31a" # nolint indeed a long URL
}
