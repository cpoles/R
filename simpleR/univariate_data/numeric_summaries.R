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
