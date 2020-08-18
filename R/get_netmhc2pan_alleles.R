#' Get a list of the alleles supported by NetMHCIIpan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHCIIpan alleles
#' @examples
#' get_netmhc2pan_alleles()
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_alleles <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  netmhc2pan::check_netmhc2pan_installation()
  testit::assert(netmhc2pan::is_netmhc2pan_installed())
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
