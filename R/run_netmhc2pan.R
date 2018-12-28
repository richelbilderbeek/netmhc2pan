#' Run NetMHC2pan
#' @inheritParams default_params_doc
#' @return a data frame with the NetMHC2pan results
#' @author Richel J.C. Bilderbeek
#' @export
run_netmhc2pan <- function(
  fasta_filename,
  folder_name = get_default_netmhc2pan_folder(),
  do_filter = FALSE,
  temp_xls_filename = tempfile(fileext = ".xls")
) {
  if (do_filter == TRUE) {
    do_filter <- 1
  } else {
    do_filter <- 0
  }
  testit::assert(file.exists(fasta_filename))
  temp_xls_filename
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  testit::assert(file.exists(bin_file_path))
  text <- system2(
    command = bin_file_path,
    args = c(
      "-filter", do_filter,
      "-xls", "1",
      "-xlsfile", temp_xls_filename,
      "-f", fasta_filename
    ),
    stdout = TRUE
  )
  if (!file.exists(temp_xls_filename)) {
    stop("Error:\n\n", text)
  }
  testit::assert(file.exists(temp_xls_filename))
  df_raw <- utils::read.csv(temp_xls_filename, sep = "\t",
    col.names = c(
      "Pos", "Peptide", "ID", "one_minus_log50k", "nM", "Rank", "Ave", "NB"
    ),
    header = FALSE
  )
  # Get rid of weird header
  df <- df_raw[c(-1, -2), ]
  df
}
