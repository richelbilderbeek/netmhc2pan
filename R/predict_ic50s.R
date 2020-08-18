#' Predict the IC50s from a sequence
#' @inheritParams default_params_doc
#' @return a tibble with columns:\cr
#' \itemize{
#'   \item peptide the peptide fragment, each of length \code{peptide_length}
#'   \item ic50 the predicted IC50 (in nM)
#' }
#' The number of rows equals \code{protein_sequence - peptide_length + 1}.
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  mhc_haplotype,
  temp_fasta_filename = tempfile(fileext = ".fasta"),
  temp_xls_filename = tempfile(fileext = ".xls"),
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
) {
  fasta_text <- c(">seq1", protein_sequence)
  readr::write_lines(x = fasta_text, path = temp_fasta_filename)

  df <- netmhc2pan::run_netmhc2pan(
    fasta_filename = temp_fasta_filename,
    peptide_length = peptide_length,
    alleles = mhc_haplotype,
    temp_xls_filename = temp_xls_filename,
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  file.remove(temp_fasta_filename)
  file.remove(temp_xls_filename)

  Peptide <- NULL; rm(Peptide) # nolint, fixes warning: no visible binding for global variable
  nM <- NULL; rm(nM) # nolint, fixes warning: no visible binding for global variable

  tibble::as_tibble(df) %>%
    dplyr::select(
      peptide = Peptide,
      ic50 = nM
    )
}
