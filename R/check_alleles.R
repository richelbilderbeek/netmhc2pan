#' Check the allele names
#'
#' Check if the alleles have a valid NetMHC2pan name.
#' Will \link{stop} if not.
#' @seealso Use \link{to_netmhc2pan_name} to convert
#' a formal name to an NetMHC2pan name.
#' Use \link{get_netmhc2pan_alleles} for a list
#' of all supported alleles (in NetMHC2pan naming format).
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_netmhc2pan_installed()) {
#'   check_alleles("DRB1_0101")
#'   check_alleles(c("DRB1_0102", "DRB1_0103"))
#' }
#' @export
check_alleles <- function(
  alleles,
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  if (!all(alleles %in% netmhc2pan::get_netmhc2pan_alleles(
      netmhc2pan_folder_name = netmhc2pan_folder_name)
    )
  ) {
    stop(
      "Invalid 'alleles'\n",
      "\n",
      "Tip 1: use 'netmhc2pan::to_netmhc2pan_name()' to convert \n",
      "       a formal name to an NetMHC2pan name. \n",
      "Tip 2: use 'netmhc2pan::get_netmhc2pan_alleles()' for a list\n",
      "       of all supported alleles"

    )
  }
}
