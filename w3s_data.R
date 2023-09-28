x <- 10
y <- 20
print(x+y)

x <- 10.5
class(x)

x <- 1000L
class(x)

x <- 1i
class(x)
print(x)

x <- 1L
y <- 2
a <- as.numeric(x)
b <- as.complex(y)
print(a)
print(b)

max(5, 10, 15)
min(5,10,15)

abs(-4.7)
ceiling(1.4)
floor(1.4)
ceiling(-1.4)
floor(-1.4)

str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."
str <- "eunsong,
choi"

str
cat(str)
nchar(str)

str2 <- ""
nchar(str2)

str <- "Hello World!"
grepl("H", str)
grepl("Hello", str)
grepl("X", str)

str1 <- "Hello"
str2 <- "World"
paste(str1, str2)

a <- 200
b <- 33
if(b>a){
  print("b is greater than a")
} else{
  print("b is not greater than a")
}

my_var <- 3
my_var <<-3
3 -> my_var
4 ->> my_var
my_var

for(x in 1:10){
  print(x)
}

fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
}

fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}

adj <- list("red", "big", "tasty")

fruits <- list("apple", "banana", "cherry")
for (x in adj) {
  for (y in fruits) {
    print(paste(x, y))
  }
}

my_function <- function(fname){
  paste(fname, "Griffin")
}

my_function <- function(fname, lname) {
  paste(fname, lname)
}

my_function("Peter", "Griffin")

#wmy_function("Peter")

my_function <- function(country = "Norway") {
  paste("I am from", country)
}

my_function("Sweden")
my_function("India")
my_function() # will get the default value, which is Norway
my_function("USA")

my_function <- function(x) {
  return (5 * x)
}

print(my_function(3))
print(my_function(5))
print(my_function(9))

Outer_func <- function(x) {
  Inner_func <- function(y) {
    a <- x + y
    return(a)
  }
  return (Inner_func)
}
output <- Outer_func(3) # To call the Outer_func
output
output(5)

numbers1 <- 1.5:6.5
numbers1
numbers2 <- 1.5:6.3
numbers2

fruits <- c("banana", "apple", "orange")
fruits[1]
fruits <- c("banana", "apple", "orange", "mango", "lemon")
fruits[c(1,3)]

fruits[1] <- "pear"
fruits
length(fruits)

repeat_each <- rep(c(1,2,3), each=3)
repeat_each

repeat_times <- rep(c(1,2,3), times=3)
repeat_times

help(rep)  #도움!

numbers <- seq(from=0, to=100, by=20)
numbers

#---------------List-------------
thislist <- list("apple", "banana", "cherry")
thislist

thislist[1] <- "blackcurrant"
thislist
length(thislist)

"apple" %in% thislist

append(thislist, "orange")
thislist
append(thislist, "orange", after=2)

newlist <- thislist[-1]
newlist

thislist <- list("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
(thislist)[2:5]

for(x in thislist){
  print(x)
  #browser()
}

thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow=2, ncol=2)
thismatrix
thismatrix[1,2]
thismatrix[2,]
thismatrix[,2]

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow=3, ncol=3)
thismatrix[c(1,2),]
thismatrix[c(1,2), 2]

newmatrix <- cbind(thismatrix, c("strawberry", "blueberry", "raspberry"))
newmatrix

matrix1 <- matrix(c(1,2,3,4), nrow=4, ncol=1)
matrix1 <- cbind(matrix1, c(5,6,7,8))
matrix1

newmatrix <- rbind(thismatrix, c("strawberry", "blueberry", "rasoberry"))
newmatrix

thismatrix <- matrix(c("apple", "banana", "cherry", "orange", "mango", "pineapple"), nrow = 3, ncol =2)
thismatrix <- thismatrix[-c(1), -c(1)]
thismatrix

"apple" %in% thismatrix
dim(thismatrix)
length(thismatrix)

for(cols in 1:ncol(thismatrix)){
  for(rows in 1:nrow(thismatrix)){
    print(thismatrix[rows, cols])
  }
}


thisarray <- c(1:24)
thisarray

multiarray <- array(thisarray, dim = c(4,3,2))
multiarray

multiarray[2,3,2]

multiarray[c(1),,1]
multiarray[,c(1,2),1]

for(x in multiarray){
  print(x)
}

#Create a data frame
Data_Frame <- data.frame(
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)
Data_Frame
summary(Data_Frame)

Data_Frame[1]
Data_Frame[["Training"]]
Data_Frame$Training

Data_Frame[["Pulse"]]
Data_Frame$Pulse

New_row_DF <- rbind(Data_Frame, c("Strength", 110, 110))
New_row_DF

New_col_DF <- cbind(Data_Frame, Steps=c(1000, 2000, 5000))
New_col_DF

Data_Frame_New <- Data_Frame[-c(1), -c(1)]
Data_Frame_New

dim(Data_Frame)
ncol(Data_Frame)
nrow(Data_Frame)
length(Data_Frame)

## ------------ factor 
music_genre <- factor(c("jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre
levels(music_genre)

music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Opera"))
music_genre
