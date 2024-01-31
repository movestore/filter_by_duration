library('move2')

test_data <- test_data("input3.rds") #file must be move2!

test_that("happy path", {
  actual <- rFunction(data = test_data, rel= "above", "valu"= 12, "uni"= "month")
  expect_equal(nrow(actual), 2805)
})

test_that("year not included", {
  actual <- rFunction(data = test_data, rel= "below", "valu"= 1, "uni"= "month")
  expect_null(actual)
})
