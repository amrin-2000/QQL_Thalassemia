# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")
names(data)
mv_lin_reg = lm(Total_SF_Score ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family + Level_of_Education + Occupational_Status + Area_of_Residence + Economic_Class, data = data)                     
summary(mv_lin_reg)
report(mv_lin_reg)

# tbl_regression
mv_lin_reg |> 
  tbl_regression() |> 
  bold_p(t = 0.05) |>
  as_gt() |>
  gtsave("tables/Table_8_MV_LinReg.docx")

# multiple logistic regression
mv_log_reg = glm(QOL_Status_Binary_Code ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family + Level_of_Education + Occupational_Status + Area_of_Residence + Economic_Class,
                 data = data,
                 family = binomial(link = "logit"))                     
summary(mv_log_reg)
report(mv_log_reg)

# tbl_regression
mv_log_reg |> 
  tbl_regression(exponentiate = T) |> 
  bold_p(t = 0.05) |>
  as_gt() |>
  gtsave("tables/Table_9_MV_LogReg.docx")
