library(ggplot2)
library(tidyverse)

airlines <- read_csv("source_data/airlines.csv")
delays <- read_csv("derived_data/delays.csv")

airlines <- airlines %>% rename(AIRLINE=IATA_CODE, LONGNAME=AIRLINE)
joined_airline <- delays %>% inner_join(airlines, by="AIRLINE");

the_plot <- joined_airline %>%
  count(LONGNAME) %>%
  ggplot(aes(x = LONGNAME, y = n)) +
  geom_col() +
  labs(x = "Airline", y = "Number of Delayed Flights") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("figures/flights_per_airline.png", the_plot)
