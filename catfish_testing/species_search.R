library(arrow)
library(dplyr)

artis_ds_consumption <- open_dataset( "C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_consumption_v1.1.0_FAO_mid_2025-08-02.parquet")

artis_ds_trade <- open_dataset("C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_trade_v1.1.0_FAO_mid_2025-08-02.parquet")

species = "pterygoplichthys disjunctivus"

exists_consumption <- artis_ds_consumption %>%
  filter(.data$sciname == species) %>%
  summarize(n = n()) %>%
  collect() %>%
  {.$n > 0}

exists_trade <- artis_ds_trade %>%
  filter(.data$sciname == species) %>%
  summarize(n = n()) %>%
  collect() %>%
  {.$n > 0}

print(exists_consumption || exists_trade)