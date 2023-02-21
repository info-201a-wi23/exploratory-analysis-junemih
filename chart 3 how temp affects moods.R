library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("data_moods.csv")

mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")

ggplot(original_data, aes(x = tempo, y = mood)) +
  geom_point() +
  scale_color_manual(values = mood_colors) +
  labs(x = "tempo", y = "mood", title = "How tempo affects moods") +
  theme_minimal()
