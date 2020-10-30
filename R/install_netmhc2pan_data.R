#' Install the NetMHCIIpan data to a local folder
#'
#' Install the NetMHCIIpan data to a local folder.
#'
#' This data can be downloaded from
#' \url{https://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz},
#' without filling in a contact form.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan_data()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_data <- function(
  netmhc2pan_data_url = get_netmhc2pan_data_url(),
  netmhc2pan_folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  data_folder_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data"
  )
  if (file.exists(data_folder_path)) {
    stop("NetMHCIIpan data is already installed")
  }

  local_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data.Linux.tar.gz"
  )

  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  netmhc2pan::check_can_create_file(filename = local_path, overwrite = FALSE)

  utils::download.file(
    url = netmhc2pan_data_url,
    destfile = local_path,
    quiet = !verbose
  )
  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(
      file.path(
        netmhc2pan_folder_name,
        basename(get_default_netmhc2pan_subfolder())
      )
    )
  )
  testit::assert(file.exists(data_folder_path))
}
