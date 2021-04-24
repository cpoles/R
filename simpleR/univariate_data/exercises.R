############

# PROBLEMS #

############
library(UsingR)

# 2.1 Enter the following data into a variable p using c
# 2 3 5 7 11 13 17 19
# Use length to check its length.

numbers <- c(2, 3, 5, 7, 11, 13, 17, 19)
length(numbers)

# 2.2 Al recorded his car’s mileage at gust last eight fill-ups:
#  65311 65624 65908 66219 66499 66821 67145 67447
# Enter these numbers into the variable gas. Use the function diff on the
# data. What does it give? Interpret what both of these commands return:
#  mean(gas) and mean(diff(gas)).

gas <- c(65311, 65624, 65908, 66219, 66499, 66821, 67145, 67447)
diff(gas)

mean(gas) # mean of gas
mean(diff(gas)) # mean of the difference of gas

# 2.3 Let our small data set be
# 2 5 4 10 8
# 1. Enter this data into a data vector x.
x <- c(2, 5, 4, 10, 8)
# 2. Find the square of each number.
sqrt(x)
# 3. Subtract 6 from each number.
x - 6
# 4. Subtract 9 from each number and then square the answers.
# Use the vectorization of functions to do so.
(x - 9) ^ 2


# 2.4 Create the following sequences:
# 1. "a", "a", "a", "a", "a"
rep("a", 5)

# 2. 1, 3, . . . , 99 (the odd numbers in [1,100])
seq(1, 100, by=2)

# 3. 1, 1, 1, 2, 2, 2, 3, 3, 3
rep(c(1,2,3), times=c(3, 3, 3))

# 4. 1, 1, 1, 2, 2, 3
rep(c(1,2,3), times=c(3, 2, 1))

#or
rep(1:3, times=3:1)

# 5. 1, 2, 3, 4, 5, 4, 3, 2, 1
# using :, seq, or rep as appropriate.


# 2.5 Store the following data sets into a variable any way you can:
# 1. 2, 3, 5, 7, 11, 13, 17, 19

# 2. 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 (positive integers)

# 3. 1/1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10 (reciprocals)

# 4. 1, 8, 27, 64, 125, 216 (the cubes)

# 5. 1964, 1965, . . . , 2014 (some years)

# 6. 14, 18, 23, 28, 34, 42, 50, 59, 66, 72, 79, 86, 96, 103, 110 (stops on New
                                                              #   York’s No. 9 subway)


# 7. 0, 25, 50, 75, 100, . . . , 975, 1000 (0 to 1000 by 25s)
# Use c only when : or seq will not work.


# 2.6 The average distance from the center is computed by (jx1 􀀀 ¯ xj +    +
#                                                            jxn 􀀀 ¯ xj)/n, where ¯ x is the mean of the data vector. Compute this for the
# rivers data set using the function sum to add the values and abs to find the
# absolute value.

avg_dist <- abs(rivers - mean(rivers))
avg_dist


# 2.7 Precedence rules are used to decide the order of evaluating operations
# when parentheses are not present. Look at the value produced by -1:3. What
# is done first - or :? Now look at 1:2*3. Which is done first : or *?

# 2.8 The precip data set records average annual rainfall for many different
# cities in the United States. It is stored as a data vector with names. Find the
# average amounts for the cities starting with a “J”.

precip[startsWith(names(precip), "J")]


# 2.9 An experiment had 10 different trials. Create a character vector with 10
# different names for the trials, e.g., "Trial 1", . . . .

paste("Trial", 1:10, sep="")



# 2.10 Working with file names in R is easy, but requires the proper use of
# file separators, which vary depending on the operating system. For example,
# suppose you have the directory and file name of a file and want to get the
# entire file


f <- system.file("DESCRIPTION", package="UsingR")
dname <- dirname(f)
fname <- basename(f)

# To combine dname and fname into a full pathname use paste with the sep
# argument being .Platform$file.sep. What is the result?

paste(dname, fname, sep = .Platform$file.sep)

# 2.11 The Manufacturer variable in the Cars93 (MASS) data set is stored as a
# factor. How many levels are there? How many different cases are there?
  
str(Cars93$Manufacturer)  # factor w/32 levels

levels(Cars93$Manufacturer)
  
#   2.12 The Cylinders variable in the Cars93 (MASS) data set records the number
# of cylinders in the respective car. Why can this not be stored as a numeric
# value? Which cars have 5 cylinders?

