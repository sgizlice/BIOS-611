library(ggplot2)
library(tidyverse)

joined_status <- read_csv("derived_data/joined_status.csv")

the_plot <- joined_status %>%
  count(month_name) %>%
  ggplot(aes(x = month_name, y = n)) +
  geom_col() +
  labs(x = "Month", y = "Number of Flights") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

ggsave("figures/flights_per_month.png", the_plot)
