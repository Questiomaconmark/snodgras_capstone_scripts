library(arrow)
library(dplyr)

artis_ds_consumption <- open_dataset( "C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_consumption_v1.1.0_FAO_mid_2025-08-02.parquet")

artis_ds_trade <- open_dataset("C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_trade_v1.1.0_FAO_mid_2025-08-02.parquet")

make_csv_by_species <- function(scientific_name, filename) {
  artis_ds_testfish_filter <- artis_ds_consumption %>%
    filter(.data$sciname == scientific_name)
  
  artis_ds_csv <- artis_ds_testfish_filter %>%
    collect()
  
  if (nrow(artis_ds_csv) > 0){
    write.csv(artis_ds_csv, paste0("C:/Users/John/bailey_stuff/snodgras_capstone_scripts/catfish_testing/csv_folder/", filename, "_Consumption.csv"))
  } else {
    message("No consumption data for: ", scientific_name)
  }
  
  artis_ds_testfish_filter <- artis_ds_trade %>%
    filter(.data$sciname == scientific_name)
  
  artis_ds_csv <- artis_ds_testfish_filter %>%
    collect()
  
  if (nrow(artis_ds_csv) > 0){
    write.csv(artis_ds_csv, paste0("C:/Users/John/bailey_stuff/snodgras_capstone_scripts/catfish_testing/csv_folder/", filename, "_Trade.csv"))
  } else {
    message("No trade data for : ", scientific_name)
  }
}

species_list <- list(
  # "sciname" = "common name (also file name)"
  "pterygoplichthys disjunctivus" = "Armored_Catfish"
)

for (sci in names(species_list)) {
  common <- species_list[[sci]]
  make_csv_by_species(sci, common)
}