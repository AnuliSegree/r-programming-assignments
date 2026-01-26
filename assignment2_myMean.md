# Assignment 2 - myMean debugging

## Result of Testing Original Function
```r
myMean(assignment2)
# Error: object 'assignment' not found
# (The original function fails because it uses 'assignment' and 'someData', which are not defined.)
Explanation
The original function fails because it tries to use the variables assignment and someData, which do not exist.
The argument assignment2 is the variable passed to the function, so the function should use assignment2 for both the sum and the length to correctly calculate the mean.

Corrected Function
r
Copy code
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}
Test Corrected Function
r
Copy code
myMean(assignment2)
# [1] 19.5

I wrote a blog post explaining my debugging process for this assignment. You can check it out here:
[Debugging myMean in R – My Assignment 2 Journey](https://www.blogger.com/blog/post/edit/6412396645363116408/3374463383248962732)
