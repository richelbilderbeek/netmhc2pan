#' Is the haplotype valid?
#'
#' Determines if a haplotype has the same notation
#' as a NetMHC2pan haplotype
#' @inheritParams default_params_doc
#' @return TRUE if the haplotype is a valid NetMHCIIpan haplotype
#' @examples
#' is_netmhc2pan_haplotype("DRB1_0311")
#' is_netmhc2pan_haplotype("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhc2pan_haplotype <- function(mhc_haplotype) {
  mhc_haplotype %in% netmhc2pan::get_netmhc2pan_alleles()
}
