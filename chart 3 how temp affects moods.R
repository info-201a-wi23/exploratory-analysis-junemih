# In our third chart, it is shown that the tempo of a song correlates closely with the emotions of the listeners 
# after the song is played. Fast tempos correlate with happiness and feeling energetic, whereas songs with slow 
# tempos correlate closely with feelings of sadness or calm. While this may suggest that music can cause these 
# feelings to arise, it can also be seen as a way of reinforcing existing emotions as well. Perhaps listeners feel 
# validated and can dwell on their emotions better when listening to music that makes them feel well-understood. It 
# is unclear whether, for example, sad people tend to listen to slow music more to reinforce and help them feel 
# understood in their sadness, or if slow music tends to make people feel sad. It could also be a two-way street, 
# where people who feel those emotions tend to be drawn to the correlating music, which further reinforces those 
# emotions and causes them to be more prevalent or strong in the listeners' lives.

# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")


original_data <- read.csv("data_moods.csv")


# Define colors for each mood
mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")


# Create ggplot2
ggplot(original_data) +
  aes(x = mood, y = tempo, color = mood, group = mood) +
  geom_point() +
  scale_color_manual(values = mood_colors) +
  labs(x = "tempo", y = "mood", title = "How tempo affects moods") +
  theme(legend.position = "bottom")
