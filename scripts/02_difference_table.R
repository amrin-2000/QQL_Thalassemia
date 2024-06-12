# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")
View(data)

# difference
data |> 
  select(18:25) |> 
  tbl_summary(type = everything() ~ "continuous")

# i want to see by gender
# difference (2 groups)
# normal ~ parametric tests (t- test)
# non-normal ~ Nonparametric tests (Wilcoxon rank sum test)

data |> 
  select(Gender, 18:25) |> 
  tbl_summary(type = everything() ~ "continuous",
              by = Gender) |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table_3_Difference_2G.docx")

# difference (more than 2 groups)
# normal ~ parametric tests (ANOVA)
# non-normal ~ Nonparametric tests (Kruskal-Wallis rank sum test)

data |> 
  select(Type_of_Family, 18:25) |> 
  tbl_summary(type = everything() ~ "continuous",
              by = Type_of_Family) |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table_4_Difference_3G.docx")
