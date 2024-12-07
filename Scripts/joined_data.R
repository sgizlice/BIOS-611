library(tidyverse)

airlines <- read_csv("source_data/airlines.csv")
flights <- read_csv("source_data/flights.csv")

airline <- airlines %>% rename(AIRLINE=IATA_CODE, LONGNAME=AIRLINE)

status <- flights %>%
  filter(!is.na(ARRIVAL_DELAY)) %>%
  mutate(delay = ifelse(ARRIVAL_DELAY > 0, 'Delayed', 'On Time'))

joined_status <- status %>% inner_join(airline, by="AIRLINE")

write_csv(joined_status,"derived_data/joined_status.csv")
