library(dplyr)
library(readr)

washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

avg_jail_2018_native <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(native_jail_pop_rate)) %>%
  pull(mean)

avg_jail_2018_aapi <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(aapi_jail_pop_rate)) %>%
  pull(mean)

avg_jail_2018_latinx <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(latinx_jail_pop_rate)) %>%
  pull(mean)

max_jail_rate_native <- washington %>%
  filter(year == 2018) %>%
  filter(native_jail_pop_rate == max(native_jail_pop_rate, na.rm = TRUE)) %>%
  pull(native_jail_pop_rate)

max_jail_rate_aapi <- washington %>%
  filter(year == 2018) %>%
  filter(aapi_jail_pop_rate == max(aapi_jail_pop_rate, na.rm = TRUE)) %>%
  pull(aapi_jail_pop_rate)

max_jail_rate_latinx <- washington %>%
  filter(year == 2018) %>%
  filter(latinx_jail_pop_rate == max(latinx_jail_pop_rate, na.rm = TRUE)) %>%
  pull(latinx_jail_pop_rate)

observations <- nrow(washington)

features <- ncol(washington)
