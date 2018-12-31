#' Get a list of the alleles supported by NetMHC2pan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHC2pan alleles
#' @examples 
#'   alleles <- get_netmhc2pan_alleles()
#'   testit::assert(length(alleles) > 5000)
#'   testit::assert("DRB1_0101" %in% alleles)
#' @author Richel J.C. Bilderbeek
#' @export
get_netmhc2pan_alleles <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  testit::assert(file.exists(bin_file_path))
  text <- system2(
    command = bin_file_path,
    args = c("-list"),
    stdout = TRUE
  )
  text
}
