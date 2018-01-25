### Exercise 1: Data Frame Practice

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame
install.packages("fueleconomy")
library(fueleconomy)

# Create a data.frame of vehicles from 1997 only
vehicles_1997 <-with(vehicles,vehicles[year ==1997,])

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_1997[["year"]])

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two_Wheel <- with(vehicles,vehicles[cty >20,])

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst_hwy <- with(two_Wheel,two_Wheel[hwy==min(two_Wheel$hwy),])
name<-worst_hwy$id
# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year


# What was the most efficient honda model of 1995?


