#' Install the NetMHCIIpan data from file
#'
#' Install the NetMHCIIpan data from the NetMHCIIpan data tarball file
#' to the default NetMHCIIpan folder.
#'
#' The NetMHCIIpan data tarball file can be in any path.
#'
#' The data tarball file can be downloaded from
#' \url{https://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz},
#' without filling in a contact form.
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_data_from_file <- function(
  netmhc2pan_data_tarfile_path,
  netmhc2pan_folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  testthat::expect_true(file.exists(netmhc2pan_data_tarfile_path))
  data_folder_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data"
  )
  if (file.exists(data_folder_path)) {
    stop("NetMHCIIpan data is already installed at '", data_folder_path ,"'")
  }

  local_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data.Linux.tar.gz"
  )

  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  netmhc2pan::check_can_create_file(filename = local_path, overwrite = FALSE)

  # Linux has a tar file
  utils::untar(
    tarfile = netmhc2pan_data_tarfile_path,
    exdir = path.expand(
      file.path(
        netmhc2pan_folder_name,
        basename(get_default_netmhc2pan_subfolder())
      )
    )
  )
  testit::assert(file.exists(data_folder_path))
}
