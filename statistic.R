mtcars

?mtcars

Data_Cars <- mtcars
dim(Data_Cars)

#variables
names(Data_Cars)
#observations
rownames(Data_Cars)

Data_Cars$cyl

summary(Data_Cars)

max(Data_Cars$hp)
min(Data_Cars$hp)

# 가장 작은 값과 가장 큰 값의 index 찾아오기
which.max(Data_Cars$hp)
which.min(Data_Cars$hp)

# get the row names by their min, max index
rownames(Data_Cars)[which.max(Data_Cars$hp)]
rownames(Data_Cars)[which.min(Data_Cars$hp)]

# Mean: 평균 
mean(Data_Cars$wt)

# Median : 중간값 
median(Data_Cars$wt)

# Mode: 가장 많은 빈도로 나온 수
names(sort(-table(Data_Cars$wt)))[1]
# table(Data_Cars$wt))를 하면 wt의 값들이 variables가 됨. 그니까 names()[1]은 정렬 시 가장 숫자가 작은(빈도수가 높은) variable을 가져오는 것임

# Percentiles: Give percenta of the values are lower than
quantile(Data_Cars$wt, c(0.75))
# 75%가 3.61보다 가벼움 

quantile(Data_Cars$wt)

library(tidyverse)
print("hello tidyverse")

data <- read.csv("./data.csv")
View(data)


# Challenge
teachers <- data.frame(
  Name = c("David", "Richard", "Claudio", "Laurene", "Laura"),
  Lectures_to_teach = c(4,3,3,0,0),
  Role = c("Module Lead", "Teacher", "Teacher", "TA", "TA")
)
teachers

teachers$Role
teachers[1, 2]
teachers$Name[2]

filter(teachers, Lectures_to_teach>0)
select(teachers, Name, Role)
mutate(teachers, isLecturing = (Lectures_to_teach>0))
group_by(teachers)
summarise(teachers)

summarise(teachers,
          mean(Lectures_to_teach),
          median(Lectures_to_teach))

# Lectures_to_teach가 가장 많은 사람을 보고 싶음
#teachers$Name[summarise(teachers, max(Lectures_to_teach))]
teachers$Name[which.max(teachers$Lectures_to_teach)]
teachers$Name[which.min(teachers$Lectures_to_teach)]

teachers %>% 
  group_by(Lectures_to_teach) %>% 
  summarise(min=min(Lectures_to_teach))
