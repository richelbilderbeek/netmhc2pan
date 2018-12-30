#' Run NetMHC2pan
#' @inheritParams default_params_doc
#' @return a data frame with the NetMHC2pan results
#' @author Richel J.C. Bilderbeek
#' @export
run_netmhc2pan <- function(
  fasta_filename,
  alleles = "DRB1_0101",
  folder_name = get_default_netmhc2pan_folder(),
  temp_xls_filename = tempfile(fileext = ".xls")
) {
  testit::assert(all(alleles %in% get_netmhc2pan_alleles()))
  testit::assert(file.exists(fasta_filename))
  bin_file_path <- file.path(folder_name, "netMHCIIpan-3.2", "netMHCIIpan")
  testit::assert(file.exists(bin_file_path))
  # Adding '-filter' and '1' top the args does not help: the XLS
  # file is created without the desired filter. The text output does
  # change.
  text <- system2(
    command = bin_file_path,
    args = c(
      "-a", paste0(alleles, sep = ",", collapse = ""),
      "-xls", "1",
      "-xlsfile", temp_xls_filename,
      "-f", fasta_filename
    ),
    stdout = NULL
  )
  if (!file.exists(temp_xls_filename)) {
    stop("Error:\n\n", text)
  }
  testit::assert(file.exists(temp_xls_filename))
  #readLines(temp_xls_filename)
  #utils::read.csv(temp_xls_filename, sep = "\t", header = FALSE)
  df_raw <- utils::read.csv(temp_xls_filename, sep = "\t",
    col.names = c(
      "Pos", "Peptide", "ID", 
      rep(c("one_minus_log50k", "nM", "Rank"), times = length(alleles)),   
      "Ave", "NB"
    ),
    header = FALSE
  )
  # Get rid of weird header
  df <- df_raw[c(-1, -2), ]
  df
}
