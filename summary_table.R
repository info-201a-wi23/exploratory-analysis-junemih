### This program creates a table of summary information to be included in your report

# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

## Load data and name the original dataset original_data
original_data <- read.csv("/Users/theophilasetiawan/Documents/INFO 201 (main)/Info201code/exploratory-analysis-junemih/data_moods.csv")

# Create a new data frame with selected columns from an existing data frame
summary_data <- select(original_data, name, album, artist, release_date, popularity, danceability,
                       acousticness, energy, instrumentalness, liveness, valence, loudness, tempo,
                       time_signature, mood)

# Group by most popular per year
most_popular_per_year <- summary_data %>%
  group_by(year = str_sub(release_date, 1, 4)) %>%
  slice_max(popularity) %>%
  ungroup()

# Sort by popularity
popularity_sorted <- most_popular_per_year %>% arrange(desc(popularity))

# Remove unecessary columns 
popularity_sorted <- select(popularity_sorted, -liveness)
popularity_sorted <- select(popularity_sorted, -instrumentalness)
popularity_sorted <- select(popularity_sorted, -liveness)
popularity_sorted <- select(popularity_sorted, -danceability)
popularity_sorted <- select(popularity_sorted, -acousticness)
popularity_sorted <- select(popularity_sorted, -loudness)

# Move year to front
final_summary_data <- select(popularity_sorted, year, everything())

# Exports the summarized dataset
write.csv(final_summary_data, file = "final_summary_data.csv")












