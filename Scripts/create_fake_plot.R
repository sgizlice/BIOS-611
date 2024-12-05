library(ggplot2)
library(tidyverse)

flight_delays <- read_csv("source_data/flight_delays.csv")

the_plot <- flight_delays %>%
  count(Origin) %>%
  ggplot(aes(x = Origin, y = n)) +
  geom_col() +
  labs(x = "Origin Airport", y = "Number of Flights") 

ggsave("figures/fake_data_origin.png", the_plot)
