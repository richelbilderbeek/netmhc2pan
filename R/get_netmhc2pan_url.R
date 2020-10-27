#' Get a NetMHCIIpan download URL
#'
#' Get a NetMHCIIpan download URL. These expire after 4 hours.
#' @seealso Use \link{is_url_valid} to determine if the download URL
#'   is still valid
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_url <- function() {
  "https://services.healthtech.dtu.dk/download/504735c5-6875-402a-9962-34fc0f6568ee" # nolint indeed a long URL
}
