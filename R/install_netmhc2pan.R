#' Install NetMHCIIpan to a local folder
#' @inheritParams default_params_doc
#' @examples 
#'   if (!is_netmhc2pan_installed()) install_netmhc2pan()
#'   testit::assert(is_netmhc2pan_installed())
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  download_url = get_netmhc2pan_url(),
  folder_name = rappdirs::user_data_dir()
) {
  is_bin_installed <- is_netmhc2pan_bin_installed(folder_name) # nolint netmhc2pan function
  if (!is_bin_installed) { # nolint netmhc2pan function
    install_netmhc2pan_bin( # nolint netmhc2pan function
      download_url = download_url,
      folder_name = folder_name
    )
  }
  is_data_installed <- is_netmhc2pan_data_installed(folder_name = folder_name) # nolint netmhc2pan function
  if (!is_data_installed) { # nolint netmhc2pan function
    install_netmhc2pan_data( # nolint netmhc2pan function
      folder_name = folder_name
    )
  }
  is_set_up <- is_netmhc2pan_set_up(folder_name = folder_name) # nolint netmhc2pan function
  if (!is_set_up) {
    set_up_netmhc2pan( # nolint netmhc2pan function
      folder_name = folder_name
    )
  }
  # Cannot install tcsh here
}

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan_bin <- function(
  download_url = get_netmhc2pan_url(),
  folder_name = rappdirs::user_data_dir()
) {
  bin_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  if (file.exists(bin_path)) {
    stop("NetMHCIIpan binary is already installed")
  }

  dir.create(path = folder_name, showWarnings = FALSE, recursive = TRUE)

  archive_filename <- "netMHCpan-4.0a.Linux.tar.gz"
  url <- file.path(download_url, archive_filename)
  local_path <- file.path(folder_name, archive_filename)
  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = local_path,
        quiet = TRUE
      )
    ),
    error = function(e) {
      stop(
        "'download_url' is invalid.\n",
        "URL:", url, "\n",
        "Request a download URL at the NetMHCIIpan request page at\n",
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
    exdir = path.expand(folder_name)
  )
  testit::assert(file.exists(bin_path))
}

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
install_netmhc2pan_data <- function(
  folder_name = rappdirs::user_data_dir()
) {
  data_folder_path <- file.path(folder_name, "netMHCIIpan-3.2", "data")
  if (file.exists(data_folder_path)) {
    stop("NetMHCIIpan data is already installed")
  }

  url <- "http://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz"
  local_path <- file.path(folder_name, "netMHCIIpan-3.2", "data.Linux.tar.gz")
  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  utils::download.file(
    url = url,
    destfile = local_path
  )
  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(file.path(folder_name, "netMHCIIpan-3.2"))
  )
  testit::assert(file.exists(data_folder_path))
}

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
set_up_netmhc2pan <- function(
  folder_name = rappdirs::user_data_dir()
) {
  bin_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  if (!file.exists(bin_path)) {
    stop(
      "NetMHCIIpan binary is absent at path '", bin_path, "'\n",
      "\n",
      "Tip: call 'netmhc2pan::install_netmhc2pan'\n",
      "     to install the NetMHCIIpan binary"
    )
  }
  lines <- readLines(bin_path)

  # Change sentenv
  setenv_line_idx <- which(
    lines == "setenv\tNMHOME\t/usr/cbs/bio/src/netMHCIIpan-3.2"
  )
  lines[setenv_line_idx] <- paste0("setenv\tNMHOME\t", dirname(bin_path))

  # Change temp folder
  tmpdir_line_idx <- which(
    lines == "\tsetenv  TMPDIR  /scratch"
  )
  lines[tmpdir_line_idx] <- "\tsetenv  TMPDIR  /tmp"

  writeLines(text = lines, con = bin_path)
}
