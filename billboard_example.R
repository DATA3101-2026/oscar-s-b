library(tidyverse)
library(dplyr)
library(billboard)
library(tidyr)



# Step 1: Look at the data
billboard <- billboard

# test out pivot_longer, we are removing the long list of wk variables and instead organizing them in an easier to read format
bb_long <- billboard |> pivot_longer( 
  cols = starts_with("wk"), # taking columns from billboard that starts with "wk"
  names_to = "week",
  names_prefix = "wk",
  names_transform = as.integer, 
  values_to = "rank",
  values_drop_na = TRUE,
)


# Step 2: First example of ggplot, it is categorizing artists into different colours based on their weeks and ranking
ggplot(data = bb_long,
       mapping = aes(x = week, y = rank, colour = artist)) + geom_point()

# Making a dataset with just three of the songs (bye Bye Bye, Kryptonite, With Arms Wide Open
example_songs <- bb_long %>%
  filter(track %in% c("Bye Bye Bye", "Kryptonite", "With Arms Wide Open"))

#Step 3: Using different ggplot tools
# Plot using ggplot to make a time series of the three songs. Considering peak ranking and which week
ggplot(example_songs, aes(x = week, y = rank, group = track, color = track)) +
  geom_line(linewidth = 1.2) +  # how thick the lines are
  geom_point(size = 2) + # change the size of the datapoints
  # Reverse the Y-axis, ranks start at the very top of the graph.
  scale_y_reverse(breaks = c(1,10, 20, 50, 100)) + 
  # look into the colour brewer
  scale_color_brewer (palette = "Set2") + 
  labs(
      title = "Billboard Hot 100 Performance in 2000",
      subtitle = "Weekly billboard place of selected hit singles",
      x = "Weeks on Chart",
      y = "Chart Rank (Top is Higher)",
      color = "Song Title",
      caption = "Data Source: tidyr::billboard"
  )