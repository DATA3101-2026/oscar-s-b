library(tidyverse)
library(rvest)
library(httr2)
library(jsonlite)
library(purrr)
library(dplyr)
library(knitr)
library(ggplot2)

library(tidytuesdayR)

#----Set up the Datasets----
ocean_temperature <- tuesdata$ocean_temperature
ocean_temperature_deployments <- tuesdata$ocean_temperature_deployments

# Create a new dataset that merges the two
ocean_temp <- cross_join(ocean_temperature, ocean_temperature_deployments, copy = FALSE) |>
  filter(date >= ocean_temperature_deployments$start_date & date <= ocean_temperature_deployments$end_date) # Making sure the data collected is within the range we wish to look at

#----Let's Look at the data----

ggplot(ocean_temp) + 
  geom_area(mapping=aes(date, mean_temperature_degree_c, fill = deployment_id))



#----plot 1: Improve the class plot----
# x and y axis titles are clear and easy to read
# Graph has a title
# graph has a subtitle showing where the data was sourced from


ggplot(ocean_temp) + 
  geom_area(mapping=aes(mean_temperature_degree_c, date, colour = deployment_id)) +
  labs(x = "Average Temperature in C°", y = "Date",
       title = "Average Water Temperature by Date Across Deployments",
       subtitle = "Data sourced from TidyTuesday Ocean Temperature Data" # where data was sourced from
       
       )

#----plot 2: A single deployment----
# filter or subset into one deployment_id of your choice
# make a line plot of that deployment's current temperature over time
# Make the colour of the line in the plot cyan
# Make sure the title, subtitle, and axes have descriptive and clear notes about what the plot's purpose is

ocean_temp7 <- ocean_temp |>
  filter(deployment_id == "depl_07")

ggplot(ocean_temp7) + 
  geom_line(mapping=aes(date,mean_temperature_degree_c), colour = "cyan") +
  labs(x = "Date", y = "Average Temperature in C°",
       title = "Deployment 7's Average Temperature in Degrees Celsius (C°) over time",
       subtitle = "Data sourced from TidyTuesday Ocean Temperature Data" # where data was sourced from
  )



#----plot 3: A different deployment, with standard deviation----
# filter the ocean_temp dataframe to a different deployment_id than the one used in plot 2
# create a plot showing the mean temperature (mean_temperature_degree_c) as a red line
# Add standard deviation lines on either side of the mean, using the sd_temperature_degree_c column (i.e., mean + sd and mean - sd)
# add appropriate axis titles, a plot title, and data sources


ocean_temp3 <- ocean_temp |>
  filter(deployment_id == "depl_03")

ggplot(ocean_temp3) + 
  geom_line(mapping=aes(date, mean_temperature_degree_c), colour = "red") +
  labs(x = "Date", y = "Average Temperature in C°",
       title = "Deployment 3's Average Temperature in Degrees Celsius (C°) over time",
       subtitle = "Data sourced from TidyTuesday Ocean Temperature Data" # where data was sourced from
      ) +
  geom_pointrange(aes(
    x = date,
    y = mean_temperature_degree_c,
    
    ymin = mean_temperature_degree_c - sd_temperature_degree_c,
    ymax = mean_temperature_degree_c + sd_temperature_degree_c
    
    ),
    colour = "black",
    size = 0.1
  )
    # note: this was difficult to find out how to do, but definitely learned a better structure for R code out of it














                      