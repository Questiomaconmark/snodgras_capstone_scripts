library(tidyverse)
library(exploreARTIS)
library(ggbreak)

current_fish <- "Bighead_Carp"

fish_data <- read.csv("C:\\Users\\John\\bailey_stuff\\snodgras_capstone_scripts\\native_testing\\csv\\Bighead_Carp_Consumption.csv")

native_iso <- c("CHN","RUS", "KOR")

not_present_iso <- c("ISR", "DEU")

fish_data <- fish_data %>% mutate(Nativity = case_when(
  consumer_iso3c %in% native_iso ~ "native",
  consumer_iso3c %in% not_present_iso ~ "not present",
  TRUE ~ "invasive"))

write.csv(fish_data, "C:\\Users\\John\\bailey_stuff\\snodgras_capstone_scripts\\native_testing\\csv\\Bighead_Carp_Consumption_Extra.csv")

fish_data_filtered <- fish_data %>%
  filter(source_country_iso3c == "USA",
         method == "capture",
         consumer_iso3c != "USA")

fish_graph <- plot_ts(fish_data_filtered, artis_var = "Nativity", value = "consumption_live_t", prop_flow_cutoff = .01, plot.type = "stacked")

print(fish_graph)
