% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uninstall_netmhc2pan.R
\name{uninstall_netmhc2pan}
\alias{uninstall_netmhc2pan}
\title{Uninstall NetMHC2pan}
\usage{
uninstall_netmhc2pan(folder_name = rappdirs::user_data_dir(),
  os = rappdirs::app_dir()$os)
}
\arguments{
\item{folder_name}{name of the folder 
where the NetMHC2pan files are installed.
The name of the NetMHC2pan binary file will be at
\code{[folder_name]/netMHCIIpan-3.2/netMHCIIpan}}

\item{os}{the operating system as obtained by \code{rappdirs::app_dir()$os}.
\code{netmhc2pan} supports Linux ('\code{unix}') only}
}
\description{
Uninstall NetMHC2pan
}
\author{
Richel J.C. Bilderbeek
}