#' Get a NetMHCIIpan download URL
#'
#' Get a NetMHCIIpan download URL. These expire after 4 hours.
#' @seealso Use \link{is_url_valid} to determine if the download URL
#'   is still valid
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_url <- function() {
  "https://services.healthtech.dtu.dk/download/f219f0b1-70c0-495b-94b1-64c4cb356919" # nolint indeed a long URL
}
