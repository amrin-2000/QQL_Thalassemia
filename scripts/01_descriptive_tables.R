# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")
View(data)

# demographic characteristics of study participants
data |> 
  select(1:8) |> 
  tbl_summary(statistic = list(
    all_continuous() ~ "{mean} ({sd})"
  )) |> 
  as_gt() |> 
  gtsave("tables/Table_1_Demographics.docx")

# clinical characteristics of thalassemia patients
data |> 
  select(9:17) |> 
  tbl_summary(type = all_categorical() ~ "categorical",
              statistic = all_continuous() ~ "{mean} ({sd})") |> 
  as_gt() |> 
  gtsave("tables/Table_2_Clinical_Chars.docx")
