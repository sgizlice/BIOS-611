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
  count(month_name) %>%
  ggplot(aes(x = month_name, y = n)) +
  geom_col() +
  labs(x = "Month", y = "Number of Flights") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("figures/flights_per_month.png", the_plot)