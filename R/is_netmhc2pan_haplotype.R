#' Is the haplotype valid?
#'
#' Determines if a haplotype has the same notation
#' as a NetMHC2pan haplotype
#' @inheritParams default_params_doc
#' @export
is_netmhc2pan_haplotype <- function(mhc_haplotype) {
  mhc_haplotype %in% get_netmhc2pan_alleles()
}
