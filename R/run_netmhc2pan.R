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
  testit::assert(all(alleles %in% get_netmhc2pan_alleles())) # nolint netmhc2pan function
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
  df_raw <- utils::read.csv(temp_xls_filename, sep = "\t",
    col.names = c(
      "Pos", "Peptide", "ID",
      rep(c("one_minus_log50k", "nM", "Rank"), times = length(alleles)),
      "Ave", "NB"
    ),
    header = FALSE,
    stringsAsFactors = FALSE
  )
  # Convert to short form
  # Get rid of weird header
  df_short <- df_raw[c(-1, -2), ]
  # Get rid of 'Ave' and 'NB' column
  colnames(df_short)[ncol(df_short) - 1] == "Ave"
  colnames(df_short)[ncol(df_short) - 0] == "NB"
  df_short <- df_short[,c(-(ncol(df_short)-0), -(ncol(df_short)-1))]
  # Convert to final long form
  n_alleles <- length(alleles)
  n_rows <- nrow(df_short) # number of positions
  df <- data.frame(
    Pos = rep(df_short$Pos, times = n_alleles),
    Peptide = rep(df_short$Peptide, times = n_alleles),
    ID = rep(df_short$ID, times = n_alleles),
    Allele = rep(alleles, each = n_rows),
    one_minus_log50k = NA,
    nM = NA,
    Rank = NA,
    stringsAsFactors = FALSE
  )
  # one_minus_log50k
  for (i in seq_along(alleles)) {
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 4 + ((i - 1) * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col], 
      pattern = "one_minus_log50k")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + ((i - 1) * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$one_minus_log50k[to_row:to_row_last] <- from
  }
  # nM
  for (i in seq_along(alleles)) {
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 5 + ((i - 1) * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col], 
      pattern = "nM")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + ((i - 1) * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$nM[to_row:to_row_last] <- from
  }
  # Rank
  for (i in seq_along(alleles)) {
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 6 + ((i - 1) * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col], 
      pattern = "Rank")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + ((i - 1) * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$Rank[to_row:to_row_last] <- from
  }
  df
}
