library(arrow)
library(tidyverse)

# pulling dataset from parquet
artis_ds_consumption <- open_dataset("~/bailey_stuff/ARITS_1.1.0_FAO_2025_08_02/ARITS_1.1.0_FAO_2025_08_02/datasets/ARTIS_consumption_v1.1.0_FAO_mid_2025-08-02.parquet")
artis_ds_trade <- open_dataset("bailey_stuff/ARITS_1.1.0_FAO_2025_08_02/ARITS_1.1.0_FAO_2025_08_02/datasets/ARTIS_trade_v1.1.0_FAO_mid_2025-08-02.parquet")
