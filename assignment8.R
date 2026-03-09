# Assignment 8
# Step 1: Import dataset
student6 <- read.csv(
  file.choose(),
  header = TRUE,
  stringsAsFactors = FALSE
)

# View first rows to confirm data loaded
head(student6)

# Step 2: Group and summarize Grade by Sex
library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Display grouped means
print(gender_mean)

# Write grouped means to a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# Step 3: Filter names containing "i" or "I"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
# Display filtered rows
print(i_students)

# Extract names and write to CSV
write.csv(
  i_students["Name"],
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# Save full filtered dataset
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# Confirm files exist
file.exists("gender_mean.txt")
file.exists("i_students.csv")
file.exists("i_students_full.csv")

# List files in working directory
list.files()