#' Get the full path to the NetMHC2pan sub-folder
#' @inheritParams default_params_doc
#' @return the full path to the NetMHC2pan sub-folder
#' @examples
#' get_default_netmhc2pan_subfolder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhc2pan_subfolder <- function( # nolint indeed a long function name
  netmhc2pan_folder_name = get_default_netmhc2pan_folder(),
  netmhc2pan_version = get_default_netmhc2pan_version()
) { # nolint indeed a long name, I keep it for the sake of readability
  file.path(
    # Leave out the namespace in the next function:
    # The Travis build script sources this function before installing
    # netmhc2pan. sourcing this will then result in a 'cannot find
    # package netmhc2pan' error
    netmhc2pan_folder_name,
    paste0("netMHCIIpan-", netmhc2pan_version)
  )
}
