library(tidyverse)
library(dplyr)
library(nycflights13)

flights |>
  filter(dest == "IAH") |> # changes which rows are present
  group_by(year, month, day) |>
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )


jan1 <- flights |>
  filter(month == 1 & day == 1) # and statement

jan1 |>
  filter(month == 1 | 2) # or statement

jan1 |>
  filter(dest =="IAH")

flights |>
  arrange(dep_delay)

flights |>
  distinct() # finds all the unique rows in a dataset

flights |>
  distinct(origin, dest)

flights |>
  count(origin, dest, sort = TRUE)

flights |>
  mutate() # creates new columns)

flights |> 
  arrange(speed)

date <- flights|>
  select(year, month, day) #selects columns by name

flights |>
  select(year:day) # select all columns between year and day ! operator would nullify

flights |>
  rename(tail_num = tailnum)
  

  

  