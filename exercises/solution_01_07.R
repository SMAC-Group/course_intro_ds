data(iris)
par(mfrow=c(1,2))
boxplot(iris$Sepal.Length ~ iris$Species, las = 2, xlab = "")
boxplot(iris$Sepal.Width ~ iris$Species, las = 2, xlab = "")
par(mfrow=c(1,1))
plot(iris$Sepal.Length, iris$Sepal.Width, col= iris$Species, pch = 16)
