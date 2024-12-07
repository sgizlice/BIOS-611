library(ggplot2)
library(tidyverse)

joined_status <- read_csv("derived_data/joined_status.csv")

large_status <- joined_status %>%
  group_by(ORIGIN_AIRPORT) %>%
  filter(n() >75000)

the_plot <- large_status %>%
  group_by(ORIGIN_AIRPORT, delay) %>%
  summarize(count = n()) %>%
  group_by(ORIGIN_AIRPORT) %>%
  mutate(percent = count / sum(count)) %>%
  ggplot(aes(x = ORIGIN_AIRPORT, y = percent, fill = factor(delay))) +
  geom_col(position = "dodge") +
  labs(x = "Origin Airport", y = "Percentage of Flights", fill = "Delay Category") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = scales::percent)

ggsave("figures/percent_delays_origin.png", the_plot)