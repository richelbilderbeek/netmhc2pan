test_that("use", {
  expect_equal(
    get_netmhc2pan_data_url(),
    "https://services.healthtech.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz"
  )
})
