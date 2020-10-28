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
