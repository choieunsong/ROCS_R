#install library
install.packages("tidyverse")
library(tidyverse)

vector1 <- c(1,2,3,4,5)
vector2 <- c(10,11,12,13,14,15)
vector3 <- vector1 + vector2
print(vector3)

teachers <- data.frame(
  Name = c("David", "Richar", "Claudio", "Laurene", "Laura"),
  Lectures_to_teach = c(4,3,3,0,0),
  Role = c("Module Lead", "Teacher", "Teacher", "TA", "TA")
)



# Challenge 1
# Calculate the mean and median number of lectures to teach for members of the teaching team on ROCS from the data above.
# load library
install.packages("dplyr")
library(dplyr)
summarise(teachers,
          mean(Lectures_to_teach),
          median(Lectures_to_teach))


# Final Exercise
# load the data from 'data.csv' on the VLE into R using the `read_csv` function from the tidyverse package, and assign it to a variable called 'spend_data'. Explore the format of your new data frame. When using new functions, you can add a '?' to the front of the function to find out how it works. So, to find out more about how to use read_csv, type ?read_csv into the console
spend_data <- read.csv("H:/Desktop/week1/data.csv")
View(spend_data)


# Use the `summary()` function to generate descriptive statistics for the 'amount' column in 'spend_data' and analyse the result.
View(spend_data %>% 
       select(amount) %>% 
       summary())

# From 'spend_data', filter out the rows where 'merchant_name' is 'Sainsbury's'. Assign the resultant dataframe to a new variable, 'sains_data'.
sains_data <- filter(spend_data, merchant == "Sainsbury's")
View(sains_data)


# From the `spend_data` dataframe, use the `mutate()` function to calculate 'average_spent' of each spender by dividing 'amount' by `individuals`.
View(mutate(spend_data,
            average_spent = amount / individuals))
mutate(spend_data,
  average_spent = amount / individuals)


# Group 'spend_data' by 'merchant_class', and then summarise the total money spent at each merchant by summing the 'amount'. View the result and interpret the findings.
View(spend_data %>% 
       select(amount, merchant, merchant_class) %>% 
        group_by(merchant) %>% 
        summarise(total_spent = sum(amount),
                  merchant_class))
