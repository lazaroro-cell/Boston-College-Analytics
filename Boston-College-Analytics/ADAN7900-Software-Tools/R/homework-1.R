#---------------------------------------------------
#----- R Homework 01 Template
#---------------------------------------------------
  # Clear the workspace
  rm(list = ls()) # Clear environment
  gc()            # Clear memory
  cat("\f")       # Clear console

#---------------
#-- Question 1
#---------------
  # Define your fizz(n) function below:
  fizz <- function(n) {ifelse(n %% 3 == 0 ,return("Fizz"),return(""))
                              }
   
   
    
  # Use commands below to test your function:
  fizz(5L)  # integer input
  fizz(6L)  # integer input
  fizz(5)   # non-integer input
  fizz(6.3) # non-integer input

#---------------
#-- Question 2
#---------------
  # Define your buzz(n) function below:
  buzz <- function(n) 
     {ifelse(n %% 5 == 0, return("Buzz"),return(""))
  }
  
  # Use commands below to test your function:
  buzz(5L)  # integer input
  buzz(6L)  # integer input
  buzz(5)   # non-integer input
  buzz(6.3) # non-integer input

#---------------
#-- Question 3
#---------------
  # Define your fizzbuzz(n) function below:
  fizzbuzz <- function(n) {
    paste(fizz(n), buzz(n), sep = "")
  }
  # Use commands below to test your function:
  fizzbuzz(4L)  # integer input
  fizzbuzz(6L)  # integer input
  fizzbuzz(15L) # integer input
  fizzbuzz(4)   # non-integer input
  fizzbuzz(6.3) # non-integer input
  fizzbuzz(15)  # non-integer input

#---------------
#-- Question 4
#---------------
  # Define your fbr(n,m) function below:
  fb_keepint <- function(x) {
    fb <- fizzbuzz(x)
    fb_trim <- trimws(fb)            
    ifelse(fb_trim == "", x, fb_trim)
  }
  
  fbr <- function(n, m) {
    sapply(seq(n, m), fb_keepint)
  }
  
  # Use commands below to test your function:
  fbr(10L,15L)  # integer inputs
  
  # Version with error messages
  fbr_err <- function(n,m) {
    if (is.integer(n) & is.integer(m)) {
      if (n <= m) {
        x <- seq(from = n, to = m, by = 1)
        y <- rep(NA, length(x))
        for (i in 1:length(x)) {
          if (!fizzbuzz(x[i]) == "") {
            y[i] <- fizzbuzz(x[i])
          } else {
            y[i] <- x[i]
          }
        }
        return(y)    
      } else stop(n>m)
    } else stop(!is.integer(n) | !is.integer(m))
  }
  
 fbr_err(10,15)    # non-integer inputs (optional)

  fbr_err(15L, 10L) # n is larger than m (optional)

