library(tidyverse)
library(rvest)
library(httr2)
library(jsonlite)
library(purrr)
library(dplyr)
library(knitr) 

link <- "https://en.wikipedia.org/wiki/List_of_counties_of_Nova_Scotia" # data
page <- read_html(link) # values

nsc <- data.frame(page |> # creating a new dataframe for Nova Scotia Counties
                    html_element("table.wikitable.sortable") |> #html element to find
                    html_table())

view(nsc)

kable(nsc, caption = "Table scraped from Wikipedia for class, showing a list of the counties in Nova Scotia, Canada.")

dim(nsc) #dimensions

# Clean up the 2021 population names
names(nsc)[names(nsc) == 'Population.2021..7.'] <- 'Population_2021'
colnames(nsc)



nsc$Population_2021 <- gsub(",","", nsc$Population_2021) #removing all of the commas to get only numbers in the column
nsc$Population_2021 <- as.numeric(as.character(nsc$Population_2021)) # How does it w

max(nsc$Population_2021) # CHECKING max cvalue
max(nsc$Population_2021[1:18])
# or
max(nsc$Population_2021[-19]) #removing the TOTAL column

#save, commit, push. Add a clear explanation of what we covered


nblink <- "https://en.wikipedia.org/wiki/List_of_counties_of_New_Brunswick"
nbpage <- read_html(nblink)

nbc <- data.frame(nbpage |>
                    html_element("Table.wikitable.sortable") |>
                    html_table())

#----Looking at the Dataframe names----

colnames(nbc) #

# Preparation for assignment 7

library(RJSONIO)

#---- How can we figure out the coordinates for where our classroom is?----
lat <- 45.902055
lon <- -64.373069

#----Create a web scraping request----
resp <- request("https://api.open-meteo.com/v1/forecast") |>
  req_url_query(
    latitude = lat,
    longitude = lon,
    current = "temperature_2m,wind_speed_10m,wind_direction_10m,cloud_cover"
  ) |>
  req_perform()

weather <- resp_body_json(resp)
weather$current

# Weather save

weatherJSON <-toJSON(weather)

write(weatherJSON, "weather-test.json")

#----Species in the area----

inat <- request("https://api.inaturalist.org/v1/observations") |> #creating a new dataset from api request
  req_url_query(lat = lat, lng = lon, radius = 1, per_page = 50,
                quality_grade = "research") |>
  req_perform() |>
  resp_body_json()

species <- sapply(inat$results, \(x) x$taxon$name)
table(species)

#----Saving to a json file----


library(rinat)

#--- Species in the area----

inat <- request("https://api.inaturalist.org/v1/observations") |>
  req_url_query(lat = lat, lng = lon, radius = 1, per_page = 50,
                quality_grade = "research") |>
  req_perform() |>
  resp_body_json()
  
  
  #---- Some groups will have either proprietary or open source versions
  #     of their api for an easier time getting data
  #----
monarchs <- get_inat_obs(query = "Monarch Butterfly", year = 2026, month = 8)

# Which taxa were returned? What does this mean?
unique(monarchs$scientific_name)



#----Testing out bounding box of another species ----

## Search by area

bounds <- c(45.55, -64.7, 46, -64.25) #bottom left x value, bottom left y value, top right x value, top right y value (x,y)
heron <- get_inat_obs(query = "Great Blue Heron", bounds = bounds)
plot(heron$longitude, heron$latitude)

# -- Save Species Information --
specJSON <- toJSON(species)

write(specJSON, "species-test.json") 





