# Load libraries
library(ggplot2)
library(dplyr)

# Load public dataset
url <- "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv"
df <- read.csv(url)

# View data
head(df)
summary(df)

# Average tip by day
df %>%
  group_by(day) %>%
  summarise(avg_tip = mean(tip))

# Chart: Average tip by day
ggplot(df, aes(x = day, y = tip, fill = day)) +
  geom_boxplot() +
  labs(title = "Tip Distribution by Day", x = "Day", y = "Tip ($)") +
  theme_minimal()

# Chart: Total bill vs Tip
ggplot(df, aes(x = total_bill, y = tip, color = time)) +
  geom_point() +
  labs(title = "Total Bill vs Tip", x = "Total Bill ($)", y = "Tip ($)") +
  theme_minimal()
