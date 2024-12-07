library(ggplot2)
library(tidyverse)

joined_status <- read_csv("derived_data/joined_status.csv")

the_plot <- joined_status %>%
  group_by(LONGNAME, delay) %>%
  summarize(count = n()) %>%
  group_by(LONGNAME) %>%
  mutate(percent = count / sum(count)) %>%
  ggplot(aes(x = percent, y = LONGNAME, fill = factor(delay))) +
  geom_col(position = "dodge") +
  labs(x = "Percentage of Flights", y = "Airline", fill = "Delay Category")

ggsave("figures/percent_delays_airlines.png", the_plot)