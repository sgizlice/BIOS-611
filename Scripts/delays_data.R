library(tidyverse)

flights <- read_csv("source_data/flights.csv")

delays <- flights %>% filter(ARRIVAL_DELAY > 0)

write_csv(delays,"derived_data/delays.csv")