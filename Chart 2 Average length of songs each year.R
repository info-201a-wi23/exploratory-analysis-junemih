# This chart shows the length of songs throughout the years. The happier people were the longer songs would be.

# Throughout the years, the average length of songs increase and decrease based off of what and how much people
# had to say. The most noticeable year is 1994 which was arguably one of the best years of music of all time. This is because
# this was the start of pre dot com, people were happy, the state of the economy was recovering from the early 1990's recession
# it was a great year for movies, and there was a lot to talk about. Spikes in average song length can also be closely correlated 
# to happy song mood as well. In cases where happy songs had the highest mean valance, song lengths typically had longer times as 
# well. A case study that analyzed conversations among 20,000 people found that happy people tend to be more talkative. This coloration
# was found based off people who were happier having not only longer conversations but less small chat and more substantive conversations.
# This study helps show the linkage between peoples emotions and moods playing a big role on how much they talk and say or in this case, thier music. 

# Citation: 
# Eavesdropping on happiness: Well-being is related to ... - sage journals. (n.d.). Retrieved February 21, 2023, from https://journals.sagepub.com/doi/abs/10.1177/0956797610362675?journalCode=pssa 


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
