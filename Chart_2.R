# This chart shows the length of songs throughout the years. The happier people were the longer songs would be.

# Citation: 
# Eavesdropping on happiness: Well-being is related to ... - sage journals. (n.d.). Retrieved February 21, 2023, from https://journals.sagepub.com/doi/abs/10.1177/0956797610362675?journalCode=pssa 


# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("/Users/theophilasetiawan/Documents/INFO 201 (main)/Info201code/exploratory-analysis-junemih/data_moods.csv")

# Group data by year and calculate the average song length for each year
# in order to find the time of the song. I divided a couple of lengths by actual song times and the number
# to get the time is to multiply by 1.673998045e-5
grouped_data <- original_data %>%
  mutate(year = str_sub(release_date, start = 1, end = 4),
         mean_length = length * 1.673998045e-5) %>%
  group_by(year) %>%
  summarise(song_length = mean(mean_length, na.rm = TRUE))


# Define the years 
selected_years <- c("2000", "2005", "2010", "2015", "2020")

# Filter the data to include only the selected years
selected_data <- grouped_data %>% filter(year %in% selected_years)

# Create ggplot2 bar graph with selected years on x-axis
ggplot(selected_data, aes(x = year, y = song_length)) +
  geom_bar(stat = "identity", fill = "#2196F3") +
  scale_x_discrete(limits = selected_years) +
  labs(x = "Year", y = "Song length (seconds)", title = "Average Song Length by Year") +
  theme_minimal()

