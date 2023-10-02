install.packages("tidyverse")
library(tidyverse)

setwd("/Users/eunsong/Documents/WorkSpace/ROCS_R/week2")
df <- read_csv("all_games_cleaned.csv")
View(df)

df$meta_score %>% min %>% print
df$meta_score %>% max %>% print

# To see the smallest meta_score's row
# View(df[which.min(df$meta_score),])
mrownum <- which.min(df$meta_score)
df[mrownum,] %>% print

# challenge 1
# calculate the range in user scores yourself over this dataset.
range(df$user_review) %>% print
df$user_review %>% min %>% print
df$user_review %>% max %>% print

# challenge 2
# calculate the mean critic score for a game in this dataset
df$user_review %>% mean %>% print
df$user_review %>% median %>% print
# mode
names(sort(-table(df$user_review)))[1]
View(sort(-table(df$user_review)))

# challenge 3
# Imagine a threshold for a critic score which is so high that only 1% of games would exceed this overall score. Use R’s quantile function to estimate this value. If you are struggling with this, remember that you can look up help on a function by typing `?FUNCTION_NAME
thresehold <- quantile(df$meta_score, c(0.99))
View(df[df$meta_score >= thresehold, ] %>% 
       arrange(meta_score) %>% 
       mutate(, threshold = thresehold))


ggplot(df, aes(x=meta_score))+geom_histogram()

ggplot(df, aes(x=meta_score))+geom_histogram(color="blue")

ggplot(df, aes(x=meta_score)) +
  geom_histogram()+
  labs(title="Histogram of Meata Scores", x="Meta Score", y="Frequency")

# challenge 4
# Recreate the histogram above, but using 100 bins rather than the default.
ggplot(df, aes(x=meta_score))+
  geom_histogram(color="blue", fill="white", bins=100)+
  labs(title="Histogram of Meata Scores", x="Meta Score", y="Frequency")


# lubridate
install.packages("lubridate")
library(lubridate, warn.conflicts=FLASE)

ymd(20101215)

mdy("4/1/16")

df$release_year <- df$release_date %>%  str_sub(start=4)

# challenge 5
# Read up on the tidyverse’s `lubridate` package, and use it to extract the year from release_date
df$release_year <- df$release_date %>%  str_sub(start=-4)
View(df)


df %>% 
  group_by(platform) %>% 
  summarise(mean_meta = mean(meta_score)) %>% 
  print

# challege 6
#  Imagine a threshold for a critic score which is so high that only 1% of games would exceed this overall score. Use R’s quantile function to estimate this value for each platform.
df_grp_by_plf <- (df %>% 
                group_by(platform) %>% 
                summarise(mean_meta = mean(meta_score)))
View(df_grp_by_plf)
threshold <- quantile(df_grp_by_plf$mean_meta, 0.99)
df_grp_by_plf %>% 
  filter(, mean_meta >= quantile(mean_meta, 0.99)) %>%
  print

# ?question
# can I abbreiviate above codes into one pipe code?
# I tried, but how can I affix summarse ~ filter part. mean_meta is not existent


# challenge 7
# Create a visualisation in ggplot2 which shows a different box plot for each platform, allowing the distribution of critic scores on each of these to be quickly understood. Hints: In order to do this, you would operate over df itself; you would need to specify both an x and a y value within ggplot2’s aes. You would also need to replace geom_histogram() with geom_boxplot
ggplot(df, aes(x=platform, y=meta_score)) +
  geom_boxplot(color="blue", fill="white")+
  labs(
    title="Distribution of Critic Scores by Platform",
    x="Platform",
    y="Meta Scores")


# challenge 8
# Generate a metric which represents the divergence of critic scores from user scores. Use descriptive statistics and visualisations to explore whether this divergence may be particularly extreme in specific platforms. Hint: You may need to account for a difference in ranges between critic and user scores in order to accurately generate this score. User scores range up to 10, but what range of values may critic scores take?
df <- df %>% 
  mutate(divergence = abs(meta_score - (user_review * 10)))
View(df)
divergence_df <- df %>% 
                    group_by(platform) %>% 
                    summarise(
                              mean_divergence = mean(divergence),
                              sd_divergence=sd(divergence))
                
                  
                             
View(divergence_df)
ggplot(divergence_df, aes(x=platform, y=mean_divergence))+
  geom_bar(stat="identity", fill="white", color="blue")+
  labs(
    title="Divergence of Critic Scores from User Reviews",
    x="Platform",
    y="Mean Divergence"
    )


# challenge 9
# Generate visualisations and descriptive statistics to explore whether disagreement between critics and users is becoming more or less extreme with time.
disagreement_df <- (df %>% 
                      select(release_year, meta_score, user_review, divergence) %>% 
                      group_by(release_year) %>% 
                      summarise(mean_divergence = mean(divergence),
                                mean_meta_score = mean(meta_score),
                                mean_user_review = mean(user_review))
                    )
View(disagreement_df)
View(arrange(disagreement_df, release_year))

library(ggplot2)
ggplot(disagreement_df, aes(x=release_year, y=mean_divergence)) +
  geom_point() +
  labs(
    title = "Disagreement between critics and usere",
    x = "Released Year",
    Y = "Divergence between critics and users"
  ) +
  geom_smooth(method = "auto",
              col = "red")
# ?question. geom_smooth doens't work

# challenge 10
# If you scatterplot metascores and user scores, you will notice that the plotting is inaccurate due to the relatively low number of values that each of these variables can take on. Investigate a visualisation which would take this into account, and use it to visualise the relationship between these values.

     