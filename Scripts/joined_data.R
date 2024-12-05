library(tidyverse)
library(lubridate)

airlines <- read_csv("source_data/airlines.csv")
flights <- read_csv("source_data/flights.csv")

airlines <- airlines %>% rename(AIRLINE=IATA_CODE, LONGNAME=AIRLINE)

status <- flights %>%
  filter(!is.na(ARRIVAL_DELAY)) %>%
  mutate(delay = ifelse(ARRIVAL_DELAY > 0, 'Delayed', 'On Time'))

joined_status <- status %>% inner_join(airlines, by="AIRLINE")

# Create a vector of numbers
month_numbers <- 1:12
month_names <- month(month_numbers, label = TRUE)

joined_status <- joined_status %>%
  mutate(month_name = month(MONTH, label = TRUE))

write_csv(joined_status,"derived_data/joined_status.csv")
