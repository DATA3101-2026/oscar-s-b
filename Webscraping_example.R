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

