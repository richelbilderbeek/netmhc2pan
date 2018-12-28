#' Run NetMHC2pan
#' @inheritParams default_params_doc
#' @return a data frame with the NetMHC2pan results
#' @author Richel J.C. Bilderbeek
#' @export
run_netmhc2pan <- function(
  fasta_filename,
  do_filter = FALSE
) {
  if (do_filter == TRUE) {
    do_filter <- 1
  } else { 
    do_filter <- 0 
  }
  testit::assert(file.exists(fasta_filename))
  xls_filename <- "/home/richel/test.xls"
  system2(
    command = "/home/richel/netMHCIIpan",
    args = c(
      "-filter", do_filter,
      "-xls", "1",
      "-xlsfile", xls_filename,
      "-f", fasta_filename
    ),
    stdout = NULL
  )
  testit::assert(file.exists(xls_filename))
  df_raw <- read.csv(xls_filename, sep = "\t", 
    col.names = c(
      "Pos", "Peptide", "ID", "one_minus_log50k", "nM", "Rank", "Ave", "NB"
    ),
    header = FALSE
  )
  # Get rid of weird header
  df <- df_raw[c(-1, -2), ]
}
