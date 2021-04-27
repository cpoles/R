############

# PROBLEMS #

############

library(UsingR)

# 2.31 For the data sets bumpers (UsingR), firstchi (UsingR), and math (UsingR),
# make histograms. Try to predict the mean, median, and standard deviation
# from the graphic. Check your guesses with the appropriate R commands.

hist(bumpers)
mean(bumpers)
median(bumpers)
sd(bumpers)

hist(firstchi)
mean(firstchi)
median(firstchi)
sd(firstchi)

hist(math)
mean(math)
median(math)
sd(math)



# 2.32 Fit a density estimate to the data set pi2000 (UsingR). Compare with the
# appropriate histogram. Why might you want to add an argument like breaks
# = 0:10-.5 to hist?

pi_hist <- hist(pi2000)
pi_dens <- density(pi2000)

hist(pi2000, probability = TRUE,
     breaks = 0:10-.5)

lines(pi_dens, lwd=2) # lwd - line width


#   2.33 The data set normtemp (UsingR) contains body measurements for 130
# healthy, randomly selected individuals. The variable temperature contains
# normal body temperature. Make a histogram. Estimate the sample mean
# body temperature, and then check using mean.

hist(normtemp$temperature)

mean(normtemp$temperature) # 98.24



# 2.34 The data set DDT (MASS) contains independent measurements of the pesticide
# DDT on kale. Make a histogram and a boxplot of the data. From these,
# estimate the mean and standard deviation. Check your answers

hist(DDT)
boxplot(DDT, horizontal = TRUE)

mean(DDT)
sd(DDT)

dotplot(DDT)

# 2.36 The paradise (UsingR) data set contains snowfall measurements (in
#                                                                     inches) at Mt. Rainier for several years. Make a histogram of the data and
# comment on the shape. The data is in a time series with NA values. To get this
# as a numeric data set, use:
#   x <- as.numeric(paradise) # as numbers
# x <- x[!is.na(x)] # strip NA values

x <- as.numeric(paradise)
x <- x[ !is.na(x) ]
summary(x)

hist(x)
boxplot(x, horizontal = TRUE)

# 2.37 There are several built-in data sets on the 50 United States. For instance,
# state.area, showing the area of each U.S. state, and state.abb, showing a
# common abbreviation. First, use state.abb to give names to the state.area
# variable, then find the percent of states with area less than New Jersey (NJ).
# What percent have area less than New York (NY)? Make a histogram of all the
# data. Can you identify the outlier?

states <- setNames(state.area, state.abb)
states

# percentage of states with area < NJ area
lt_NJ <- states[states < states["NJ"]]
pct_NJ <- length(lt_NJ) / length(states)
pct_NJ * 100 # 8%

# percentage of states with area < NY area
lt_NY <- states[states < states["NY"]]
pct_NY <- length(lt_NY) / length(states)
pct_NY * 100 # 40%


#   2.38 The lawsuits (UsingR) data set contains simulated data on the settlement
# amounts of 250 common fund class actions in $10,000s. Look at the
# differences between the mean and the median. Explain why some would say
# the average is too high and others would say the average is the wrong way
# to summarize the data.

mean(lawsuits)
median(lawsuits)

summary(lawsuits)

hist(lawsuits)
boxplot(lawsuits, horizontal = TRUE)


# 2.42 The data set rivers contains the lengths (in miles) of 141 major rivers
# in North America.
# 1. What proportion are less than 500 miles long?
#   2. What proportion are less than the mean length?
#   3. What is the 0.75 quantile?

proportion_rivers <- length(rivers[rivers < 500]) / length(rivers) # 0.58
proportion_rivers * 100 # 58.15%

hist(rivers)

quantile(rivers, 0.75)

summary(rivers)
boxplot(rivers, horizontal = TRUE)


#   2.43 The time variable in the nym.2002 data set contains the time to finish the
# 2002 New York City Marathon for a random sample of the finishers.
# 1. What percent ran the race in under 3 hours?
#   2. What is the time cutoff for the top 10%? The top 25%?
#   3. What time cuts off the bottom 10%?
#   Do you expect this data set to be symmetrically distributed?

pct_lt_3h <- length(nym.2002$time[nym.2002$time < 180]) / length(nym.2002$time) * 100
pct_lt_3h

quantile(nym.2002$time, 0.10)
quantile(nym.2002$time, 0.25)

quantile(nym.2002$time, 0.90)

summary(nym.2002)

boxplot(nym.2002$time, horizontal = TRUE)
hist(nym.2002$time)

#   2.44 Compare values of the mean, median, and 25%-trimmed mean on the
# built-in rivers data set. Is there a big difference among the three?

mean(rivers)
median(rivers)
mean(rivers, trim = 0.25)

sd(rivers)


#   2.45 The built-in data set islands contains the size of the world’s land masses
# that exceed 10,000 square miles. Make a stem-and-leaf plot, then compare the
# mean, median, and 25% trimmed mean. Are they similar?





#   2.46 The data set OBP contains the on-base percentages for the 2002 Major
# League Baseball season. The value labeled bondsba01 contains this value for
# Barry Bonds. What is his z-score?
#   

scale(OBP)["bondsba01", 1]

#   
#   2.47 For the rivers data set, use the scale function to find the z-scores. Verify
# that the z-scores have sample mean 0 and sample standard deviation 1.

z_scores <- scale(rivers)[,1]
z_scores

mean(z_scores)
sd(z_scores)




# 2.48 Compare the three measures of spread (sd, IQR, mad) for the exec.pay
# (UsingR) data set. Are the values comparable?

sd(exec.pay)
IQR(exec.pay)
mad(exec.pay)

