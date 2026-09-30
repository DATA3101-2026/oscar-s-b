
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

flights |>
  distinct(carrier)
  
colnames(flights)

# Below I am answering Questions for Assignment 2b
# 3.2.5 Exercise 1:
flights |>
  filter(arr_delay >= 120) |># arrival delay of two or more hours
  filter(dest %in% c("IAH", "HOU")) |># flew to Houston
  filter(carrier %in% c("AA", "UA", "DL")) |>#Operated by United, American, or Delta
  filter(month %in% c(7,8,9)) |>#departed in summer (July, August, September)
  filter(arr_delay >= 120, dep_delay == 0) |>#Arrived more than two hours alte but didnt leave late
  filter(dep_delay >= 60, arr_delay <= dep_delay -30)
  
#returns zero valid matches because it asks for planes to have 1. arrived more than 2 hours late but didnt leave late, and 2. Delayed by at least an hour. These contradict

# 3.2.5 Excercise 2:
flights |>
  arrange(desc(dep_delay), dep_time)
# sorts the flights with the longest departure delays that leave earliest in the morning

print("I had trouble with some of the conditional statements on the first question, as well as finding out how to group multiple categories within a column")

