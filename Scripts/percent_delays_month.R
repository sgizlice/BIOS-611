library(ggplot2)
library(tidyverse)

joined_status <- read_csv("derived_data/joined_status.csv")

the_plot <- joined_status %>%
  group_by(month_name, delay) %>%
  summarize(count = n()) %>%
  ggplot(aes(x = month_name, y = count, fill = factor(delay))) +
  geom_col(position = "fill") +
  labs(x = "Month", y = "Number of Flights", fill = "Delay Category") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("figures/percent_delays_month.png", the_plot)