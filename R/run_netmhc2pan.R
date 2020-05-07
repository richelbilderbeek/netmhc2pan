#' Run NetMHCIIpan
#' @inheritParams default_params_doc
#' @return a data frame with the NetMHCIIpan results
#' @examples
#'   testit::assert(is_netmhc2pan_installed())
#'
#'   fasta_filename <- system.file(
#'     "extdata", "example.fasta", package = "netmhc2pan"
#'   )
#'
#'   # One default allele
#'   df <- run_netmhc2pan(fasta_filename)
#'   testit::assert(
#'     all(
#'       colnames(df) ==
#'       c("Pos", "Peptide", "ID", "Allele", "one_minus_log50k", "nM", "Rank")
#'     )
#'   )
#'   testit::assert(nrow(df) == 9)
#'   testit::assert(all(df$Allele == "DRB1_0101"))
#'
#'   # Two alleles
#'   alleles <- c("DRB1_0101", "DRB1_0102")
#'   # Alleles must be in NetMHCIIpan
#'   testit::assert(all(alleles %in% get_netmhc2pan_alleles()))
#'   # Run NetMHCpan with these two alleles
#'   df <- run_netmhc2pan(fasta_filename, alleles = alleles)
#'   testit::assert(nrow(df) == 18)
#' @author Richèl J.C. Bilderbeek
#' @export
run_netmhc2pan <- function(
  fasta_filename,
  alleles = "DRB1_0101",
  folder_name = get_default_netmhc2pan_folder(),
  temp_xls_filename = tempfile(fileext = ".xls")
) {
  # Check input
  check_netmhc2pan_installation() # nolint netmhc2pan function
  if (!all(alleles %in% get_netmhc2pan_alleles())) {
    stop(
      "Invalid 'alleles'\n",
      "\n",
      "Tip: use 'netmhc2pan::get_netmhc2pan_alleles()' for a list\n",
      "     of all supported alleles"
    )
  }

  testit::assert(is_netmhc2pan_installed()) # nolint netmhc2pan function
  testit::assert(all(alleles %in% get_netmhc2pan_alleles())) # nolint netmhc2pan function
  testit::assert(file.exists(fasta_filename))
  bin_file_path <- file.path(
    folder_name,
    basename(get_default_netmhc2pan_subfolder()),
    basename(get_default_netmhc2pan_bin_path())
  )
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
  last_col_index <- ncol(df_short)
  one_but_last_col_index <- last_col_index - 1
  df_short <- df_short[, c(-last_col_index, -one_but_last_col_index)]
  # Convert to final long form
  n_alleles <- length(alleles)
  n_rows <- nrow(df_short) # number of positions
  df <- data.frame(
    Pos = rep(as.numeric(df_short$Pos), times = n_alleles),
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
    i_minus_one <- i - 1
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 4 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "one_minus_log50k")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$one_minus_log50k[to_row:to_row_last] <- from
  }
  # nM
  for (i in seq_along(alleles)) {
    i_minus_one <- i - 1
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 5 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "nM")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$nM[to_row:to_row_last] <- from # nolint use same variable as NetMHCIIpan, which is not all lowercase
  }
  # Rank
  for (i in seq_along(alleles)) {
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    i_minus_one <- i - 1
    from_col <- 6 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "Rank")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$Rank[to_row:to_row_last] <- from
  }
  df
}
