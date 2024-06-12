# load packages
library(tidyverse)
library(naniar)

# import data
data = read.csv("data/QOL_Thalassemia.csv")

# check missing value
miss_var_summary(data)
gg_miss_var(data)

# quality of life status (binary outcome)
data = data |>
  mutate(QOL_Status_Binary = case_when(
    Total_SF_Score < 50 ~ "Poor",
    Total_SF_Score > 50 ~ "Good"
  ))

data = data |>
  mutate(QOL_Status_Binary_Code = case_when(
    Total_SF_Score < 50 ~ 0,
    Total_SF_Score > 50 ~ 1
  ))

# quality of life status (Ordinal outcome)
data = data |>
  mutate(QOL_Status_Ordinal = case_when(
    Total_SF_Score < 40 ~ "Poor",
    Total_SF_Score >=40 & Total_SF_Score <=60 ~ "Moderate",
    Total_SF_Score > 60 ~ "Good"
  ))


# quality of life status (Ordinal code)
data = data |>
  mutate(QOL_Status_Ordinal = case_when(
    Total_SF_Score < 40 ~ 1, #"Poor"
    Total_SF_Score >=40 & Total_SF_Score <=60 ~ 2, #"Moderate"
    Total_SF_Score > 60 ~ 3 #"Good"
  ))

View(data)

# export data
write.csv(data, "data/QOL_Thalassemia_Preprocessed.csv", row.names = FALSE)
