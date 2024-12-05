library(ggplot2)
library(tidyverse)

delays <- read_csv("derived_data/delays.csv")

the_plot <- delays %>%
  group_by(ORIGIN_AIRPORT) %>%
  filter(n() >35000) %>%
  ggplot(aes(x = reorder(factor(ORIGIN_AIRPORT), ORIGIN_AIRPORT, length))) +
  geom_bar(fill = '#00798c') +
  labs(x = "Origin", y = "Number of Delayed Flights") +
  theme(axis.text.x = element_text(angle = -45, hjust = 0, size=6))

ggsave("figures/delay_by_airport.png", the_plot)