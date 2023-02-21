# This chart shows the length of songs throughout the years. The happier people were the longer songs would be.


# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("data_moods.csv")

# Group data by year and calculate the average song length for each year
# in order to find the time of the song. I divided a couple of lengths by actual song times and the number
# to get the time is to multiply by 1.673998045e-5
grouped_data <- original_data %>%
  mutate(year = str_sub(release_date, start = 1, end = 4),
         mean_length = length * 1.673998045e-5) %>%
  group_by(year) %>%
  summarise(song_length = mean(mean_length, na.rm = TRUE))



# Create ggplot2 bar graph
ggplot(grouped_data, aes(x = year, y = song_length)) +
  geom_bar(stat = "identity", fill = "#2196F3") +
  labs(x = "Year", y = "Song length (seconds)", title = "Average Song Length by Year") +
  theme_minimal()
