remove.packages("netmhc2pan")
devtools::install_github("richelbilderbeek/netmhc2pan")
netmhc2pan::install_netmhc2pan(download_url = "https://services.healthtech.dtu.dk/download/504735c5-6875-402a-9962-34fc0f6568ee", verbose = TRUE)
netmhc2pan::install_netmhc2pan(download_url = "https://services.healthtech.dtu.dk/download/504735c5-6875-402a-9962-34fc0f6568ee", verbose = TRUE, temp_local_file = "temp_local.txt")
netmhc2pan::netmhc2pan_report()

