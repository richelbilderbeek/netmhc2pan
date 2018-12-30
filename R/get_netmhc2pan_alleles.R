#' Get a list of the alleles supported by NetMHC2pan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHC2pan alleles
#' @author Richel J.C. Bilderbeek
#' @export
get_netmhc2pan_alleles <- function(
  folder_name = get_default_netmhc2pan_folder()
) {
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  testit::assert(file.exists(bin_file_path))
  # Adding '-filter' and '1' top the args does not help: the XLS
  # file is created without the desired filter. The text output does
  # change.
  text <- system2(
    command = bin_file_path,
    args = c("-list"),
    stdout = TRUE
  )
  text
}