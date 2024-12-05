library(ggplot2)
library(tidyverse)

joined_status <- read_csv("derived_data/joined_status.csv")

the_plot <- joined_status %>%
  group_by(LONGNAME, delay) %>%
  summarize(count = n()) %>%
  ggplot(aes(x = LONGNAME, y = count, fill = factor(delay))) +
  geom_col(position = "fill") +
  labs(x = "Airline", y = "Number of Flights", fill = "Delay Category") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  coord_flip() 

ggsave("figures/percent_delays_airlines.png", the_plot)