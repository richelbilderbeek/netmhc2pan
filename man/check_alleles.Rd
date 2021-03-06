% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_alleles.R
\name{check_alleles}
\alias{check_alleles}
\title{Check the allele names}
\usage{
check_alleles(
  alleles,
  netmhc2pan_folder_name = get_default_netmhc2pan_folder()
)
}
\arguments{
\item{alleles}{one or more alleles, e.g. \code{DRB1_0101}.
See \link{get_netmhc2pan_alleles} for a full list}

\item{netmhc2pan_folder_name}{the folder (to be) used by NetMHCIIpan.
From this location, a subfolder for NetMHCIIpan is created.
Use \link{get_default_netmhc2pan_folder} to see the location
of the default NetMHCIIpan folder.
Use \link{get_default_netmhc2pan_subfolder} to see the location
of the default NetMHCIIpan subfolder.}
}
\value{
nothing
}
\description{
Check if the alleles have a valid NetMHC2pan name.
Will \link{stop} if not.
}
\examples{
if (is_netmhc2pan_installed()) {
  check_alleles("DRB1_0101")
  check_alleles(c("DRB1_0102", "DRB1_0103"))
}
}
\seealso{
Use \link{to_netmhc2pan_name} to convert
a formal name to an NetMHC2pan name.
Use \link{get_netmhc2pan_alleles} for a list
of all supported alleles (in NetMHC2pan naming format).
}
\author{
Richèl J.C. Bilderbeek
}
