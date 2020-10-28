# Update packages
# remove.packages("netmhc2pan")
devtools::install_github("richelbilderbeek/netmhc2pan", ref = "develop")

# Location of the tar file.
# SET THE CORRECT PATH HERE
netmhc2pan_tarfile_path <- "netMHCIIpan-3.2.Linux.tar.gz"
if (1 == 2) {
  # Download it here, so I can check the script myself
  download_netmhc2pan(
    netmhc2pan_tarfile_path = netmhc2pan_tarfile_path
  )
}
testthat::expect_true(file.exists(netmhc2pan_tarfile_path))

# New install function
install_netmhc2pan_bin_from_file(
  netmhc2pan_tarfile_path = netmhc2pan_tarfile_path
)
testthat::expect_true(is_netmhc2pan_bin_installed())

# Use regular install function to take over the rest
install_netmhc2pan()
