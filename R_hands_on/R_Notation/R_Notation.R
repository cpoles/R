#### R Notation

deck <- read.csv('./deck.csv')
deck

## Selecting Values
# Positive Integers
head(deck)
deck[1,1]

deck[1, 1:3]
new <- deck[c(1,1), c(1,3)] # get row 1 twice and columns 1 and 3
new


# subsetting a vector
vec <- c(6, 1, 3, 6, 10, 5)
vec[1:3]

# drop = FALSE (returns a dataframe instead of a vector)
deck[1:2, 1]
deck[1:2, 1, drop = FALSE]

# Negative Integers
# returns every element expect the elemens in a negative index
deck[-1, 1:3] # all but the first row

deck[-(2:52), 1:3] # only the first row

# Blank spaces
deck[1,]

# Name indexing
deck[1, c("face", "value")] # row 1 - columns face and value

deck[ , "value"] # column value only

# Ex. Deal a Card
deal <- function(cards) {
  cards[1, ]
}

deal(deck)

# Shuffle the dataset
random <- sample(1:52, size = 52) # random sample of row numbers
random

deck4 <- deck[random, ]
deck4

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

shuffle(deck)

# Dollar Signs and Double Brackets
deck$value

mean(deck$value)

lst <- list(numbers = c(1,2), logical = TRUE, strings = c("a", "b","c"))
lst

typeof(lst[1])

class(lst$numbers)

## double brackets
lst[[1]] == lst$numbers

lst["numbers"]
lst[["numbers"]]


