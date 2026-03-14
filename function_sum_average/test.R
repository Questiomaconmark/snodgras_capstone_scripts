library(dplyr)

make_graph_sums <- function(csv_path){
    fish_data <- read.csv(csv_path)

    fish_data_filtered <- fish_data %>%
        filter(source_country_iso3c == 'USA') %>%
        filter(method == 'capture')

    fish_data_filtered_by_year <- fish_data_filtered %>% 
        group_by(year) %>%
        summarise(sum_consumption_live_t = sum(consumption_live_t, na.rm = TRUE))

    return(fish_data_filtered_by_year)
}

make_graph_sums_per_fish <- function(fish){
    csv_path <- paste0("C:/Users/Bailey New PC/Capstone/Capstone_Project/Csv_Data/", fish, "_Consumption.csv")
    return(make_graph_sums(csv_path))
}

make_graph_sums_for_collection <- function(fish_vector){
    results_list <- lapply(fish_vector, function(fish){
        df <- make_graph_sums_per_fish(fish)
        df$fish <- fish
        return(df)
    })
    
    combined_df <- bind_rows(results_list)
    return(combined_df)
}

