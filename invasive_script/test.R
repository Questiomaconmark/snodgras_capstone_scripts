library(tidyverse)
library(exploreARTIS)

table_path <- "C:\\Users\\John\\bailey_stuff\\snodgras_capstone_scripts\\invasive_script\\csv\\Table.csv"
table_csv <- read.csv(table_path)

species_csv_path <- "C:\\Users\\John\\bailey_stuff\\snodgras_capstone_scripts\\invasive_script\\csv\\Fishbase_Invasives_Clean.csv"
species_csv <- read.csv(species_csv_path)

species_list <- setNames(as.list(tolower(species_csv$`Common.names`)), tolower(species_csv$`Species`))