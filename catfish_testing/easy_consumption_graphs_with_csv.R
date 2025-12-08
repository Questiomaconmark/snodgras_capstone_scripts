library(tidyverse)
library(exploreARTIS)

current_fish <- "Grass_Carp"
fish_data <- read.csv(paste0("c:/Users/John/bailey_stuff/snodgras_capstone_scripts/catfish_testing/csv_folder/", current_fish , "_Consumption.csv"))

fish_data_filtered <- fish_data %>%
  filter(source_country_iso3c == 'USA') %>%
  filter(method == 'capture')

fish_graph <- plot_ts(fish_data_filtered, artis_var = "consumer_iso3c", value = "consumption_live_t", prop_flow_cutoff = .01, plot.type = "stacked")

print(fish_graph)