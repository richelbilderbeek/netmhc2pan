#' Convert a formal haplotype name to its NetMHC2pan notation
#'
#' Convert a formal MHC-II haplotype name to the notation used by NetMHC2pan.
#' @inheritParams default_params_doc
#' @return the haplotype name in NetMHC2pan notation
#' @examples
#' to_netmhc2pan_name("HLA-DRB1*0101")
#' to_netmhc2pan_name("HLA-DQA1*0501/DQB1*0201")
#' @export
to_netmhc2pan_name <- function(mhc_haplotype) {
  s <- stringr::str_replace_all(
    mhc_haplotype,
    "(DQ[:upper:][:digit:])\\*",
    "\\1"
  )
  s <- stringr::str_replace_all(
    s,
    "\\*",
    "_"
  )
  s <- stringr::str_replace_all(
    s,
    "/",
    "-"
  )
  stringr::str_replace(
    s,
    "^HLA-DR",
    "DR"
  )

}
