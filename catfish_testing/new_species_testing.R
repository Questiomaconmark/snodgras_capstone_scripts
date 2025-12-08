#Loaded libraries
library(arrow)
library(dplyr)

#combined dataset
#artis_ds <- open_dataset("C:\\Users\\Bailey New PC\\Capstone\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\")

#split dataset locations

artis_ds_consumption <- open_dataset( "C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_consumption_v1.1.0_FAO_mid_2025-08-02.parquet")

artis_ds_trade <- open_dataset("C:\\Users\\John\\bailey_stuff\\ARITS_1.1.0_FAO_2025_08_02\\ARITS_1.1.0_FAO_2025_08_02\\datasets\\ARTIS_trade_v1.1.0_FAO_mid_2025-08-02.parquet")

#reading the dataset
#glimpse(artis_ds_trade)
#names(artis_ds_trade)

#package
#install.packages("arrow")

#glimpse(artis_ds)
#names(artis_ds)

#lionfish object
test_fish <- "ictalurus furcatus"

#filter for lionfish
artis_ds_testfish_filter <- artis_ds_consumption %>%
  filter(sciname == test_fish)

artis_ds_csv <- artis_ds_testfish_filter %>%
  collect()

#writing the lionfish consumption csv
write.csv(artis_ds_csv, "C:/Users/John/bailey_stuff/snodgras_capstone_scripts/catfish_testing/Blue_Catfish_Consumption.csv")


#filter for lionfish
artis_ds_testfish_filter <- artis_ds_trade %>%
  filter(sciname == test_fish)
# 
artis_ds_csv <- artis_ds_testfish_filter %>%
  collect()

#writing the lionfish trade csv
write.csv(artis_ds_csv, "C:/Users/John/bailey_stuff/snodgras_capstone_scripts/catfish_testing/Blue_Catfish_Trade.csv")
