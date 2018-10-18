
context("Results")

test_that("All Correct here",{
  expect_equal(as.numeric(fdvac()$FDVAC[1]),79.3846)
})
