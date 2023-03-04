# This chart shows how the tempo of a song correaltes with the emotions of listeners

# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("/Users/theophilasetiawan/Documents/INFO 201 (main)/Info201code/exploratory-analysis-junemih/data_moods.csv")


# Define colors for each mood
mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")


# Create ggplot2
ggplot(original_data) +
  aes(x = mood, y = tempo, color = mood, group = mood) +
  geom_point() +
  scale_color_manual(values = mood_colors) +
  labs(x = "tempo", y = "mood", title = "How tempo affects moods") +
  theme(legend.position = "bottom")
