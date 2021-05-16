###############
#
# ENVIRONMENTS
#
###############

library(devtools)
library(pryr)

# get a list of environments

parenvs(all = TRUE)

as.environment("package:stats")

# get environments
globalenv()
baseenv()
emptyenv()

# check environment parent
parent.env(globalenv())

parent.env(emptyenv()) # no parent!

 # list values in an environment
ls(emptyenv())

ls(globalenv())

# create a value in an environment
assign("new", "Hello Global", envir = globalenv())

globalenv()$new

# active environment
environment()

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}


## Evaluation
show_env <- function() {
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()
environment(parenvs)

### Fix the deal function
deck <- read.csv('./deck.csv')

DECK <- deck

deck <- deck[-1, ] # remove the first card
head(deck, 3)

deal <- function() {
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
}

deal() # global deck not changed

deal <- function() {
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}

shuffle <- function(cards) {
  random <- sample(1:52, size = 52, replace = TRUE)
  assign("deck", DECK[random, ], envir = globalenv())
}

shuffle()

deal()

## Using closures to avoid updating the global environment deck
setup <- function(deck) {
  DECK <- deck

  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }

  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}


cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

shuffle()
deal()






