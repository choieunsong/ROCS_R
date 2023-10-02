# ----------- plot
plot(1, 3)
plot(c(1,8), c(3,10))

plot(c(1,2,3,4,5), c(3,7,8,9,12))

x <- c(1,2,3,4,5)
y <- c(3,7,8,9,12)
plot(x,y)

plot(1:10)
plot(1:10, type="l")

plot(1:10, main="My Graph", 
     xlab="This x-axis", 
     ylab="This y-axis", 
     type="l")

#rm(list=ls())

plot(1:10, col="red")
plot(1:10, cex=0.5)

plot(1:10, pch=20, cex=2)

plot(1:10, type="l", col="blue")
plot(1:10, type="l", lwd=2)
plot(1:10, type="l", lwd=5, lty=6)

line1 <- c(1,2,3,4,5,10)
line2 <- c(2,5,7,8,9,10)

plot(line1, type="l", col="blue")
lines(line2, type="l", col="red")
lines(line2, col="red")

x <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y <- c(99,86,87,88,111,103,87,94,78,77,85,86)
plot(x, y, cex=0.5)
plot(x, y,
     main="Observation of Cars",
     xlab="Car age",
     ylab="Car speed")


x2 <- c(2,2,8,1,15,8,12,9,7,3,11,4,7,14,12)
y2 <- c(100,105,84,105,90,99,90,95,94,100,79,112,91,80,85)
plot(x, y,
     main="Observation of Cars",
     xlab="Car age",
     ylab="Car speed",
     col="red",
     cex=1)
points(x2, y2, col="blue", cex=1)

x <- c(10,20,30,40)
pie(x)
pie(x, init.angle = 90)

mylabel <- c("Apples", "Bananas", "Cherries", "Dates")
pie(x, label=mylabel, main="Fruites")

colors <- c("blue", "yellow", "green", "black")
pie(x, label=mylabel, main="Fruites", col=colors)
legend("bottomright", mylabel, fill=colors)

# Display the pie chart with colors
pie(x, label = mylabel, main = "Pie Chart", col = colors)

# Display the explanation box
legend("bottomright", mylabel, fill = colors)


x <- c("A", "B", "C", "D")
y <- c(2,4,6,8)
barplot(y, names.arg=x)
barplot(y, names.arg=x, col="red")    

barplot(y, names.arg = x, density=10)
barplot(y, names.arg = x, width=c(1,2,3,4))
barplot(y, names.arg = x, horiz=TRUE)
