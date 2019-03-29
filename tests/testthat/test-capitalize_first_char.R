context("test-capitalize_first_char")

test_that("use", {
  expect_equal(capitalize_first_char("hello"), "Hello")
  expect_equal(capitalize_first_char("Hello"), "Hello")
  expect_equal(capitalize_first_char("hello world"), "Hello world")
  expect_equal(capitalize_first_char("Hello world"), "Hello world")
})
