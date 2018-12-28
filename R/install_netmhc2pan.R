#' Install NetMHC2pan to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  download_url = NULL,
  folder_name = rappdirs::user_data_dir(),
  verbose = FALSE,
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  is_bin_installed <- is_netmhc2pan_bin_installed(
    folder_name = folder_name, os = os
  )
  is_data_installed <- is_netmhc2pan_data_installed(
    folder_name = folder_name, os = os
  )
  if (!is_bin_installed) {
    install_netmhc2pan_bin(
      download_url = download_url,
      folder_name = folder_name,
      verbose = verbose,
      os = os
    )
  }
  if (!is_data_installed) {
    install_netmhc2pan_data(
      folder_name = folder_name,
      verbose = verbose,
      os = os
    )
  }
}

#' Install the NetMHC2pan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan_bin <- function(
  download_url = get_download_url(),
  folder_name = rappdirs::user_data_dir(),
  verbose = FALSE,
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function
  bin_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  if (file.exists(bin_path)) {
    stop("NetMHC2pan binary is already installed")
  }

  dir.create(path = folder_name, showWarnings = FALSE, recursive = TRUE)

  archive_filename <- "netMHCIIpan-3.2.Linux.tar.gz"
  url <- file.path(download_url, archive_filename) 
  if (verbose == TRUE) {
    print(paste("Download from URL:", url))
  }
  local_path <- file.path(folder_name, archive_filename)
  tryCatch(
    utils::download.file(
      url = url,
      destfile = local_path
    ),
    error = function(e) {
      stop(
        "'download_url' is invalid.\n",
        "URL:", url, "\n",
        "Request a download URL at the NetMHC2pan request page at\n",
        "\n",
        "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCIIpan\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
    }
  )  

  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(folder_name),
    verbose = verbose
  )
  if (verbose == TRUE) {
    print(paste("NetMHC2pan installed at", bin_path))
  }
  testit::assert(file.exists(bin_path))
}

#' Install the NetMHC2pan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan_data <- function(
  folder_name = rappdirs::user_data_dir(),
  verbose = FALSE,
  os = rappdirs::app_dir()$os
) {
  check_os(os) # nolint netmhc2pan function

  data_folder_path <- file.path(folder_name, "netMHCIIpan-3.2", "data")
  if (file.exists(data_folder_path)) {
    stop("NetMHC2pan data already installed")
  }

  dir.create(path = folder_name, showWarnings = FALSE, recursive = TRUE)

  archive_filename <- "netMHCIIpan-3.2.Linux.tar.gz"
  url <- "http://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz"
  if (verbose == TRUE) {
    print(paste("Download from URL:", url))
  }
  local_path <- file.path(folder_name, "netMHCIIpan-3.2", "data.Linux.tar.gz")
  utils::download.file(
    url = url,
    destfile = local_path
  )
  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(file.path(folder_name, "netMHCIIpan-3.2")),
    verbose = verbose
  )

  if (verbose == TRUE) {
    print(paste("NetMHC2pan data extracted at", data_folder_path))
  }
  testit::assert(file.exists(data_folder_path))
}
