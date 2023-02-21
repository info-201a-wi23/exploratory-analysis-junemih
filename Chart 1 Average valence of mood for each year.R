# This chart shows the most popular music 


# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("data_moods.csv")


grouped_data <- original_data %>%
  mutate(Year = str_sub(release_date, start = 1, end = 4)) %>%
  group_by(Year, mood) %>%
  summarise(mean_valence = mean(valence, na.rm = TRUE))

# Define colors for each mood
mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")

# Create ggplot2 scatter plot
ggplot(grouped_data, aes(x = Year, y = mean_valence, color = mood)) +
  geom_point() +
  scale_color_manual(values = mood_colors) +
  labs(x = "Year", y = "Average Valence", title = "Mood Trends over Time") +
  theme_minimal() +
  theme(legend.position = "bottom")
