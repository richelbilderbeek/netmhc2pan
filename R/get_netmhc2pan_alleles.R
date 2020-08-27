#' Get a list of the alleles supported by NetMHCIIpan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHCIIpan alleles
#' @examples
#' if (is_netmhc2pan_installed()) {
#'   get_netmhc2pan_alleles()[1:5]
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhc2pan_alleles <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  netmhc2pan::check_netmhc2pan_installation(netmhc2pan_folder_name)
  testit::assert(netmhc2pan::is_netmhc2pan_installed(netmhc2pan_folder_name))
  bin_file_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  alleles <- system2(
    command = bin_file_path,
    args = c("-list"),
    stdout = TRUE
  )

  # Remove the tab-duplicated alleles
  #
  # Find the duplicate indices, verify the name
  # before and after tab is exactly the same
  duplicate_indices <- which(
    stringr::str_count(alleles, pattern = "\t") != 0
  )
  for (i in duplicate_indices) {
    duplicate_allele <- alleles[i]
    s <- stringr::str_split(duplicate_allele, pattern = "\t")[[1]]
    testthat::expect_equal(s[1], s[2])
    alleles[i] <- s[1]
  }

  alleles
}