# because the number of cylinders represent discrete categories

str(Cars93$Cylinders)

indices <- which(Cars93$Cylinders == "5")

Cars93[Cars93$Cylinders == "5", ][c("Manufacturer")]


#   2.13 The mtcars data set records information about cars from 1972. The values
# are coded using numbers. Recoding as factors can be more informative
# for the user. Recode the am variable, with 0 being “automatic” and 1 being
# “manual.”

mtcars$am[mtcars$am == 0] <- "automatic"
mtcars$am[mtcars$am == 1] <- "manual"

mtcars$am <- factor(mtcars$am)

str(mtcars)
summary(mtcars$am)

str(mtcars$am)


# 2.14 The Arbuthnot (HistData) data set contains information on the number
# of Male and Female births in London from 1629 to 1710. Using and and > determine
# if there was ever a year with more female births.

Arbuthnot$Males < Arbuthnot$Females # False

# 2.15 The negation operator ! is used to reverse Boolean values. For example:
#   A <- c(TRUE, FALSE, TRUE, TRUE)
# !A
## [1] FALSE TRUE FALSE FALSE
# One of De Morgan’s laws in R code is !(A & B) = !A | !B. Verify this
# with B <- c(FALSE, TRUE, FALSE, TRUE) and A as above.

# 2.16 In the precip data set, find all the cities with an average annual rainfall
# exceeding 50 inches.

precip[precip > 50]

# 2.17 For the precip data set, we can find the mean and the 25%-trimmed
# mean with mean(precip) and mean(precip, trim=0.25). Are any values in
# the data set more than 1.5 times the trimmed mean above the mean?

mean(precip)
trimmed_mean <- mean(precip, trim = 0.25)

precip[precip > 1.5 * trimmed_mean]


#   2.18 Consider the following “inequalities.” Can you determine how the comparisons
# are being done?
#   "ABCDE" == "ABCDE"
# ## [1] TRUE
# "ABCDE" < "ABCDEF"
# ## [1] TRUE
# "ABCDE" < "abcde"
## [1] FALSE
# "ZZZZZ" < "aaaaa"

# 2.19 You track your commute times for two weeks (ten days), recording the
# following times in minutes:
#   17 16 20 24 22 15 21 15 17 22
# Enter these into R. Use the function max to find the longest commute time, the
# function mean to find the average, and the function min to find the minimum.
# Oops, the 24 was a mistake. It should have been 18. How can you fix this?
#   Do so, and then find the new average.
# How many times was your commute 20 minutes or more? What percent
# of your commutes are less than 18 minutes long?

commute <- c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)

mean(commute)
max(commute)
min(commute)

commute[commute == 24] <- 18
commute

mean(commute)
max(commute)
min(commute)

length(commute[commute < 18]) / length(commute) # 50%


#   2.20 Suppose monthly sales (in 10,000s) of CDs in 2013 were
# JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC
# 79 74 161 127 133 210 99 143 249 249 368 302
# Enter the data into a data vector cd. Through indexing, form two data vectors:
#   one containing the months with 31 days, the other the remaining months.
# Compare the means of these two data vectors.

cd <- c(JAN=79, FEB=74, MAR=161, APR=127, MAY=133, JUN=210, JUL=99, AGO=143, 
        SEP=249, OUT=249, NOV=368, DEZ=302)

month_31 <- c(JAN=79, MAR=161, MAY=133, JUL=99, AGO=143, OUT=249, DEZ=302)
months <- c(FEB=74,APR=127,JUN=210,SEP=249,NOV=368)

mean(month_31)
mean(months)

# 2.21 The following data records the average salary in major league baseball
# for the years 1990–1999 (in millions):
#   0.57 0.89 1.08 1.12 1.18 1.07 1.17 1.38 1.44 1.72
# Use diff to find the differences from year to year. Are there any years where
# the amount dropped from the previous year?
#   The percentage difference is the difference divided by the previous year
# times 100. This can be found by dividing the output of diff by the first nine
# numbers (but not all ten). After doing this, determine which year has the
# biggest percentage increase.

avg_salary <- c(0.57,0.89, 1.08, 1.12, 1.18 ,1.07, 1.17, 1.38, 1.44, 1.72)

diff_salary <- diff(avg_salary)
diff_salary

# percetage difference

pct_diff <- diff_salary / avg_salary[-10]
pct_diff

# highest percentage increase
max(pct_diff) # 56% - 1991







