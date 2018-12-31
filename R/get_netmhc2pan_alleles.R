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
  testit::assert(is_netmhc2pan_installed()) # nolint netmhc2pan function
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  testit::assert(file.exists(bin_file_path))
  tryCatch(
    text <- system2(
      command = bin_file_path,
      args = c("-list"),
      stdout = TRUE
    ),
    error = function(msg) 
    {
      stop(
        "Call to NetMHC2pan failed\n",
        "bin_file_path: ", bin_file_path, "\n",
        "text:\n" , text, "\n",
        "error:\n", msg
      )
    }
  )
  text
}
