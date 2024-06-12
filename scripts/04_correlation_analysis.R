# load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

# import data
data = read.csv("data/QOL_Thalassemia_Preprocessed.csv")

# correlation
cor(data$Age_of_Participants, data$Total_SF_Score)
cor.test(data$Age_of_Participants, data$Total_SF_Score)

# correlation matrix
cor_data = data |> select(18:28)
View(cor_data)

correlation(cor_data)

corr_result = correlation(cor_data)

# plot
corr_result |> 
  summary(redundant = T) |> 
  plot()
  ggsave("figures/corr_plot.tiff", units = "in", height = 6, width = 18, dpi = 600, compression = "lzw")


