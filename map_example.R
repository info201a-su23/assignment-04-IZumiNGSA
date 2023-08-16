library(ggplot2)
library(mapdata)
library(purrr)
library(dplyr)
library(maps)
library(stringr)

washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

washington <- washington %>%
  filter(year == 2010)

counties <- map_data("county", region = "washington")

counties <- counties %>%
  mutate(subregion = str_to_title(subregion) %>% paste0(" County"))

merged_data <- left_join(counties, washington, by = c("subregion" = "county_name"))

ggplot(data = merged_data, aes(x = long, y = lat, group = group, fill = native_jail_pop_rate)) +
  geom_polygon() +
  coord_fixed(1.25, ylim = c(min(counties$lat), max(counties$lat))) +
  labs(title = paste("Native Jail Rate per 100,000 Across Washington Counties (", max(washington$year), ")", sep = ""),
       fill = "Native Jail Rate") +
  scale_fill_gradient(name = "Native Jail Rate", 
                      low = "yellow", high = "red",
                      breaks = seq(min(merged_data$native_jail_pop_rate, na.rm = TRUE), max(merged_data$native_jail_pop_rate, na.rm = TRUE), length.out = 5)) +
  theme_minimal() +
  theme(plot.title = element_text(),
        axis.text = element_blank(),
        axis.title = element_blank())
