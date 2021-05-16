#############
#
# Modifying values
#
#############

deck <- read.csv('./deck.csv')

deck2 <- deck

## Changing values in place
vec <- c(0,0,0,0,0,0)
vec[1] <- 1000
vec

vec[c(1,3,5)] <- c(1,1,1)
vec

vec[4:6] <- vec[4:6] + 1
vec

# expand by creating new index
vec[7] <- 0
vec

#---

# creating new column
deck2$new <- 1:52
head(deck2)

# remove columns by assigning NULL
deck2$new <- NULL
head(deck2)

# aces
deck2[c(13, 26, 39, 52), ]

# assign value for playing war
deck2$value[c(13, 26, 39, 52)] <- 14
deck2[c(13, 26, 39, 52), ]

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

## Logical Subsetting
# find the aces in a shuffled deck
deck3 <- shuffle(deck)
head(deck3)

sum(deck2$face == "ace")

# changing values of all aces
deck3$value[deck3$face == "ace"] <- 14

head(deck3)

## HEARTS

deck4 <- deck
deck4$value <- 0

head(deck4, 13)

# assign 1 to hearts
deck4$value[deck4$suit == "hearts"] <- 1
deck4[-(1:40), ]

deck4$value[deck$suit == "spades" & deck4$face == "queen"] <- 13
deck4[deck4$suit == "spades", ]

# save subsetting condition in an object
queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"
deck4[queenOfSpades, ]

### Blackjack

deck5 <- deck
head(deck5, 13)

facecard <- deck5$face %in% c("king", "queen", "jack")
deck5[facecard, ]

# assign ten to the royals
deck5$value[facecard] <- 10
head(deck5, 13)

## Missing information

# na.rm
mean(c(NA, 1:50)) # NA
mean(c(NA, 1:50), na.rm = TRUE) # removes NA and calculates the mean

# is.na
is.na(NA)

vec <- c(1, 2, 3, NA)
is.na(vec)

# set aces to NA
deck5$value[deck5$face == "ace"] <- NA
head(deck5, 13)

deck5[deck5$face == "ace", ]















