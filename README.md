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

## Without Docker

Generate descriptive statistics by running "make Output/Table1.rds" in terminal

Run regression and create the regression table and graph by running "make Output/Table_reg.rds Output/Reg_plot.png" in terminal

Compile report by running "make" in terminal

## With Docker

To build image, run "make project_image" in terminal

To run container, run "make Report/Report.html" in terminal

# Docker image

https://hub.docker.com/repository/docker/annienicholas/project_image/general
