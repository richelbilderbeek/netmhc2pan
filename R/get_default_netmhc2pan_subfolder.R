#' Get the full path to the NetMHC2pan sub-folder
#' @return the full path to the NetMHC2pan sub-folder
#' @author Richel J.C. Bilderbeek
#' @export
get_default_netmhc2pan_subfolder <- function() { # nolint indeed a long name, I keep it for the sake of readability
  file.path(
    # Leave out the namespace in the next function:
    # The Travis build script sources this function before installing 
    # netmhc2pan. sourcing this will then result in a 'cannot find 
    # package ...' error
    get_default_netmhc2pan_folder(),
    "netMHCIIpan-3.2"
  )
}
