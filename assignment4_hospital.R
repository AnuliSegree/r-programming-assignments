# =========================
# Professor examples
# =========================

A <- c(3, 2, 5, 6, 4, 8, 1, 2, 3, 2, 4)
boxplot(A)

B <- c(2, 4, 5, 7, 12, 14, 16)
hist(B)

# =========================
# Hospital data assignment
# =========================

# 1) Enter data
Freq <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)

bloodp <- c(103,87,32,42,59,109,78,205,135,176)

# first: bad=1, good=0 (one NA in row 9)
first <- c(1,1,1,1,0,0,0,0,NA,1)

# second: low=0, high=1
second <- c(0,0,1,1,0,0,1,1,1,1)

# finaldecision: low=0, high=1
finaldecision <- c(0,1,0,1,0,1,0,1,1,1)

hospital_data <- data.frame(Freq, bloodp, first, second, finaldecision)

# 2) Side-by-side plots for blood pressure
par(mfrow = c(1,2))

boxplot(hospital_data$bloodp,
        main = "Boxplot of Blood Pressure",
        ylab = "bloodp")

hist(hospital_data$bloodp,
     main = "Histogram of Blood Pressure",
     xlab = "bloodp")

# reset layout back to normal
par(mfrow = c(1,1))

# 3) (For Part B) Compare BP vs doctors' ratings
# first is 0/1 with an NA, so remove the NA rows for comparisons
bp_first <- hospital_data[!is.na(hospital_data$first), ]

boxplot(bloodp ~ first, data = bp_first,
        names = c("good (0)", "bad (1)"),
        main = "Blood Pressure by First Rating",
        ylab = "bloodp")

boxplot(bloodp ~ second, data = hospital_data,
        names = c("low (0)", "high (1)"),
        main = "Blood Pressure by Second Rating",
        ylab = "bloodp")

boxplot(bloodp ~ finaldecision, data = hospital_data,
        names = c("low (0)", "high (1)"),
        main = "Blood Pressure by Final Decision",
        ylab = "bloodp")

# Optional: quick summary numbers (nice for discussion)
summary(hospital_data$bloodp)
tapply(bp_first$bloodp, bp_first$first, summary)
tapply(hospital_data$bloodp, hospital_data$second, summary)
tapply(hospital_data$bloodp, hospital_data$finaldecision, summary) 