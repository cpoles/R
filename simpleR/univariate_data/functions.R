############

# FUNCTIONS #

############
library(UsingR)


# PROBLEMS

# 2.22 Write a function to compute the average distance from the mean for some data vector.
avg_distance <- function(x) {
  abs(x - mean(x))
}

avg_distance(c(1,2,3,4,5,2,3,2,7,8,5,9,8,8,7,8))

# 2.23 Write a function f which finds the average of the x values after squaring
# and subtracts the square of the average of the numbers. Verify this output
# will always be non-negative by computing f(1:10).

f <- function(x) {
  mean(x^2) - mean(x)^2 
}

f(1:10)

# 2.24 An integer is even if the remainder upon dividing it by 2 is 0. This remainder
# is given by R with the syntax x %% 2. Use this to write a function
# iseven that indicates if a number is even. How would you write isodd?

iseven <- function(x) {
  x %% 2 == 0
}

isodd <- function(x){
  !iseven(x)
}

iseven(3)
isodd(3)


# 2.25 Write a function isprime that checks if a number x is prime by dividing
# x by all the values in 2, . . . , x 􀀀 1 then checking to see if there is a remainder
# of 0. The expression a %% b returns the remainder of a divided by b.

isprime <- function(x) {
  divs <- 2:(x-1)
  remainders <- x %% divs
  all(remainders != 0)
}



