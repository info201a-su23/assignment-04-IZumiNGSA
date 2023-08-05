library(ggplot2)
library(dplyr)
library(readr)
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

aggregate_latinx_avg <- aggregate(latinx_jail_pop_rate ~ year, data = washington, FUN = mean)
aggregate_aapi_avg <- aggregate(aapi_jail_pop_rate ~ year, data = washington, FUN = mean)
aggregate_native_avg <- aggregate(native_jail_pop_rate ~ year, data = washington, FUN = mean)
avg_jail_pop <- aggregate_latinx_avg %>%
  full_join(aggregate_aapi_avg, by = "year") %>%
  full_join(aggregate_native_avg, by = "year")

ggplot(avg_jail_pop, aes(x = year)) +
  geom_line(aes(y = latinx_jail_pop_rate, color = "Latinx Population"), linewidth = 1.2) +
  geom_line(aes(y = aapi_jail_pop_rate, color = "AAPI Population"), linewidth = 1.2) +
  geom_line(aes(y = native_jail_pop_rate, color = "Native Population"), linewidth = 1.2) +
  theme_minimal() +
  labs(title = "Average Latinx, AAPI, and Native Jail Population from 1990-2018",
       y = "Jail Population",
       x = "Year") +
  scale_color_manual(values = c("Latinx Population" = "blue", "AAPI Population" = "red", "Native Population" = "green"),
                     guide = guide_legend(title = "Race"))
