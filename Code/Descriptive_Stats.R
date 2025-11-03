library(here)
library(dplyr)
library(gtsummary)

#start with here::i_am
here::i_am("Code/Descriptive_Stats.R")

#read in data
data <- data <- read.csv(file = here::here("HepatitisCdata.csv"))

#clean data
data <- data %>%
  mutate(hep = case_when(
    Category == "0=Blood Donor" | Category == "0s=suspect Blood Donor" ~ "Donor",
    TRUE ~ "Hep C Patient"
  ))

data <- data %>%
  mutate("Hepatitis Status" = case_when(
    Category == "0=Blood Donor" | Category == "0s=suspect Blood Donor" ~ "Blood Donor",
    Category == "1=Hepatitis" ~ "Hepatitis",
    Category == "2=Fibrosis" ~ "Fibrosis",
    Category == "3=Cirrhosis" ~ "Cirrhosis"
  ))

data <- data %>%
  mutate(Sex = case_when(
    Sex == "f" ~ "Female",
    TRUE ~ "Male"
  ))

#create table 1
table1 <- tbl_summary(data,
  include = c(Age, Sex, "Hepatitis Status")
)

#save table 1
saveRDS(table1, file = here::here("Output/Table1.rds"))

