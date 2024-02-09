# Ensure the ggplot2 library is loaded
library(ggplot2)
library(dplyr)

# Load your data
worldometer_data <- read.csv("dataset/worldometer_data.csv")

# Check column names and replace spaces if necessary
names(worldometer_data) <- gsub(" ", "", names(worldometer_data))

# Filter for South American countries
south_america_data <- worldometer_data %>% 
  filter(Continent == "South America")

# Create the scatter plot
ggplot(south_america_data, aes(x = Population, y = TotalCases, label = Country.Region)) +
  geom_point(aes(color = Country.Region)) + 
  geom_text(vjust = -0.5, hjust = 1.1, size = 3) +
  scale_x_log10() + 
  scale_y_log10() +
  labs(title = "Total COVID-19 Cases vs. Population in South America",
       x = "Population",
       y = "Total COVID-19 Cases",
       caption = "Data points are colored by country with country names labeled.") +
  theme_minimal()

