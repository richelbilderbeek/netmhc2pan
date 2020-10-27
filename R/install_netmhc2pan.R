#' Install NetMHCIIpan
#'
#' Install NetMHCIIpan to a local folder.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan <- function(
  download_url = get_netmhc2pan_url(),
  verbose = FALSE,
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  temp_local_file = tempfile(pattern = "netmhc2pan_install_netmhc2pan_")
) {
  netmhc2pan::check_download_url(
    download_url = download_url,
    verbose = verbose,
    netmhc2pan_archive_filename = netmhc2pan_archive_filename,
    temp_local_file = temp_local_file
  )
  is_bin_installed <- netmhc2pan::is_netmhc2pan_bin_installed(
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  if (!is_bin_installed) {
    netmhc2pan::install_netmhc2pan_bin(
      download_url = download_url,
      netmhc2pan_archive_filename = netmhc2pan_archive_filename,
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  }
  is_data_installed <- netmhc2pan::is_netmhc2pan_data_installed(
    netmhc2pan_folder_name
  )
  if (!is_data_installed) { # nolint netmhc2pan function
    netmhc2pan::install_netmhc2pan_data(netmhc2pan_folder_name)
  }
  is_set_up <- netmhc2pan::is_netmhc2pan_set_up(netmhc2pan_folder_name)
  if (!is_set_up) {
    netmhc2pan::set_up_netmhc2pan(netmhc2pan_folder_name)
  }
  # Cannot install tcsh here
}

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_bin <- function(
  download_url = get_netmhc2pan_url(),
  netmhc2pan_archive_filename = get_netmhc2pan_archive_filename(),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  bin_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
  if (file.exists(bin_path)) {
    stop("NetMHCIIpan binary is already installed")
  }

  dir.create(
    path = netmhc2pan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )

  url <- file.path(download_url, netmhc2pan_archive_filename)
  local_path <- file.path(netmhc2pan_folder_name, netmhc2pan_archive_filename)
  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = local_path,
        quiet = TRUE
      )
    ),
    error = function(e) {
      netmhc2pan_version <- stringr::str_match(
        netmhc2pan_archive_filename,
        "[:digit:]\\.[:digit:]"
      )[1, 1]
      stop(
        "'download_url' is invalid.\n",
        "URL:", url, "\n",
        "Request a download URL at the NetMHCIIpan request page at\n",
        "\n",
        paste0(
          "https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-",
          netmhc2pan_version,
          "\n"
        ),
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
    exdir = path.expand(netmhc2pan_folder_name)
  )
  if (!file.exists(bin_path)) {
    stop("NetMHCIIpan binary not found at path '", bin_path, "'")
  }
  testit::assert(file.exists(bin_path))
}

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_netmhc2pan_data()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhc2pan_data <- function(
  netmhc2pan_folder_name = rappdirs::user_data_dir()
) {
  data_folder_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data"
  )
  if (file.exists(data_folder_path)) {
    stop("NetMHCIIpan data is already installed")
  }

  url <- file.path(
    "https://www.cbs.dtu.dk/services",
    capitalize_first_char(basename(get_default_netmhc2pan_subfolder())),
    "data.Linux.tar.gz"
  )
  local_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    "data.Linux.tar.gz"
  )
  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  utils::download.file(
    url = url,
    destfile = local_path
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

#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   set_up_netmhc2pan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
set_up_netmhc2pan <- function(
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  bin_path <- file.path(
    netmhc2pan_folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
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
    lines == paste0(
      "setenv\tNMHOME\t/usr/cbs/bio/src/",
      basename(get_default_netmhc2pan_subfolder())
    )
  )
  lines[setenv_line_idx] <- paste0("setenv\tNMHOME\t", dirname(bin_path))

  # Change temp folder
  tmpdir_line_idx <- which(
    lines == "\tsetenv  TMPDIR  /scratch"
  )
  lines[tmpdir_line_idx] <- "\tsetenv  TMPDIR  /tmp"

  writeLines(text = lines, con = bin_path)
}
