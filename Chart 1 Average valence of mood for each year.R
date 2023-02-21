# This chart shows the most popular mood in music for each year

# Looking at this chart we can see that happy songs dominated from 1963 up until 2000. This is most likely because
# energetic and calm songs were not tracked at the time. However, when looking at sad and happy songs, the typical trend 
# for when the valence of happy songs dropped was because of major events taking place both political and economical. 
# Taking a look at the early 1990's recession, the first few years of the recession resulted in an increase of sad songs 
# and decrease of happy songs. Another example is from 2007 to 2008, happy music dropped when a recession first took place. 
# We can also take a look at around 2019 and 2020 when COVID 19 happened, there was a drop in happy music and sad music dominated.
# This is due to many factors caused by the pandemic and many more issues. This resulted in an increase of mental health issues,
# economical issues, and sociological issues that ultimately brought down everyone mood which can be seen through the music being
# put out. Another case to look at was 1995 to 1999 where energetic music was soaring and happy music valence was high for the most part.
# This was the dot com era where many became rich and where massive growth of internet happened. However, not soon after, the dot com bust
# which caused the stock market to crash in 2000, completely plummeting everyone's mood hence the drastic drop in happy music. 


# Load libraries
library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

original_data <- read.csv("data_moods.csv")

# Group years together
grouped_data <- original_data %>%
  mutate(Year = str_sub(release_date, start = 1, end = 4)) %>%
  group_by(Year, mood) %>%
  summarise(mean_valence = mean(valence, na.rm = TRUE))

# Define colors for each mood
mood_colors <- c("Happy" = "#FFC107", "Sad" = "#2196F3", "Energetic" = "#F44336", "Calm" = "#4CAF50")

# Create ggplot2 line plot
ggplot(grouped_data, aes(x = Year, y = mean_valence, color = mood, group = mood)) +
  geom_line() +
  scale_color_manual(values = mood_colors) +
  labs(x = "Year", y = "Mean Valence", title = "Mood Trends over Time") +
  theme_minimal() +
  theme(legend.position = "bottom")

