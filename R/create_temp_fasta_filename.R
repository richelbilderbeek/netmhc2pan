#' Create a \code{.fasta} file
#' @export
create_temp_fasta_filename <- function() {
  tempfile(
    pattern = "temp_",
    tmpdir = rappdirs::user_cache_dir(),
    fileext = ".fasta"
  )
}
