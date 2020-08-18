test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  fasta_filename <- tempfile(fileext = ".fasta")
  protein_sequence <- "FANTASTICALLY"
  peptide_length <- 13

  t <- predict_ic50s(
    protein_sequence = protein_sequence,
    peptide_length = peptide_length,
    mhc_haplotype = "HLA-DPA10105-DPB112501"
  )
  expect_equal(colnames(t), c("peptide", "ic50"))
  expect_true(is.character(t$peptide))
  expect_true(!is.factor(t$peptide))
  expect_true(is.numeric(t$ic50))
  expect_true(!is.factor(t$ic50))
  n_peptides <- nchar(protein_sequence) - peptide_length + 1
  expect_equal(n_peptides, nrow(t))
})
