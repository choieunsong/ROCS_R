install.packages("tidyverse")
library(tidyverse)

setwd("C:/Users/wgc521/Desktop/week2")
df <- read_csv("all_games_cleaned.csv")
View(df)

df$meta_score %>% min %>% print
df$meta_score %>% max %>% print

# challenge 1
# calculate the range in user scores yourself over this dataset.
df$user_review %>% range %>% print


# challenge 2
# calculate the mean critic score for a game in this dataset
df$meta_score %>% mean %>% print
df$meta_score %>% median %>% print


# challenge 3
# Imagine a threshold for a critic score which is so high that only 1% of games would exceed this overall score. Use R’s quantile function to estimate this value. If you are struggling with this, remember that you can look up help on a function by typing `?FUNCTION_NAME`
threshold <- quantile(df$meta_score, c(0.99))
View(df[df$meta_score >= threshold, ] %>% 
         arrange(meta_score) %>% 
         mutate(threshold = threshold))

ggplot(df, aes(x=meta_score)) + geom_histogram() + 
  labs(title="Histogram of Meta Scores",
       x="Meta Score",
       y="Frequency")


# challenge 4
# Recreate the histogram above, but using 100 bins rather than the default.
ggplot(df, aes(x=meta_score)) + 
  geom_histogram(color="blue", fill="white", bins=100) + 
  labs(title="Histogram of Meta Scores",
       x="Meta Score",
       y="Frequency")


# challenge 5
#: Read up on the tidyverse’s `lubridate` package, and use it to extract the year from release_date (Make Dealing with Dates a Little Easier • lubridate (tidyverse.org))
install.packages("lubridate")
library(lubridate, warn.conflicts = FALSE)

df$release_year <- df$release_date %>%  str_sub(start=-4)
View(df)


# challenge 6
# Imagine a threshold for a critic score which is so high that only 1% of games would exceed this overall score. Use R’s quantile function to estimate this value for each platform.
df %>% 
   group_by(platform) %>% 
   summarise(mean_meta = mean(meta_score)) %>% 
   filter(mean_meta >= quantile(mean_meta, c(0.99))) %>% 
  print
 

# challenge 7
# Create a visualisation in ggplot2 which shows a different box plot for each platform, allowing the distribution of critic scores on each of these to be quickly understood. Hints: In order to do this, you would operate over df itself; you would need to specify both an x and a y value within ggplot2’s aes. You would also need to replace geom_histogram() with geom_boxplot
platform_df <- df %>% 
  group_by(platform) %>% 
  summarise(mean_meta=mean(meta_score))
View(platform_df)
ggplot(df, aes(x=platform, y=meta_score)) +
  geom_boxplot(color="blue", fill="white")+
  labs(title="Distribution of Critic Scores by Platform",
       x="Platform",
       y="Mean Meta Scores")


# challenge 8
#  Generate a metric which represents the divergence of critic scores from user scores. Use descriptive statistics and visualisations to explore whether this divergence may be particularly extreme in specific platforms. Hint: You may need to account for a difference in ranges between critic and user scores in order to accurately generate this score. User scores range up to 10, but what range of values may critic scores take?

df <- df %>% 
  mutate(divergence = abs(meta_score - (user_review * 10))) 

View(df)

divergence_df <- df %>% 
  group_by(platform) %>% 
  summarise(mean_divergence = mean(divergence))

View(divergence_df)

ggplot(divergence_df, aes(x=platform, y=mean_divergence))+
  geom_bar(stat="identity", color="black", fill="red")+
  labs(
    title="Divergence of Critic Scores from User Review",
    x="Platform",
    y="Mean Divergence"
  )


# challenge 9
# Generate visualisations and descriptive statistics to explore whether disagreement between critics and users is becoming more or less extreme with time.
library(ggplot2)

disagreement_df <- df %>% 
  select(release_year, divergence) %>% 
  group_by(release_year) %>% 
  summarise(mean_divergence = mean(divergence))

View(disagreement_df)

ggplot(disagreement_df, aes(x=release_year, y=mean_divergence))+
  geom_point()+
  labs(
    title="Disagreement between critics and users over years",
    x="release year",
    y="disagreement between critcs and users"
  )


# challenge 10
# If you scatterplot metascores and user scores, you will notice that the plotting is inaccurate due to the relatively low number of values that each of these variables can take on. Investigate a visualisation which would take this into account, and use it to visualise the relationship between these values.
df$user_review_ten <- df$user_review * 10 %>% print
View(df)

ggplot(df, aes(x=meta_score, y=platform))+
  geom_boxplot(fill="steelblue")

ggplot(df, aes(x=meta_score, y=platform, fill=user_review_ten))+
  geom_boxplot()
