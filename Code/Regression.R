library(here)
library(gtsummary)
library(ggplot2)
library(dplyr)

here::i_am("Code/Regression.R")

#read in data
data <- read.csv(file = here::here("HepatitisCdata.csv"))

#create binary variable for hepatitis status
data <- data %>%
  mutate(hep_bin = case_when(
    Category == "0=Blood Donor" | Category == "0s=suspect Blood Donor" ~ 0,
    TRUE ~ 1
  ))

#run regression and create table
table_reg <- tbl_uvregression(
  data,
  y = hep_bin,
  include = c(ALB, ALP, ALT, AST, BIL, CHE, CHOL, CREA, GGT, PROT),
  method = glm,
  method.args = list(family = binomial()),
  exponentiate = TRUE
)

#save regression table
saveRDS(table_reg, "Output/Table_reg.rds")

#make graph
reg_plot <- ggplot(data, aes(x = BIL, y = hep_bin)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = TRUE) +
  labs(y = "Probability of Being Hep C Positive", x = "Bilirubin (mg/dL)", title = "Logistic Regression Fit") +
  theme_minimal()

#save graph
saveRDS(reg_plot, "Output/Reg_plot.png")
