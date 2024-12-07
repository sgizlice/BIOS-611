library(ggplot2)
library(tidyverse)
library(lubridate)

joined_status <- read_csv("derived_data/joined_status.csv")

# Create a vector of numbers
month_numbers <- 1:12
month_names <- month(month_numbers, label = TRUE)

joined_stat <- joined_status %>%
  mutate(month_name = month(MONTH, label = TRUE))

the_plot <- joined_stat %>%
  group_by(month_name, delay) %>%
  summarize(count = n()) %>%
  group_by(month_name) %>%
  mutate(total = sum(count),
         percent = count / total) %>%
  ggplot(aes(x = month_name, y = percent, fill = factor(delay))) +
  geom_col(position = "dodge") +
  labs(x = "Month", y = "Percentage of Flights", fill = "Delay Category") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("figures/percent_delays_month.png", the_plot)