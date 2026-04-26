# Step 1: Create matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Step 2: Check dimensions
dim(A)
dim(B)

# Step 3: Determinants
det(A)
det(B)

# Step 4: Inverses
solve(A)
solve(B)

# Transpose matrices
A_t <- t(A)
B_t <- t(B)

# Matrix-vector multiplication
v <- 1:10
A_multiplied <- A %*% v

# Matrix-matrix multiplication
C <- A %*% B
dim(C)