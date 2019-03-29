#' Convert the first character to upper case
#' @author Richel J.C. Bilderbeek
#' @export
capitalize_first_char <- function(s) {
  testit::assert(is.character(s))
  testit::assert(nchar(s) > 0)
  substr(s, 1, 1) <- toupper(substr(s, 1, 1))
  s
}