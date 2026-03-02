############################################
# Assignment 7 - S3/S4 + Generic Functions
# Name: <Anuli Segree>
# Date: <March 1 2026>
############################################

### 1) Choose or Download Data ####
data("mtcars")

cat("=== head(mtcars) ===\n")
print(head(mtcars))

cat("\n=== str(mtcars) ===\n")
str(mtcars)

cat("\n=== summary(mtcars) ===\n")
print(summary(mtcars))

### 2) Test Generic Functions ####
# Base generic functions: print(), summary(), plot()

cat("\n=== Generic: summary(mtcars) ===\n")
print(summary(mtcars))

cat("\n=== Generic: plot(mtcars$wt, mtcars$mpg) ===\n")
plot(mtcars$wt, mtcars$mpg, main = "mpg vs wt", xlab = "wt", ylab = "mpg")

# Create a derived object: linear model (lm object)
fit <- lm(mpg ~ wt + hp, data = mtcars)

cat("\n=== class(fit) ===\n")
print(class(fit))

cat("\n=== Generic dispatch on lm object: summary(fit) (summary.lm) ===\n")
print(summary(fit))

cat("\n=== Generic dispatch on lm object: print(fit) (print.lm) ===\n")
print(fit)

cat("\n=== Generic dispatch on lm object: plot(fit) (plot.lm) ===\n")
plot(fit)

# Example where generic does NOT dispatch for a class (no method)
x_list <- list(a = 1:5, b = rnorm(5))

cat("\n=== class(x_list) ===\n")
print(class(x_list))

cat("\n=== Try plot(x_list) (likely no plot.list in base) ===\n")
print(try(plot(x_list), silent = TRUE))

cat("\nEXPLANATION:\n")
cat("plot() is a generic. It dispatches based on class.\n")
cat("A plain list has class 'list' and base R does not define plot.list.\n")
cat("So plot() falls back to plot.default, which cannot plot a list -> error.\n")

### 3) Explore S3 vs S4 ####

## 3A) S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

cat("\n=== S3 object checks ===\n")
cat("class(s3_obj):\n")
print(class(s3_obj))
cat("typeof(s3_obj):\n")
print(typeof(s3_obj))

# S3 print method
print.student_s3 <- function(x, ...) {
  cat("Student (S3)\n")
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
  invisible(x)
}

cat("\n=== print(s3_obj) dispatches to print.student_s3 ===\n")
print(s3_obj)

cat("\n=== methods('print') sample ===\n")
print(head(methods("print"), 20))

## 3B) S4 class and object
library(methods)

setClass("student_s4",
         slots = c(name = "character",
                   age  = "numeric",
                   GPA  = "numeric"))

s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

cat("\n=== S4 object checks ===\n")
cat("isS4(s4_obj):\n")
print(isS4(s4_obj))
cat("class(s4_obj):\n")
print(class(s4_obj))
cat("slotNames(s4_obj):\n")
print(slotNames(s4_obj))
cat("str(s4_obj):\n")
str(s4_obj)

# S4 show method (like print for S4 objects)
setMethod("show", "student_s4", function(object) {
  cat("Student (S4)\n")
  cat("Name:", object@name, "\n")
  cat("Age:", object@age, "\n")
  cat("GPA:", object@GPA, "\n")
})

cat("\n=== Showing s4_obj dispatches to show method ===\n")
s4_obj

### 4) Discussion helpers (S3 vs S4 + type) ####
cat("\n=== How to tell S3 vs S4 ===\n")
cat("S3 object? isS4(s3_obj):\n")
print(isS4(s3_obj))
cat("S4 object? isS4(s4_obj):\n")
print(isS4(s4_obj))

cat("\n=== Underlying type checks ===\n")
cat("typeof(mtcars):\n")
print(typeof(mtcars))
cat("typeof(s3_obj):\n")
print(typeof(s3_obj))
cat("typeof(s4_obj):\n")
print(typeof(s4_obj))
