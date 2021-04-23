# create an operator using a function
# it allows a function to be read fromn right to left
`%|%` <- function(x, FUN) FUN(x) 
3 %|% sin %|% cos # cos(sin(3))

# value replacement function
"re_code<-" <- function(x, old, value) {
  x[x == old] <- value
  x
}

hip_cost <- c(10500, 45000, 74100, -1, 83500, 86000, 38200, -1,
              44300, 12500, 55700, 43900, 71900, -1, 62000)

re_code(hip_cost, -1) <- NA # NA is the replacement value being passed to re_code
hip_cost

# applying function to each variable
sapply(mtcars, mean)

sapply(mtcars[,1:2], mean, simplify = FALSE)