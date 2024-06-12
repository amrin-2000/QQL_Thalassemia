# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")

# association
data |> 
  select(QOL_Status_Binary, 2:8) |>
  tbl_summary(by = QOL_Status_Binary) |>
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table_5_Association.docx")
