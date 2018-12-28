#' Install NetMHC2pan to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  download_url = NULL,
  folder_name = get_default_netmhc2pan_folder(),
  verbose = FALSE,
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  if (is.null(download_url)) { # nolint indeed long URL
    stop(
      "'download_url' is invalid. ",
      "Request a download URL at the NetMHC2pan request page at ",
      "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCIIpan"
    )
  }
  exe_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  if (file.exists(exe_path)) {
    stop("NetMHC2pan already installed")
  }

  dir.create(path = folder_name, showWarnings = FALSE, recursive = TRUE)

  archive_filename <- "netMHCIIpan-3.2.Linux.tar.gz"
  url <- file.path(download_url, archive_filename) 
  if (verbose == TRUE) {
    print(paste("Download from URL:", url))
  }
  local_path <- file.path(folder_name, archive_filename)
  utils::download.file(
    url = url,
    destfile = local_path
  )
  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(folder_name),
    verbose = verbose
  )
  if (verbose == TRUE) {
    print(paste("NetMHC2pan installed at", exe_path))
  }
  testit::assert(file.exists(exe_path))

}