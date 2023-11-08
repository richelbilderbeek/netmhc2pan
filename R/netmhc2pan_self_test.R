#' Test NetMHCIIpan by doing a minimal run.
#' @inheritParams default_params_doc
#' @return Nothing. If the self-test fails, an error will be raised
#' @author Richèl J.C. Bilderbeek
#' @export
netmhc2pan_self_test <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  verbose = FALSE
) {
  netmhc2pan::check_netmhc2pan_installation(
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhc2pan"
  )
  netmhc2pan::run_netmhc2pan(
    fasta_filename = fasta_filename,
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  invisible(netmhc2pan_folder_name)
}
