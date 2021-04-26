#####################

# Numeric Summaries #

#####################
library(UsingR)


## Numeric Summaries

# weighted average
w <- Macdonell$frequency / sum(Macdonell$frequency) # n_k / n
y <- Macdonell$height
sum(w*y)

# Measures of position
x <- 0:5
length(x)

mean(sort(x)[3:4])

median(x)

quantile(x, 0.25)

quantile(x, seq(0, 1, by=0.2)) #quintiles

quantile(x)

# get mode by counting most frequent
wts <- c(24, 27, 29, 24, 38, 40, 43, 47, 48, 59, 61, 48)

table(wts) # value becomes a key and count becomes the values like in a dict
wts

which(table(wts) == max(table(wts)))

as.numeric(names(which(table(wts) == max(table(wts)))))

# Spread
range(wts) # min and max values

diff(range(wts))

# variance and std deviation

var(wts) # sample variance

sd(wts) # std variation

# z-score
z_score <- function(x) (x - mean(x)/sd(x))
z_score(wts)

scale(wts)[,1] # get the first column of the matrix

# Grading by z-scores
# A = 1.28 (z-score)

grades <- c(54, 50, 79, 79, 51,69, 55, 62, 100, 80)
z_scores <- (grades - mean(grades)) / sd(grades)
# A
grades[z_scores >= 1.28]

# what proportion are more than 3 sd from the mean?
z <- (exec.pay - mean(exec.pay)) / sd(exec.pay) 
out <- abs(z) > 3 

sum(out) / length(z) # 1.5% > 3

## IQR ##

median(rivers) # center

IQR(rivers) # spread

IQR(rivers) / sd(rivers)

# median absolute deviation
mad(rivers) / sd(rivers)

ht <- kid.weights$height
mad(ht)/sd(ht)

# sample skewness
skew <- function(x) {
  n <- length(x)
  z <- (x - mean(x)) / sd(x)
  sum(z^3) / n
}

skew(exec.pay) # skewed right

four_year_heights <- kid.weights[kid.weights$age %in% 48:59, "height"]
skew(four_year_heights)

# Tails
kurtosis <- function(x) {
  n <- length(x)
  z <- (x - mean(x)) / sd(x)
  sum(z^4)/n-3
}

kurtosis(galton$parent)

# stem-and-leaf plot
stem(bumpers)

# histogram plot
hist(faithful$waiting)

bins <- seq(40, 100, by=5) # create the bins
bins

x <- faithful$waiting
out <- cut(x, breaks = bins)
head(out)

# tabulate to get the counts of out
table(out)

hist(bumpers, probability = TRUE) # the bar area represents the probability a 
                                  # random point belongs to a given bin


# density plot
plot(density(bumpers))

# histogram and density plot
b_hist <- hist(bumpers, plot=FALSE)
b_dens <- density(bumpers)

# plotting density as a layer of b_hist
hist(bumpers, probability = TRUE,
     xlim = range(c(b_hist$breaks, b_dens$x)),
     ylim = range(c(b_hist$density, b_dens$y)))

lines(b_dens, lwd=2) # lwd - line width

## Boxplots

boxplot(bumpers, horizontal = TRUE, main="bumpers")
boxplot(kid.weights$weight, horizontal = TRUE, main="weights")

# quantile graphs
x <- rep(Macdonell$finger, Macdonell$frequency)
qqnorm(x)

x <- jitter(HistData::Galton$child, factor=5)
qqnorm(x)

### categorical data
x <- babies$smoke
x <- factor(x, labels = c("never", "now", "until current", 
                          "once, quit", "unknown"))

# tabulating factor x
table(x)
       
# percentage of mothers smoked in the dataset
out <- table(x)
prop <- 100 * out / sum(out)
round(prop, digits=2)

# barplot
barplot(out, horiz = TRUE, main = "Smoking Data")

# dot chart
dotchart(out)
