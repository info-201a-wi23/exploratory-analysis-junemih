### This program calculates summary information to be included in the report

# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

# Load data and name the original dataset original_data
original_data <- read.csv("/Users/theophilasetiawan/Documents/INFO 201 (main)/INFO 201/exploratory-analysis-junemih/data_moods.csv")

# What is the most number of song mood with popularity of more than 50 (popular)?
popular_songs_mood <- filter(original_data, popularity > 50) %>% 
  count(mood) %>% 
  arrange(desc(n)) 
popular_songs_mood$mood[1]


# What is the most popular song?
sorted_data <- original_data[order(-original_data$popularity), ]
most_popular_song <- sorted_data[1, ]
most_popular_song_artist <- paste(most_popular_song$name[1], "by", most_popular_song$artist[1])


# Which artist has the most songs with popularity of more than 50 (popular)?
popular_songs_artist <- filter(original_data, popularity > 50) %>% 
  count(artist) %>% 
  arrange(desc(n)) 
popular_songs_artist$artist[1]


# Allegro in music indicates that the song is fast, quick and bright (109–132 BPM).
# What is the mood with the highest number of songs with Allegro tempo, or 109-132 BPM?
allegro_songs <- original_data %>% 
  filter(tempo >= 109 & tempo <= 132)
mood_counts <- allegro_songs %>%  count(mood)
sorted_mood_counts <- mood_counts %>% arrange(desc(n))
most_allegro_mood <- sorted_mood_counts$mood[1]


# What is the song with the highest total number of danceability and energy?
original_data <- original_data %>% mutate(danceability_energy_total = danceability + energy)
song_with_max_danceability_plus_energy <- original_data %>% 
  filter(danceability_energy_total == max(danceability_energy_total))
song_with_max_total_danceability_energy <- paste(song_with_max_danceability_plus_energy$name[1], 
                                                 "by", song_with_max_danceability_plus_energy$artist[1])


# Store summary information in a list
summary_info <- list(popular_songs_mood$mood[1], 
                     most_popular_song_artist,
                     popular_songs_artist$artist[1],
                     most_allegro_mood,
                     song_with_max_total_danceability_energy)
