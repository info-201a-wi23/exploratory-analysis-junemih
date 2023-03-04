# This chart shows the most popular mood in music for each year

# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("/Users/theophilasetiawan/Documents/INFO 201 (main)/Info201code/exploratory-analysis-junemih/data_moods.csv")

# Group years together
grouped_data <- original_data %>%
  mutate(Year = str_sub(release_date, start = 1, end = 4)) %>%
  group_by(Year, mood) %>%
  summarise(mean_valence = mean(valence, na.rm = TRUE))

# Define colors for each mood
mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")

selected_years <- c(2010, 2015, 2020)

# Convert the Year variable to numeric
grouped_data$Year <- as.numeric(grouped_data$Year)

# Plot the data
ggplot(grouped_data, aes(x = Year, y = mean_valence, color = mood, group = mood)) +
  geom_line() +
  scale_color_manual(values = mood_colors) +
  labs(x = "Year", y = "Mean Valence", title = "Mood Trends over Time") +
  theme_minimal() +
  theme(legend.position = "bottom")

