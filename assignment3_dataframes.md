# Assignment 3 – Data Frames in R

For this assignment, I worked with a made-up dataset based on the 2016 presidential election. The data includes candidate names and poll results from two different sources (ABC and CBS). Even though the data is not real, it is useful for practicing how data frames work in R.

## The Data

```r
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

election_polls <- data.frame(
  Name = Name,
  ABC = ABC_poll,
  CBS = CBS_poll
)

election_polls
