###################
#
# UNIVARIATE DATA #
#
###################

library(UsingR)

#
head(precip)

# sort
head(sort(precip, decreasing = TRUE))

# variables names
head(names(precip))

# named components
test_scores <- c(Alice = 87, Bob = 72, Shirley = 99)
test_scores

# assignment functions
test_scores <- c(87, 782, 99) # assign to variable
names(test_scores) <- c("Alice", "Bob", "Shirley") # set version of names()
test_scores

seq(0, 100, by=10)

seq(0, 100, length.out=5)

# indexing
precip[c("Seattle Tacoma", "New York")]

# return indices using match
match(c("Seattle Tacoma", "New York"), names(precip))

# combining strings
sprintf("X%s", 1:10)

# paste function
paste("X", 1:10, sep="")

### factors
x <- paste("X", rep(1:3, 4), sep="")
y <- factor(x)
y

# adding a factor
levels(y) <- c(levels(y), "X4")
y[1] <- "X4"
y

# change the labels names
levels(y) <- paste("label", 1:4, sep="")
levels(y)
y

# collapse levels
y <- factor(state.name[1:5])
y

levels(y) <- c("South", "West", "West", "South", "West")
y

# 50 levels
y <- factor(state.name)[1:5]
y

# levels are actual values
factor(y, levels = y)

# Generating new factors
r <- "red"; b <- "blue"; g <- "green"
factor(rep(c(r, g, b), c(5, 5, 5)))

# using gl function
gl(3, 5, labels=c("red", "green", "blue"))

# interaction between categorical variables
# the total number of levels is a combination of the factors of variable a and factors variable b
m <- head(Cars93)
out <- m$Origin : m$AirBags
out

## Date and time types
library(lubridate)

current_time <- now()
class(current_time)

# convert date to numeric
as.numeric(current_time)

# get month
month(current_time, label = TRUE)

# parse date
x <- "15-Feb-2013 07:57:34"
y <- parse_date_time(x, "dbYHMS")
year(y)

# arithmetic with dates
now() - days(1)

now() - hours(24)

# logical data
whale <-  c(74, 122, 235, 111, 292, 111, 211, 133, 156, 79)
whale > 100

# any function
any(whale > 50)

# all function
all(whale > 50)

# which function returns the indices of the TRUE values
which(whale < 100 | whale > 200)

# infix operator in
292 %in% whale

# any function
any(292 == whale)

# using match function
match(c(292, 293), whale)

## Coercion
# in sum, logic values are 1 TRUE and 0 FALSE
sum(whale > 200)

# indexing

# value greater than the mean
whale[whale > mean(whale)]

# values 1 standard deviation from the mean in either direction
whale[whale < mean(whale) - sd(whale) | whale > mean(whale) + sd(whale)]

# use index to remove na values
hip_cost[ !is.na(hip_cost)]

# get the indices of non na
which(!is.na(hip_cost))

# Example 2.1 Recording values
x <- babies$dwt
x[ x == 999] <- NA

range(x, na.rm = TRUE)

# Example 2.2 Using one variable to filter another
age <- kid.weights$age
ht <- kid.weights$height

ht[ age >= 48 & age < 60]


















