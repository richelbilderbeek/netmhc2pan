#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param alleles one or more alleles, e.g. \code{DRB1_0101}.
#'   See \link{get_netmhc2pan_alleles} for a full list
#' @param do_filter set to TRUE if the results of NetMHCIIpan must be filtered
#' @param download_url NetMHCIIpan download URL, for example,
#'   \code{http://www.cbs.dtu.dk/download/12345678-1234-1234-1234-123456789ABC}
#' @param fasta_filename the name of a FASTA file with protein sequences
#' @param folder_name the folder to install NetMHCIIpan, which is
#'   \code{"/home/[usename]/.local/share"} by default
#' @param mhc_haplotype one MHC haplotype, e.g. \code{DRB1_0101}.
#'   See \link{get_netmhc2pan_alleles} for a full list
#' @param os the operating system as obtained by \code{rappdirs::app_dir()$os}.
#'   \code{netmhc2pan} supports Linux ('\code{unix}') only
#' @param peptide_length length of a peptide
#' @param protein_sequence a protein sequence, for example \code{FAMILYVW}
#' @param temp_xls_filename name for a temporary \code{xls} file
#' @param verbose set to TRUE for more output
#' @param xls_filename name of an \code{xls} file
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  alleles,
  do_filter,
  download_url,
  fasta_filename,
  folder_name,
  mhc_haplotype,
  os,
  peptide_length,
  protein_sequence,
  temp_xls_filename,
  verbose,
  xls_filename
) {
  # Nothing
}
