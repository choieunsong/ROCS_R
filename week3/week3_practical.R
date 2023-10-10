install.packages("tidyverse")
library(tidyverse)

setwd("/Users/eunsong/Documents/WorkSpace/ROCS_R/week3")
df <- read_csv("all_games_cleaned.csv")
View(df)


# In essence, this code calculates how many games there are for each platform, orders the platforms by this count, and then prints the result.
df_platform_summary <- df %>% group_by(platform) %>% 
  summarise(n=n()) %>% 
  arrange(n %>% desc) %>% 
  print(n=Inf)


# challenge 1
# Now, let’s visualise this data using ggplot. Create a visualisation that is equivalent to the one below. Stretch Challenge: I have ordered the columns by ‘n’ – try to do this yourself too.
ggplot(df_platform_summary, 
       aes(x = n, y= reorder(platform, n))) +
  geom_histogram(fill="#58ded0", stat="identity") +
  labs(title="Number of Games Per Platform", x="Number of Games", y="Platform") 


# challenge 2
# Think about this plot. Do you think our data are able to represent the entire videogame market? Is there anything here that falsifies this idea?
# outliers -> exceptional cases


# challenge 3
# Produce appropriate statistics to understand the spread and central tendency of the number of games per year within our dataset.
install.packages("lubridate")
library(lubridate, warn.conflicts = FALSE)

df$release_year <- df$release_date %>%  str_sub(start=-4)
View(df)

df_year_summary <- df %>% group_by(release_year) %>% 
  summarise(
    n=n()) %>% 
  arrange(n %>% desc) %>% 
  print(n=Inf)

mean_num_games <- mean(df_year_summary$n)
median_num_games <- median(df_year_summary$n)
standard_num_games <- sd(df_year_summary$n)
summary(df_year_summary)
cat("Standard Deviation of games per year:", standard_num_games,"\n")


# challenge 4
# Produce a visualisation of the total number of games per year. Stretch Challenge: integrate some kind of visualisation of central tendency within this plot. For example, you could try to replicate the bar plot below, which integrates a dashed line showing mean games per year:
ggplot(df_year_summary, aes(x=release_year %>% as.numeric, y=n)) +
  geom_col(fill="#58ded0")+
  labs(title="Number of Games Per Year", x="Year", y="Number of Games") +
  geom_hline(yintercept=mean_num_games, linetype="dashed")


# challenge 5
# Reproduce a similar descriptive graphic to the one below for the relationship between (a) time x critic score, (b) time x use score, and (c) user score x critic score.
df$timestamp <- df$release_date %>% mdy
View(df)

# (a) time x critic score
ggplot(df, aes(x = timestamp, y=meta_score)) + 
  geom_bin_2d() + 
  labs(title = "Metascore by timestamp", x = "Date", y = "Critic score")

# (b) time x user score
ggplot(df, aes(x = timestamp, y=user_review)) + 
  geom_bin_2d() + 
  labs(title = "Userscore by timestamp", x = "Date", y = "User score")

# (c) user score x critic score
ggplot(df, aes(x = meta_score, y=user_review)) + 
  geom_bin_2d() + 
  labs(title = "Metascore by userscore", x = "Critic score", y = "User score")


# correlation between time and critic scores
cor(df$meta_score, df$timestamp %>% as.numeric, method="spearman")


# challenge 6
# Use ?cor.test() to look at the help for R’s native correlation test function, and use it to run Spearman’s rank correlation over your data. Attempt to interpret the p-value obtained. Make sure to use `method=”spearman”` in order to use the correct test Hint: If you do not come from a scientific background, you may need to Google the idea of the ‘scientific notation for numbers’
cor.test(df$meta_score, df$timestamp %>% as.numeric, 
         method="spearman", 
         exact=FALSE)

plot(df$meta_score, df$timestamp)

y = ax + b

# challenge 7
# 1. Are video games becoming more critically acclaimed over time?
# 2. Are video games becoming more well-received by their players over time?
cor.test(df$user_review, df$timestamp %>% as.numeric,
         method="spearman", 
         exact=FALSE)

# 3. Is agreement between critics and players becoming more substantial over time?
cor.test(df$meta_score, df$user_review,
         method="spearman", 
         exact=FALSE)

help(cor.test)