#   2.49 The data set npdb (UsingR) contains malpractice-award information. The
# variable amount is the size of malpractice awards in dollars. Find the mean
# and median award amount. What percentile is the mean? Can you explain
# why this might be the case?

mean(npdb$amount)
median(npdb$amount)

summary(npdb$amount)

# 
#   2.50 Find the coefficient of variation (standard deviation scaled by the mean)
# for the rivers data set.

sd(rivers) / mean(rivers)

# 2.51 The data set babyboom (UsingR) contains data on the births of 44 children
# in a one-day period at a Brisbane, Australia, hospital. The variable
# running.time records the time after midnight of each birth. The command
# diff(running.time) records the differences or inter-arrival times. Such times
# are often exponentially distributed. Is the coefficient of variation close to 1?

diff(babyboom$running.time)
sd(babyboom$running.time) / mean(babyboom$running.time)


#   2.52 The data set babyboom (UsingR) contains data on the births of 44 children
# in a one-day period at a Brisbane, Australia, hospital. Compute the skew
# of the wt variable, which records birth weight. Is this variable reasonably
# symmetric or skewed?

wt <- babyboom$wt
skew <- function(x) {
  n <- length(x)
  z <- (x - mean(x)) / sd(x)
  sum(z^3) / n
}
skew(wt)

boxplot(wt, horizontal = TRUE)
hist(wt)



#   The variable running.time records the time after midnight of each birth.
# The command diff(running.time) records the differences or inter-arrival
# times. Is this variable skewed?

skew(babyboom$running.time)
boxplot(babyboom$running.time, horizontal = TRUE)
hist(babyboom$running.time)


#   2.53 The data set hall.fame (UsingR) contains baseball statistics for several
# baseball players. Make histograms of the following variables and describe
# their shapes: HR, BA, and OBP.
# 
hist(hall.fame$HR)
hist(hall.fame$BA)
hist(hall.fame$OBP)

sd(hall.fame$BA)

skew(hall.fame$HR)


# 2.54 Sometimes a data set is so skewed that it can help if we transform the
# data prior to looking at it. A common transformation for long-tailed data sets
# is to take the logarithm of the data. For example, the exec.pay (UsingR) data
# set is highly skewed. Look at histograms before and after taking a logarithmic
# transform. Which is better at showing the data and why? (You can transform
#            with the command log(1 + exec.pay, 10).) Find the median and the mean
# for the transformed data. How do they correspond to the median and mean
# of the untransformed data?

hist(exec.pay) 

log_pay <- log(1 + exec.pay, 10)
hist(log_pay) # transformed data log base 10

mean(exec.pay)
mean(log_pay)

boxplot(exec.pay, horizontal = TRUE)
boxplot(log_pay,horizontal = TRUE)

#   2.55 Create a quantile-normal plot for the chest-size measurements in
# ChestSizes (HistData). Do the plotted points appear to lie very close to a
# straight line?

chests <- rep(ChestSizes$chest, ChestSizes$count)
chests

qqnorm(chests)




#   2.56 The Michelson (HistData) data set records 100 measurements by Michelson
# of the speed of light (in the variable velocity). Make a quantile-normal
# graph and discuss if the graphic shows the points falling on a straight line.

tbl <- table(MichelsonSets)

light_speeds <- rep(names(tbl), tbl)

qqnorm(as.numeric(light_speeds))


# 2.57 The data set cfb (UsingR) contains a sampling of the data from a survey
# of consumer finances. For the variables AGE, EDUC, NETWORTH, and 
# log(SAVING + 1), describe their distribution using the concepts of modes, symmetry, and
# tails. Can you convince yourself that these distributions should have the
# shape they do? Why?
# 




#   2.59 In the Cars93 (MASS) data set, which is more skewed, the Price or
# MPG.highway variable?

skew(Cars93$Price)
skew(Cars93$MPG.highway)

hist(Cars93$Price)
hist(Cars93$MPG.highway)

# Price is more skewed

#   2.60 Write a function to find the most common value of a data vector, e.g.,
# the “mode.”
# 

my_mode <- function(x) {
  tbl <- table(x)
  match(max(tbl), tbl)
}

x <- c(1,2,2,2,3,4,5,6,1,2,1,3,4,5)
my_mode(x)
table(x)


# 2.61 Numeric data can be discretized through the cut function. For example,
# the command cut(bumpers, c(0, 1000, 2000, 3000, 4000)) will categorize
# the repair cost of a bumper by its rough amount. Make a table of this. Which
# range has the largest number of data points?

cat_bumpers <- cut(bumpers, c(0, 1000, 2000, 3000, 4000))
table(cat_bumpers) # 1000 - 2000



#   2.62 The Cylinders variable Cars93 (MASS) data set records the number of
# cylinders in a factor. What kind of summary does R compute for factors?
#   Look at summary(Cars93$Cylinders) to see.

summary(Cars93$Cylinders)

# 2.63 The lorem variable in UsingR contains 5 paragraphs of dummy typesetting
# text that has been in use for centuries. What is the most common letter
# used? To answer this, you can break a character value into letters by the idiom
##  unlist(strsplit(x,"")) where x is character data.

letters <- table(unlist(strsplit(lorem,"")))

lag(sort(letters))

idx <- match(max(letters), letters)


# 2.64 Make a dot chart of the Cylinders variable in the Cars93 (MASS) data set.

dotchart(as.numeric(Cars93$Cylinders))


#   2.68 The data set central.park (UsingR) holds the coded variable WX representing
# bad weather (e.g., 1 for “fog”, 3 for “thunder”, 8 for “smoke” or
#              “haze”). NA is used when none of the types occurred. Make a table of the
# data, then make a table with the extra argument exclude=FALSE. Why is the
# second table better?

table(central.park$WX, exclude = FALSE) # excludes the NA

