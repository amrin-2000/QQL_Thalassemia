# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")

# uni-variate analysis
uv_lin_model = lm(data$Total_SF_Score ~ data$Gender)

# summary
summary(uv_lin_model)

# interpretation
report(uv_lin_model)

# Factors associated with quality of life score in the uni-variate linear regression
data |> 
  select(1:8, Total_SF_Score) |> 
  tbl_uvregression(
    method = lm,
    y = Total_SF_Score
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |>
  gtsave("tables/Table_6_UV_LinReg.docx")

# add ref manually  
data |> 
  select(1:8, Total_SF_Score) |> 
  tbl_uvregression(
    method = lm,
    y = Total_SF_Score,
    add_estimate_to_reference_rows = TRUE
  ) |> 
  bold_p(t = 0.05)

# Factors associated with quality of life score in the uni-variate logistic regression
data |> 
  select(1:8, QOL_Status_Binary_Code) |> 
  tbl_uvregression(
    method = glm,
    y = QOL_Status_Binary_Code,
    method.args = list(family = binomial),
    exponentiate = T
  ) |> 
  bold_p(t = 0.05) |>
  as_gt() |> 
  gtsave("tables/Table_7_UV_LogReg.docx")
