#' Install the NetMHCIIpan binary to a local folder
#'
#' Install the NetMHCIIpan binary to a local folder.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhc2pan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_bin <- function(
  netmhc2pan_bin_url = get_netmhc2pan_bin_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  temp_local_file = tempfile(pattern = "netmhc2pan_install_netmhc2pan_bin_")
) {
  bin_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  if (file.exists(bin_path)) {
    stop("NetMHCIIpan binary is already installed at '", bin_path, "'")
  }

  netmhc2pan_tarfile_path <- file.path(
    netmhc2pan_folder_name,
    netmhc2pan_archive_filename
  )
  dir.create(
    path = netmhc2pan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )
  netmhc2pan::check_can_create_file(
    filename = netmhc2pan_tarfile_path,
    overwrite = FALSE
  )
  netmhc2pan::download_netmhc2pan_bin(
    netmhc2pan_bin_url = netmhc2pan_bin_url,
    netmhc2pan_tarfile_path = netmhc2pan_tarfile_path,
    verbose = verbose,
    netmhc2pan_archive_filename = netmhc2pan_archive_filename,
    temp_local_file = temp_local_file
  )
  netmhc2pan::install_netmhc2pan_bin_from_file(
    netmhc2pan_tarfile_path = netmhc2pan_tarfile_path,
    verbose = verbose,
    netmhc2pan_archive_filename = netmhc2pan_archive_filename,
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  testthat::expect_true(file.exists(bin_path))
}
