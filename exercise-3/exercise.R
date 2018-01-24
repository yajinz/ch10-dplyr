### Exercise 3: Data Frame Practice with dplyr with and without pipes

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame
## View(vehicles) # rstudio only

## Install (if you haven't already) and load the `dplyr`package
library(dplyr)

## Which Accura model has the best hwy MPG in 2015?
## use temporary variables.
acuras <- filter(vehicles, make == 'Acura', year == 2015)
best.acura <- filter(acuras, hwy == max(hwy))
best.model <- select(best.acura, model)

## Which Accura model has the best hwy MPG in 2015?
## use nested functions
best.model <- select(
  filter(
    filter(vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
  ), model
)

## Which Accura model has the best hwy MPG in 2015?
## use pipes
best.model <- filter(vehicles, make == 'Acura', year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### Bonus ###

## Write 3 functions, one for each approach.  Then, 
## Test how long it takes to perform each one 1000 times
## Note: you may instead try the 'microbenchmark' library

# Without chaining
WithoutChaining <- function() {
  acuras <- filter(vehicles, make == 'Acura', year == 2015)
  best.acura <- filter(acuras, hwy == max(hwy))
  best.model <- select(best.acura, model)
}

# Nested functions
NestedBestModel <- function() {
  best.model <- select(
    filter(
      filter(vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
    ), model
  )
}

# Pipe operator
PipeBestModel <- function() {
  best.model <- filter(vehicles, make == 'Acura', year == 2015) %>%
    filter(hwy == max(hwy)) %>%
    select(model)
}

# Results are pretty similar...
system.time(for (i in 1:1000) WithoutChaining())
system.time(for (i in 1:1000) NestedBestModel())
system.time(for (i in 1:1000) PipeBestModel())
