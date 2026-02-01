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
```

## Discussion
Putting the poll data into a data frame made it way easier to read and compare. Each row represents a candidate, while each column shows results from a different poll source. It’s similar to working with a spreadsheet, which helps keep everything organized.

When comparing the ABC and CBS polls, the results don’t always match, showing how different sources can report different outcomes even with the same candidates. This assignment helped me better understand why data frames are such an important part of working with data in R.

