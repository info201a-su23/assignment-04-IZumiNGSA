library(ggplot2)
library(readr)

washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

washington <- na.omit(washington)
ggplot(washington, aes(x = native_jail_pop_rate, y = native_prison_pop_rate)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Relationship Between Native Jail and Prison Population Rates from 1990-2018",
       y = "Native Prison Population Rate",
       x = "Native Jail Population Rate") +
  xlim(0,10000)
