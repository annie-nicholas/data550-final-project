---
title: DATA550 Final Project
author: Annie Nicholas
output: github_document
---

# Introduction

This project utilizes Hepatitis C prediction data from Kaggle, which includes blood work values from both blood donors and Hepatitis C patients as well as demographic information.

Data source: <https://www.kaggle.com/datasets/fedesoriano/hepatitis-c-dataset>

# Code Description

Code/Descriptive_Stats.R: Data cleaning and generates table 1 with descriptive statistics

Code/Regression.R: Runs regression model and creates table with regression output and graph

Code/Make_Report.R: Renders report

# How to synchronize package repository

Run "make install" in terminal

# How to run code and generate report

Within the Makefile:

1.  Generate descriptive statistics by running "make Output/Table1.rds" in terminal
2.  Run regression and create the regression table and graph by running "make Output/Table_reg.rds Output/Reg_plot.png" in terminal
3.  Compile report by running "make Report.html" in terminal
