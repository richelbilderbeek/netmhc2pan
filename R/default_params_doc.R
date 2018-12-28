#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param do_filter set to TRUE if the results of NetMHC2pan must be filtered
#' @param download_url NetMHC2pan download URL, for example,
#'   \code{http://www.cbs.dtu.dk/download/12345678-1234-1234-1234-123456789ABC}
#' @param fasta_filename the name of a FASTA file with protein sequences
#' @param folder_name the folder to install NetMHC2pan, which is
#'   \code{"/home/[usename]/.local/share"} by default
#' @param os the operating system as obtained by \code{rappdirs::app_dir()$os}.
#'   \code{netmhc2pan} supports Linux ('\code{unix}') only
#' @param temp_xls_filename name for a temporary \code{xls} filename
#' @param verbose set to TRUE for more output
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  do_filter,
  download_url,
  fasta_filename,
  folder_name,
  os,
  temp_xls_filename,
  verbose
) {
  # Nothing
}
