#' Get a list of the alleles supported by NetMHCIIpan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHCIIpan alleles
#' @examples
#'   alleles <- get_netmhc2pan_alleles()
#'   testit::assert(length(alleles) > 5000)
#'   testit::assert("DRB1_0101" %in% alleles)
#' @author Richel J.C. Bilderbeek
#' @export
get_netmhc2pan_alleles <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  check_netmhc2pan_installation() # nolint netmhc2pan function
  testit::assert(is_netmhc2pan_installed()) # nolint netmhc2pan function
  bin_file_path <- file.path(
    folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  system2(
    command = bin_file_path,
    args = c("-list"),
    stdout = TRUE
  )
}
