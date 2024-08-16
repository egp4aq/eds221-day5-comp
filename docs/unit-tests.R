# installing testing packages

#install.packages("testthat")
#install.packages("devtools")
#install.packages("remotes")

# load testing packages

#library(testthat)
#library(devtools)
#library(remotes)

mean_range <- function(df) {
  
  col_means <- apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE) 
  col_mean_max <- max(col_means) # finds max value of mean
  col_mean_min <- min(col_means) # finds min value of mean
  
  return(c(col_mean_min, col_mean_max))
}

mean_range(mtcars)

# making sure we get what we expect - namely that the result has a length of 2
expect_length(mean_range(mtcars), 2) # passes!
expect_length(mean_range(mtcars), 3) # fails

# making sure we get what we expect - namely that the min value comes before the max value --> meaning the first element returned would be less than the second element
expect_true(mean_range(mtcars)[1] < mean_range(mtcars)[2]) # passes!
expect_true(mean_range(mtcars)[2] < mean_range(mtcars)[1]) # fails
