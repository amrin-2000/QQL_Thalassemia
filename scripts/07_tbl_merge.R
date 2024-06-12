# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")

# univariate linear regression
uv_tbl = data |> 
  select(1:8, Total_SF_Score) |> 
  tbl_uvregression(
    method = lm,
    y = Total_SF_Score
  )
  

# multivariate linear regression
mv_lin_reg = lm(Total_SF_Score ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family + Level_of_Education + Occupational_Status + Area_of_Residence + Economic_Class, data = data)                     
summary(mv_lin_reg)
report(mv_lin_reg)

# tbl_regression
mv_tbl = mv_lin_reg |> 
  tbl_regression()

# merge table
tbl_merge(tbls = list(uv_tbl, mv_tbl),
          tab_spanner = c("**Univariate**", "**Multivariate**")
          ) |> 
  as_gt() |> 
  gtsave("tables/Table_Merge.docx")








