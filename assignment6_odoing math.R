# Create matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Check dimensions (master’s-level habit)
dim(A)
dim(B)

# Add and subtract
A_plus_B <- A + B
A_minus_B <- A - B

A_plus_B
A_minus_B


# Diagonal matrix
D <- diag(c(4, 1, 2, 3))
D


# Build structured matrix
M <- diag(3, 5)
M[1, 2:5] <- 1
M[2:5, 1] <- 2
M