# Assignment 9
# Comparing Base R, Lattice, and ggplot2 using the iris dataset

# Load dataset
data("iris", package = "datasets")
head(iris)

# Install packages if needed
if (!require(lattice)) install.packages("lattice", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

library(lattice)
library(ggplot2)

# --------------------------------------------------
# BASE R GRAPHICS
# --------------------------------------------------

# Base Plot 1: Scatter plot
png("base_scatter.png", width = 800, height = 600)
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Base R: Sepal Length vs Petal Length",
     xlab = "Sepal Length",
     ylab = "Petal Length",
     col = as.numeric(iris$Species),
     pch = 19)
legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19)
dev.off()

# Base Plot 2: Histogram
png("base_histogram.png", width = 800, height = 600)
hist(iris$Sepal.Width,
     main = "Base R: Distribution of Sepal Width",
     xlab = "Sepal Width",
     col = "lightblue",
     border = "white")
dev.off()

# Also display in RStudio Plots pane
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Base R: Sepal Length vs Petal Length",
     xlab = "Sepal Length",
     ylab = "Petal Length",
     col = as.numeric(iris$Species),
     pch = 19)
legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19)

hist(iris$Sepal.Width,
     main = "Base R: Distribution of Sepal Width",
     xlab = "Sepal Width",
     col = "lightblue",
     border = "white")

# --------------------------------------------------
# LATTICE GRAPHICS
# --------------------------------------------------

# Lattice Plot 1: Conditioned scatter plot
png("lattice_scatter.png", width = 900, height = 600)
print(
  xyplot(Petal.Length ~ Sepal.Length | Species,
         data = iris,
         main = "Lattice: Petal Length vs Sepal Length by Species",
         xlab = "Sepal Length",
         ylab = "Petal Length",
         col = "darkgreen",
         pch = 19)
)
dev.off()

# Lattice Plot 2: Boxplot
png("lattice_boxplot.png", width = 800, height = 600)
print(
  bwplot(Sepal.Width ~ Species,
         data = iris,
         main = "Lattice: Sepal Width by Species",
         xlab = "Species",
         ylab = "Sepal Width",
         col = "purple")
)
dev.off()

# Also display in RStudio Plots pane
xyplot(Petal.Length ~ Sepal.Length | Species,
       data = iris,
       main = "Lattice: Petal Length vs Sepal Length by Species",
       xlab = "Sepal Length",
       ylab = "Petal Length",
       col = "darkgreen",
       pch = 19)

bwplot(Sepal.Width ~ Species,
       data = iris,
       main = "Lattice: Sepal Width by Species",
       xlab = "Species",
       ylab = "Sepal Width",
       col = "purple")

# --------------------------------------------------
# GGPLOT2
# --------------------------------------------------

# ggplot2 Plot 1: Scatter plot with smoothing
g1 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Petal Length vs Sepal Length by Species",
       x = "Sepal Length",
       y = "Petal Length")

ggsave("ggplot_scatter.png", plot = g1, width = 8, height = 6)

# ggplot2 Plot 2: Faceted histogram
g2 <- ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  geom_histogram(binwidth = 0.2, color = "black") +
  facet_wrap(~ Species) +
  labs(title = "ggplot2: Sepal Width Distribution by Species",
       x = "Sepal Width",
       y = "Count")

ggsave("ggplot_histogram.png", plot = g2, width = 8, height = 6)

# Display plots
print(g1)
print(g2)