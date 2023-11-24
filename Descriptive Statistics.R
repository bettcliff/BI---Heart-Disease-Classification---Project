# *****************************************************************************
# Lab 1: Loading Datasets ----
#
# Course Code: BBT4206
# Course Name: Business Intelligence II
# Semester Duration: 21st August 2023 to 28th November 2023
#
# Lecturer: Allan Omondi
# Contact: aomondi [at] strathmore.edu
#
# Note: The lecture contains both theory and practice. This file forms part of
#       the practice. It has required lab work submissions that are graded for
#       coursework marks.
#
# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# 1. Sources of Datasets ----
# There are several repositories where you can find datasets (mostly free) for
# learning and/or to use as part of a project. These include:

# 1.	Data in Brief Journal: https://www.sciencedirect.com/journal/data-in-brief
# 2.	University of California (UC) Irvine: https://archive.ics.uci.edu/datasets
# 3.	Kaggle: https://www.kaggle.com/datasets
# 4.	Data Science Dojo:
#       https://datasciencedojo.com/blog/datasets-data-science-skills/ or
#       https://code.datasciencedojo.com/datasciencedojo/datasets
# 5.	Kenya Open Data: https://kenya.opendataforafrica.org/data/#menu=topic
# 6.	openAFRICA: https://africaopendata.org/
# 7.	Datahub.io: https://datahub.io/collections
# 8.	Data.world: https://data.world/
# 9.	Google Data Search: https://datasetsearch.research.google.com/
# 10.	Google Public Data Explorer: https://www.google.com/publicdata/directory
# 11.	Data.gov: https://www.data.gov/
# 12.	Global Health Observatory Data Repository:
#       https://apps.who.int/gho/data/node.home
# 13.	UNICEF Data: https://data.unicef.org/
# 14.	Earth Data: https://earthdata.nasa.gov/
# 15.	CERN Open Data Portal: http://opendata.cern.ch/
# 16.	FBI Crime Data Portal: https://crime-data-explorer.fr.cloud.gov/
# 17.	New York City Taxi Trip Data:
#       https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page
# 18.	Our World in Data: https://ourworldindata.org/
# 19.	World Bank Open Data: https://data.worldbank.org/
# 20.	World Poverty: https://worldpoverty.io/map
# 21.	Worldometers: https://www.worldometers.info/
# 22.	European Data: https://data.europa.eu/en
# 23.	Livestock Data for Decisions (LD4D):
#       https://www.livestockdata.org/type/datasets
# etc.


# 2. Classification Datasets -----
## 2.1 DATASET 1: Dow Jones Index Data Set ----

### Description ----
# In predicting stock prices you collect data over some period of time - day,
# week, month, etc. But you cannot take advantage of data from a time period
# until the next increment of the time period. For example, assume you collect
# data daily.  When Monday is over you have all of the data for that day.
# However you can invest on Monday, because you don't get the data until the
# end of the day.  You can use the data from Monday to invest on Tuesday.

# In our research each record (row) is data for a week.  Each record also has
# the percentage of return that stock has in the following week
# (percent_change_next_weeks_price). Ideally, you want to determine which stock
# will produce the greatest rate of return in the following week.  This can help
# you train and test your algorithm.

# Some of these attributes might not be use used in your research.  They were
# originally added to our database to perform calculations.  (Brown, Pelosi &
# Dirska, 2013) used percent_change_price, percent_change_volume_over_last_wk,
# days_to_next_dividend, and percent_return_next_dividend.  We left the other
# attributes in the dataset	in case you wanted to use any of them. Of course
# what you want to maximize is percent_change_next_weeks_price.

# Training data vs Test data:
# In (Brown, Pelosi & Dirska, 2013) we used quarter 1 (Jan-Mar) data for
# training and quarter 2 (Apr-Jun) data for testing.
#
# Interesting data points:
# If you use quarter 2 data for testing, you will notice something interesting
# in the week ending 5/27/2011 every Dow Jones Index stock lost money.
#
# Attribute Information
# quarter:  the yearly quarter (1 = Jan-Mar; 2 = Apr-Jun).
# stock: the stock symbol (see above)
# date: the last business day of the work (this is typically a Friday)
# open: the price of the stock at the beginning of the week
# high: the highest price of the stock during the week
# low: the lowest price of the stock during the week
# close: the price of the stock at the end of the week
# volume: the number of shares of stock that traded hands in the week
# percent_change_price: the percentage change in price throughout the week
# percent_change_volume_over_last_wek: the percentage change in the number of
#   shares of stock that traded hands for this week compared to the previous
#   week
# previous_weeks_volume: the number of shares of stock that traded hands in the
#   previous week
# next_weeks_open: the opening price of the stock in the following week
# next_weeks_close: the closing price of the stock in the following week
# percent_change_next_weeks_price: the percentage change in price of the stock
# in the following week
# days_to_next_dividend: the number of days until the next dividend
# percent_return_next_dividend: the percentage of return on the next dividend

### Sources ----
##### [Primary] Source 1: UCI ----
# https://archive.ics.uci.edu/ml/datasets/Dow+Jones+Index
##### [Secondary] Source 2: Data Science Dojo ----
# https://code.datasciencedojo.com/datasciencedojo/datasets/tree/master/Dow%20Jones%20Index # nolint: line_length_linter.
##### [Secondary] Source 3: Kaggle ----
# https://www.kaggle.com/datasets/mnassrib/dow-jones-industrial-average

# Transform the data as follows:
# Transform the Data using an Excel Spreadsheet
# Microsoft Excel also offers data transformation features. Navigate to the
# following menu in a Microsoft Excel Spreadsheet:
#   Data > Get Data > From File > From Text/CSV

# Import the “dow_jones_index.data” file and select “Transform Data”.

# Select the following columns: “open”, “high”, “low”, “close”,
# “next_weeks_open”, and “next_weeks_close”.

# Remove the dollar sign by selecting “Replace Values” and enter “$” in the
# “Value To Find” text field and leave the “Replace With” text field empty.

# The presence of the dollar sign can make a tool like R assume that the
# variable stores a text field, yet it is supposed to store an integer.

# There is no other transformation that needs to be done.

# Select "Close & Load" and save the file (the first work sheet) as a .CSV file
# in the following location: "data/transforms/dow_jones_index.csv"

### Code ----
library(readr)
heart_disease <- read_csv("data/heart-disease.csv")
View(heart_disease)

## 2.2 DATASET 2: Default of Credit Card Clients ----
### Description ----
# This research aimed at the case of customers default payments in Taiwan and
# compares the predictive accuracy of probability of default among six data
# mining methods. From the perspective of risk management, the result of
# predictive accuracy of the estimated probability of default will be more
# valuable than the binary result of classification - credible or not credible
# clients. Because the real probability of default is unknown, this study
# presented the novel Sorting Smoothing Methods to estimate the real probability
# of default. With the real probability of default as the response variable (Y),
# and the predictive probability of default as the independent variable (X),
# the simple linear regression result (Y = A + BX) shows that the forecasting
# model produced by artificial neural network has the highest coefficient of
# determination; its regression intercept (A) is close to zero, and regression
# coefficient (B) to one. Therefore, among the six data mining techniques,
# artificial neural network is the only one that can accurately estimate the
# real probability of default.

# Attribute Information
# This research employed a binary variable, default payment (Yes = 1, No = 0),
# as the response variable. This study reviewed the literature and used the
# following 23 variables as explanatory variables:
# X1: Amount of the given credit (NT dollar): it includes both the individual
#     consumer credit and his/her family (supplementary) credit.
# X2: sex (1 = male; 2 = female).
# X3: Education (1 = graduate school; 2 = university; 3 = high school;
#   4 = others).
# X4: Marital status (1 = married; 2 = single; 3 = others).
# X5: Age (year).
# X6 - X11: History of past payment. We tracked the past monthly payment
#   records (from April to September, 2005) as follows: X6 = the repayment
#   status in September, 2005; X7 = the repayment status in August, 2005; . . .;
#   X11 = the repayment status in April, 2005. The measurement scale for the
#   repayment status is: -1 = pay duly; 1 = payment delay for one month;
#   2 = payment delay for two months; . . .; 8 = payment delay for eight
#   months; 9 = payment delay for nine months and above.
# X12-X17: Amount of bill statement (NT dollar). X12 = amount of bill statement
#   in September, 2005; X13 = amount of bill statement in August, 2005; . . .;
#   X17 = amount of bill statement in April, 2005.
# X18-X23: Amount of previous payment (NT dollar). X18 = amount paid in
#   September, 2005; X19 = amount paid in August, 2005; . . .;X23 = amount paid
#   in April, 2005.

# Convert the XLS file into a CSV file

### Sources ----
#### [Primary] Source 1:  UCI ----
# https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients
#### [Secondary] Source 2: Data Science Dojo ----
# https://code.datasciencedojo.com/datasciencedojo/datasets/tree/master/Default%20of%20Credit%20Card%20Clients ---- # nolint: line_length_linter.
### Code ====
# 3 Regression Datasets ----
## 3.1 DATASET 3: Daily Demand Forecasting Orders Data Set ----
### Objective ----
#' The dataset was collected during 60 days, this is a real database of a
#' Brazilian logistics company. The dataset has twelve predictive attributes
#' and a target that is the total of orders for daily treatment. The database
#' was used in academic research at the Universidade Nove de Julho.
#'
#' Attributes:
#'   .arff header for Weka:
#' @relation Daily_Demand_Forecasting_Orders
#' @attribute Week_of_the_month {1.0, 2.0, 3.0, 4.0, 5.0}
#' @attribute Day_of_the_week_(Monday_to_Friday) {2.0, 3.0, 4.0, 5.0, 6.0}
#' @attribute Non_urgent_order integer
#' @attribute Urgent_order integer
#' @attribute Order_type_A integer
#' @attribute Order_type_B integer
#' @attribute Order_type_C integer
#' @attribute Fiscal_sector_orders integer
#' @attribute Orders_from_the_traffic_controller_sector integer
#' @attribute Banking_orders_(1) integer
#' @attribute Banking_orders_(2) integer
#' @attribute Banking_orders_(3) integer
#' @attribute Target_(Total_orders) integer
#' @data

### Sources ----
#### [Primary] Source 1: UCI ----
# https://archive.ics.uci.edu/ml/datasets/Daily+Demand+Forecasting+Orders
#### [Secondary] Source 2: Data Science Dojo ----
# https://code.datasciencedojo.com/datasciencedojo/datasets/tree/master/Daily%20Demand%20Forecasting%20Orders # nolint: line_length_linter.
### Code ----


## 3.2 DATASET 4: Iranian Churn Dataset ----
### Objective ----
# This dataset is randomly collected from an Iranian telecom company database
# over a period of 12 months. A total of 3150 rows of data, each representing a
# customer, bear information for 13 columns. The attributes that are in this
# dataset are call failures, frequency of SMS, number of complaints, number of
# distinct calls, subscription length, age group, the charge amount, type of
# service, seconds of use, status, frequency of use, and Customer Value.

# All of the attributes except for attribute churn is the aggregated data of
# the first 9 months. The churn labels are the state of the customers at the end
# of 12 months. The three months is the designated planning gap.

# Attribute Information:
# Anonymous Customer ID
# Call Failures: number of call failures
# Complains: binary (0: No complaint, 1: complaint)
# Subscription Length: total months of subscription
# Charge Amount: Ordinal attribute (0: lowest amount, 9: highest amount)
# Seconds of Use: total seconds of calls
# Frequency of use: total number of calls
# Frequency of SMS: total number of text messages
# Distinct Called Numbers: total number of distinct phone calls
# Age Group: ordinal attribute (1: younger age, 5: older age)
# Tariff Plan: binary (1: Pay as you go, 2: contractual)
# Status: binary (1: active, 2: non-active)
# Churn: binary (1: churn, 0: non-churn) - Class label
# Customer Value: The calculated value of customer

### Note: Skip the last 7 rows ----

### [Primary] Source 1: UCI ----
# https://archive.ics.uci.edu/dataset/563/iranian+churn+dataset
### Code ----
# *****************************************************************************
# Lab 2: Exploratory Data Analysis ----
#
# Course Code: BBT4206
# Course Name: Business Intelligence II
# Semester Duration: 21st August 2023 to 28th November 2023
#
# Lecturer: Allan Omondi
# Contact: aomondi [at] strathmore.edu
#
# Note: The lecture contains both theory and practice. This file forms part of
#       the practice. It has required lab work submissions that are graded for
#       coursework marks.
#
# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# STEP 1. Install and use renv ----
# **Initialization: Install and use renv ----
# The renv package helps you create reproducible environments for your R
# projects. This is helpful when working in teams because it makes your R
# projects more isolated, portable and reproducible.

# Further reading:
#   Summary: https://rstudio.github.io/renv/
#   More detailed article: https://rstudio.github.io/renv/articles/renv.html

# Install renv:
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")

# Use renv::init() to initialize renv in a new or existing project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
renv::init()

# This will set up a project library, containing all the packages you are
# currently using. The packages (and all the metadata needed to reinstall
# them) are recorded into a lockfile, renv.lock, and a .Rprofile ensures that
# the library is used every time you open that project.

# This can also be configured using the RStudio GUI when you click the project
# file, e.g., "BBT4206-R.Rproj" in the case of this project. Then
# navigate to the "Environments" tab and select "Use renv with this project".

# As you continue to work on your project, you can install and upgrade
# packages, using either:
# install.packages() and update.packages or
# renv::install() and renv::update()

# You can also clean up a project by removing unused packages using the
# following command: renv::clean()

# After you have confirmed that your code works as expected, use
# renv::snapshot() to record the packages and their
# sources in the lockfile.

# Later, if you need to share your code with someone else or run your code on
# a new machine, your collaborator (or you) can call renv::restore() to
# reinstall the specific package versions recorded in the lockfile.

# Execute the following code to reinstall the specific package versions
# recorded in the lockfile:
renv::restore()

# One of the packages required to use R in VS Code is the "languageserver"
# package. It can be installed manually as follows if you are not using the
# renv::restore() command.
if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

# Loading Datasets ----
## STEP 2: Download sample datasets ----
# Create a folder called "data" and store the following 2 files inside the
# "data" folder:
## Link 1 (save the file as "iris.data"):
# https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
## Link 2 ("crop.data.csv"):
# https://cdn.scribbr.com/wp-content/uploads/2020/03/crop.data_.anova_.zip
# Extract the "crop.data.csv" file into the data folder

## STEP 3. Load the downloaded sample datasets ----
# Load the datasets


if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}






# Dimensions ----
## STEP 5. Preview the Loaded Datasets ----
# Dimensions refer to the number of observations (rows) and the number of
# attributes/variables/features (columns). Execute the following commands to
# display the dimensions of your datasets:


dim(heart_disease)

# Data Types ----
## STEP 6. Identify the Data Types ----
# Knowing the data types will help you to identify the most appropriate
# visualization types and algorithms that can be applied. It can also help you
# to identify the need to convert from categorical data (factors) to integers
# or vice versa where necessary. Execute the following command to identify the
# data types:

sapply(heart_disease, class)


# Descriptive Statistics ----

# You must first understand your data before you can use it to design
# prediction models and to make generalizable inferences. It is not until you
# take the time to truly understand your dataset that you can fully comprehend
# the context of the results you achieve. This understanding can be done using
# descriptive statistics such as:

# 1. Measures of frequency
# (e.g., count, percent)

# 2. Measures of central tendency
# (e.g., mean, median, mode)
# Further reading: https://www.scribbr.com/statistics/central-tendency/

# 3. Measures of distribution/dispersion/spread/scatter/variability
# (e.g., range, quartiles, interquartile range, standard deviation, variance,
# kurtosis, skewness)
# Further reading: https://www.scribbr.com/statistics/variability/
# Further reading:
#   https://digitaschools.com/descriptive-statistics-skewness-and-kurtosis/
# Further reading: https://www.scribbr.com/statistics/skewness/

# 4. Measures of relationship
# (e.g., covariance, correlation, ANOVA)

# Further reading: https://www.k2analytics.co.in/covariance-and-correlation/
# Further reading: https://www.scribbr.com/statistics/one-way-anova/
# Further reading: https://www.scribbr.com/statistics/two-way-anova/

# Understanding your data can lead to:
# (i)	  Data cleaning: Removing bad data or imputing missing data.
# (ii)	Data transformation: Reduce the skewness by applying the same function
#       to all the observations.
# (iii)	Data modelling: You may notice properties of the data such as
#       distributions or data types that suggest the use (or not) of
#       specific algorithms.

## Measures of Frequency ----

### STEP 7. Identify the number of instances that belong to each class. ----
# It is more sensible to count categorical variables (factors or dimensions)
# than numeric variables, e.g., counting the number of male and female
# participants instead of counting the frequency of each participant’s height.


heart_disease_target_freq <- heart_disease$target
cbind(frequency = table(heart_disease_target_freq),
      percentage = prop.table(table(heart_disease_target_freq)) * 100)

heart_disease_oldpeak_freq <- heart_disease$oldpeak
cbind(frequency = table(heart_disease_oldpeak_freq),
      percentage = prop.table(table(heart_disease_oldpeak_freq)) * 100)



## Measures of Central Tendency ----
### STEP 8. Calculate the mode ----
# Unfortunately, R does not have an in-built function for calculating the mode.
# We, therefore, must manually create a function that can calculate the mode.

## Measures of Distribution/Dispersion/Spread/Scatter/Variability ----



### STEP 10. Measure the standard deviation of each variable ----
# Measuring the variability in the dataset is important because the amount of
# variability determines how well you can generalize results from the sample
# dataset to a new observation in the population.

# Low variability is ideal because it means that you can better predict
# information about the population based on sample data. High variability means
# that the values are less consistent, thus making it harder to make
# predictions.

# The format “dataset[rows, columns]” can be used to specify the exact rows and
# columns to be considered. “dataset[, columns]” implies all rows will be
# considered. Specifying “BostonHousing[, -4]” implies all the columns except
# column number 4. This can also be stated as
# “BostonHousing[, c(1,2,3,5,6,7,8,9,10,11,12,13,14)]”. This allows us to
# calculate the standard deviation of only columns that are numeric, thus
# leaving out the columns termed as “factors” (categorical) or those that have
# a string data type.



sapply(heart_disease[,14], sd)



### STEP 11. Measure the variance of each variable ----


### STEP 12. Measure the kurtosis of each variable ----
# The Kurtosis informs you of how often outliers occur in the results.

# There are different formulas for calculating kurtosis.
# Specifying “type = 2” allows us to use the 2nd formula which is the same
# kurtosis formula used in SPSS and SAS. More details about any function can be
# obtained by searching the R help knowledge base. The knowledge base says:

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")



### STEP 13. Measure the skewness of each variable ----

# The skewness informs you of the asymmetry of the distribution of results.
# Similar to kurtosis, there are several ways of computing the skewness.
# Using “type = 2” can be interpreted as:

# 1.	Skewness between -0.4 and 0.4 (inclusive) implies that there is no skew
# in the distribution of results; the distribution of results is symmetrical;
# it is a normal distribution.
# 2.	Skewness above 0.4 implies a positive skew; a right-skewed distribution.
# 3.	Skewness below -0.4 implies a negative skew; a left-skewed distribution.


sapply(heart_disease[,14],  skewness, type = 2)

#YOU ARE HERE 
# *****************************************************************************
# Lab 2.b.: Exploratory Data Analysis for Qualitative Data ----
#
# Course Code: BBT4206
# Course Name: Business Intelligence II
# Semester Duration: 21st August 2023 to 28th November 2023
#
# Lecturer: Allan Omondi
# Contact: aomondi_at_strathmore_dot_edu
#
# Note: The lecture contains both theory and practice. This file forms part of
#       the practice. It has required lab work submissions that are graded for
#       coursework marks.
#
# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# **[OPTIONAL] Initialization: Install and use renv ----
# The R Environment ("renv") package helps you create reproducible environments
# for your R projects. This is helpful when working in teams because it makes
# your R projects more isolated, portable and reproducible.

# Further reading:
#   Summary: https://rstudio.github.io/renv/
#   More detailed article: https://rstudio.github.io/renv/articles/renv.html

# "renv" It can be installed as follows:
# if (!is.element("renv", installed.packages()[, 1])) {
# install.packages("renv", dependencies = TRUE,

# require("renv") # nolint

# Once installed, you can then use renv::init() to initialize renv in a new
# project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
# renv::init() # nolint

# This will set up a project library, containing all the packages you are
# currently using. The packages (and all the metadata needed to reinstall
# them) are recorded into a lockfile, renv.lock, and a .Rprofile ensures that
# the library is used every time you open the project.

# Consider a library as the location where packages are stored.
# Execute the following command to list all the libraries available in your
# computer:
.libPaths()

# One of the libraries should be a folder inside the project if you are using
# renv

# Then execute the following command to see which packages are available in
# each library:
lapply(.libPaths(), list.files)

# This can also be configured using the RStudio GUI when you click the project
# file, e.g., "BBT4206-R.Rproj" in the case of this project. Then
# navigate to the "Environments" tab and select "Use renv with this project".

# As you continue to work on your project, you can install and upgrade
# packages, using either:
# install.packages() and update.packages or
# renv::install() and renv::update()

# You can also clean up a project by removing unused packages using the
# following command: renv::clean()

# After you have confirmed that your code works as expected, use
# renv::snapshot(), AT THE END, to record the packages and their
# sources in the lockfile.

# Later, if you need to share your code with someone else or run your code on
# a new machine, your collaborator (or you) can call renv::restore() to
# reinstall the specific package versions recorded in the lockfile.

# [OPTIONAL]
# Execute the following code to reinstall the specific package versions
# recorded in the lockfile (restart R after executing the command):
# renv::restore() # nolint

# [OPTIONAL]
# If you get several errors setting up renv and you prefer not to use it, then
# you can deactivate it using the following command (restart R after executing
# the command):
# renv::deactivate() # nolint

# If renv::restore() did not install the "languageserver" package (required to
# use R for VS Code), then it can be installed manually as follows (restart R
# after executing the command):



# Methods used for sentiment analysis include:
# (i) Training a known dataset
# (ii) Creating your own classifiers with rules
# (iii) Using predefined lexical dictionaries (lexicons); a lexicon approach

# Levels of sentiment analysis include:
# (i) Document
# (ii) Sentence
# (iii) Word


# STEP 1. Install and Load the Required Packages ----
# The following packages can be installed and loaded before proceeding to the
# subsequent steps.

## dplyr - For data manipulation ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("dplyr")

## ggplot2 - For data visualizations using the Grammar for Graphics package ----
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")

## ggrepel - Additional options for the Grammar for Graphics package ----
if (!is.element("ggrepel", installed.packages()[, 1])) {
  install.packages("ggrepel", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggrepel")

## ggraph - Additional options for the Grammar for Graphics package ----
if (!is.element("ggraph", installed.packages()[, 1])) {
  install.packages("ggraph", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggraph")

## tidytext - For text mining ----
if (!is.element("tidytext", installed.packages()[, 1])) {
  install.packages("tidytext", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("tidytext")

## tidyr - To tidy messy data ----
if (!is.element("tidyr", installed.packages()[, 1])) {
  install.packages("tidyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("tidyr")

## widyr - To widen, process, and re-tidy a dataset ----
if (!is.element("widyr", installed.packages()[, 1])) {
  install.packages("widyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("widyr")

## gridExtra - to arrange multiple grid-based plots on a page ----
if (!is.element("gridExtra", installed.packages()[, 1])) {
  install.packages("gridExtra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("gridExtra")

## knitr - for dynamic report generation ----
if (!is.element("knitr", installed.packages()[, 1])) {
  install.packages("knitr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("knitr")

## kableExtra - for nicely formatted output tables ----
if (!is.element("kableExtra", installed.packages()[, 1])) {
  install.packages("kableExtra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("kableExtra")

## formattable -  To create a formattable object ----
# A formattable object is an object to which a formatting function and related
# attributes are attached.
if (!is.element("formattable", installed.packages()[, 1])) {
  install.packages("formattable", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("formattable")

## circlize - To create a cord diagram or visualization ----
# by Gu et al. (2014)
if (!is.element("circlize", installed.packages()[, 1])) {
  install.packages("circlize", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("circlize")

## memery - For creating data analysis related memes ----
# The memery package generates internet memes that optionally include a
# superimposed inset plot and other atypical features, combining the visual
# impact of an attention-grabbing meme with graphic results of data analysis.
if (!is.element("memery", installed.packages()[, 1])) {
  install.packages("memery", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("memery")

## magick - For image processing in R ----
if (!is.element("magick", installed.packages()[, 1])) {
  install.packages("magick", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("magick")

## yarrr - To create a pirate plot ----
if (!is.element("yarrr", installed.packages()[, 1])) {
  install.packages("yarrr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("yarrr")

## radarchart - To create interactive radar charts using ChartJS ----
if (!is.element("radarchart", installed.packages()[, 1])) {
  install.packages("radarchart", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("radarchart")

## igraph - To create ngram network diagrams ----
if (!is.element("igraph", installed.packages()[, 1])) {
  install.packages("igraph", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("igraph")

## wordcloud2 - For creating wordcloud by using 'wordcloud2.JS ----
if (!is.element("wordcloud2", installed.packages()[, 1])) {
  install.packages("wordcloud2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("wordcloud2")

## readr - Load datasets from CSV files ----
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(loans, col = c("red", "grey"), legend = TRUE)


# Data Types
sapply(heart_disease, class)
glimpse(heart_disease)

# Summary of each variable
summary(heart_disease)

# STEP 4. Create a subset of the data using the "dplyr" package ----
## The "dplyr" Package ----
# We will also require the "dplyr" package

# "dplyr" is a grammar of *data manipulation*, providing a consistent set of
# verbs that help you solve the most common data manipulation challenges:
#   mutate() adds new variables that are functions of existing variables
#   select() picks variables based on their names.
#   group_by() groups the data into categories
#   filter() picks cases based on their values.
#   summarise() reduces multiple values down to a single summary.
#   arrange() changes the ordering of the rows.

# Documentation of "dplyr":
#   https://cran.r-project.org/package=dplyr or
#   https://github.com/tidyverse/dplyr

## The Pipe Operator in the "dplyr" Package ----
# In R, the %>% symbol represents the pipe operator.
# The pipe operator is used for chaining or piping operations together in a
# way that enhances the readability and maintainability of code. It is
# useful when working with data manipulation and data transformation tasks.

# The %>% operator takes the result of the expression on its left and passes it
# as the first argument to the function on its right. This allows you to chain
# together a sequence of operations on a dataset or object.

# For example:
# Example 1:
# library(dplyr) # Load the dplyr package (which uses %>%) # nolint

# result <- df %>%
#   filter(age > 30) %>%   # Filter rows where age is greater than 30
#   group_by(sex) %>%  # Group the data by sex
#   summarise(mean_salary = mean(salary))  # Calculate the mean salary for each group # nolint

# # 'result' now contains the result of these operations

# Example 2:
# nhanes_dataset <- nhanes_dataset %>%
#   mutate(MAP = BPDiaAve + (1 / 3) * (BPSysAve - BPDiaAve)) # nolint

evaluation_per_group_per_sex <- heart_disease %>% # nolint
  mutate(`Student's sex` =
           ifelse(sex == 1, "Male", "Female")) %>%
  select(sex, sex,
         `Student's sex`, `thalach`) %>%
  filter(!is.na(`thalach`)) %>%
  group_by(sex, `Student's sex`) %>%
  summarise(average_evaluation_rating =
              mean(`thalach`)) %>%
  arrange(desc(average_evaluation_rating), .by_group = TRUE)

# Plain tabular output
View(evaluation_per_group_per_sex)

# Decorated tabular output
evaluation_per_group_per_sex %>%
  rename(`Class Group` = sex) %>%
  rename(`thalach` = average_evaluation_rating) %>%
  select(`Class Group`, `Student's sex`,
         `thalach`) %>%
  mutate(`thalach` =
           color_tile("#B9BCC2", "#536CB5")
         (`thalach`)) %>%
  kable("html", escape = FALSE, align = "c",
        caption = "Course Evaluation Rating per Group and per sex") %>%
  kable_styling(bootstrap_options =
                  c("striped", "condensed", "bordered"),
                full_width = FALSE)

# Decorated visual bar chart

#YOU ARE HERE 



#IT ENDS HERE FOR LAB 3

# [OPTIONAL] **Deinitialization: Create a snapshot of the R environment ----
# Lastly, as a follow-up to the initialization step, record the packages
# installed and their sources in the lockfile so that other team-members can
# use renv::restore() to re-install the same package version in their local
# machine during their initialization step.
# renv::snapshot() # nolint

# References ----
## Ashton, D., Porter, S., library), N. D. (chart js, library), T. L. (chart js, & library), W. E. (chart js. (2016). radarchart: Radar Chart from ‘Chart.js’ (0.3.1) [Computer software]. https://cran.r-project.org/package=radarchart # nolint ----

## Auguie, B., & Antonov, A. (2017). gridExtra: Miscellaneous Functions for ‘Grid’ Graphics (2.3) [Computer software]. https://cran.r-project.org/package=gridExtra # nolint ----

## Bevans, R. (2023b). Sample Crop Data Dataset for ANOVA (Version 1) [Dataset]. Scribbr. https://www.scribbr.com/wp-content/uploads//2020/03/crop.data_.anova_.zip # nolint ----

## Csárdi, G., Nepusz, T., Traag, V., Horvát, S., Zanini, F., Noom, D., Müller, K., Salmon, M., & details, C. Z. I. igraph author. (2023). igraph: Network Analysis and Visualization (1.5.1) [Computer software]. https://cran.r-project.org/package=igraph # nolint ----

## Gu, Z., Gu, L., Eils, R., Schlesner, M., & Brors, B. (2014). Circlize Implements and Enhances Circular Visualization in R. Bioinformatics (Oxford, England), 30(19), 2811–2812. https://doi.org/10.1093/bioinformatics/btu393 #nolint ----

## Gu, Z. (2022). circlize: Circular Visualization (0.4.15) [Computer software]. https://cran.r-project.org/package=circlize # nolint ----

## Lang, D., & Chien, G. (2018). wordcloud2: Create Word Cloud by ‘htmlwidget’ (0.2.1) [Computer software]. https://cran.r-project.org/package=wordcloud2 # nolint ----

## Leonawicz, M. (2023). memery: Internet Memes for Data Analysts (0.5.7) [Computer software]. https://cran.r-project.org/package=memery # nolint ----

## Liske, D. (2018). R NLP & Machine Learning: Lyric Analysis [Tutorial]. Datacamp. https://www.datacamp.com/tutorial/R-nlp-machine-learning # nolint ----

## Ooms, J. (2023). magick: Advanced Graphics and Image-Processing in R (2.7.5) [Computer software]. https://cran.r-project.org/package=magick # nolint ----

## Pedersen, T. L., & RStudio. (2022). ggraph: An Implementation of Grammar of Graphics for Graphs and Networks (2.1.0) [Computer software]. https://cran.r-project.org/package=ggraph # nolint ----

## Phillips, N. (2017). yarrr: A Companion to the e-Book ‘YaRrr!: The Pirate’s Guide to R’ (0.1.5) [Computer software]. https://cran.r-project.org/package=yarrr # nolint ----

## Queiroz, G. D., Fay, C., Hvitfeldt, E., Keyes, O., Misra, K., Mastny, T., Erickson, J., Robinson, D., Silge  [aut, J., & cre. (2023). tidytext: Text Mining using ‘dplyr’, ‘ggplot2’, and Other Tidy Tools (0.4.1) [Computer software]. https://cran.r-project.org/package=tidytext # nolint ----

## Ren, K., & Russell, K. (2021). formattable: Create ‘Formattable’ Data Structures (0.2.1) [Computer software]. https://cran.r-project.org/package=formattable # nolint ----

## Robinson, D., Misra, K., Silge  [aut, J., & cre. (2022). widyr: Widen, Process, then Re-Tidy Data (0.1.5) [Computer software]. https://cran.r-project.org/package=widyr # nolint ----

## Slowikowski, K., Schep, A., Hughes, S., Dang, T. K., Lukauskas, S., Irisson, J.-O., Kamvar, Z. N., Ryan, T., Christophe, D., Hiroaki, Y., Gramme, P., Abdol, A. M., Barrett, M., Cannoodt, R., Krassowski, M., Chirico, M., & Aphalo, P. (2023). ggrepel: Automatically Position Non-Overlapping Text Labels with ‘ggplot2’ (0.9.3) [Computer software]. https://cran.r-project.org/package=ggrepel # nolint ----

## Wickham, H., Chang, W., Henry, L., Pedersen, T. L., Takahashi, K., Wilke, C., Woo, K., Yutani, H., Dunnington, D., Posit, & PBC. (2023). ggplot2: Create Elegant Data Visualisations Using the Grammar of Graphics (3.4.3) [Computer software]. https://cran.r-project.org/package=ggplot2 # nolint ----

## Wickham, H., François, R., Henry, L., Müller, K., Vaughan, D., Software, P., & PBC. (2023). dplyr: A Grammar of Data Manipulation (1.1.3) [Computer software]. https://cran.r-project.org/package=dplyr # nolint ----

## Wickham, H., Vaughan, D., Girlich, M., Ushey, K., Posit, & PBC. (2023). tidyr: Tidy Messy Data (1.3.0) [Computer software]. https://cran.r-project.org/package=tidyr # nolint ----

## Xie  [aut, Y., cre, Sarma, A., Vogt, A., Andrew, A., Zvoleff, A., Al-Zubaidi, A., http://www.andre-simon.de), A. S. (the C. files under inst/themes/ were derived from the H. package, Atkins, A., Wolen, A., Manton, A., Yasumoto, A., Baumer, B., Diggs, B., Zhang, B., Yapparov, B., Pereira, C., Dervieux, C., Hall, D., … PBC. (2023). knitr: A General-Purpose Package for Dynamic Report Generation in R (1.44) [Computer software]. https://cran.r-project.org/package=knitr # nolint ----

## Zhu  [aut, H., cre, Travison, T., Tsai, T., Beasley, W., Xie, Y., Yu, G., Laurent, S., Shepherd, R., Sidi, Y., Salzer, B., Gui, G., Fan, Y., Murdoch, D., & Evans, B. (2021). kableExtra: Construct Complex Table with ‘kable’ and Pipe Syntax (1.3.4) [Computer software]. https://cran.r-project.org/package=kableExtra # nolint ----

# **Required Lab Work Submission** ----

# NOTE: The lab work should be done in groups of between 2 and 5 members using
#       Git and GitHub.

## Part A ----
# Create a markdown file called "Lab2b-Submission-EDA-Qual-Markdown.Rmd"
# and place it inside the folder called "markdown". Use R Studio to ensure the
# .Rmd file is based on the "GitHub Document (Markdown)" template when it is
# being created.
# Provide an interpretation of the most significant visualizations in the
# markdown file. The emphasis should be on ensuring that the visualizations are
# understandable.

## Part B ----
# Render the .Rmd (R markdown) file into its .md (markdown) version by using
# knitR in RStudio.

# You need to download and install "pandoc" to render the R markdown.
# Pandoc is a file converter that can be used to convert the following files:
#   https://pandoc.org/diagram.svgz?v=20230831075849

# Documentation:
#   https://pandoc.org/installing.html and
#   https://github.com/REditorSupport/vscode-R/wiki/R-Markdown

# By default, Rmd files are open as Markdown documents. To enable R Markdown
# features, you need to associate *.Rmd files with rmd language.
# Add an entry Item "*.Rmd" and Value "rmd" in the VS Code settings,
# "File Association" option.

# Documentation of knitR: https://www.rdocumentation.org/packages/knitr/

# Upload *the link* to "Lab2b-Submission-EDA-Qual-Markdown.md" (not .Rmd)
# markdown file hosted on Github's main branch (do not upload the .Rmd or .md
# markdown files) through the submission link provided on eLearning.

# References ----
# Refer to the APA 7th edition manual for rules on how to cite datasets:
# https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references  # nolint: line_length_linter.

## Brown, M. (2014). Dow Jones index (Version 1) [Dataset]. University of California, Irvine (UCI) Machine Learning Repository. https://doi.org/10.24432/C5788V # nolint ----

## Ferreira, R., Martiniano, A., Ferreira, A., Ferreira, A., & Sassi, R. (2017). Daily demand forecasting orders (Version 1) [Dataset]. University of California, Irvine (UCI) Machine Learning Repository. https://doi.org/10.24432/C5BC8T # nolint ----

## Iranian churn dataset (Version 1). (2020). [Dataset]. University of California, Irvine (UCI) Machine Learning Repository. https://doi.org/10.24432/C5JW3Z # nolint ----

## Yeh, I.-C. (2016). Default of credit card clients (Version 1) [Dataset]. University of California, Irvine (UCI) Machine Learning Repository. https://doi.org/10.24432/C55S3H # nolint ----

# **Required Lab Work Submission** ----
## Part A ----
# Specify the code you have used to load your own dataset for the BI Project
# here:

## Part B ----
# Upload *the link* to your "Lab1-LoadingDatasets.R" hosted on Github (do not
# upload the .R file itself) through the submission link provided on
# eLearning.

## Part C ----
# Create a markdown file called "BIProject.Rmd" and place it inside the folder
# called "markdown". The markdown should have a code chunk that explains how
# the dataset has been loaded.

## Part D ----
# Upload *the link* to "BIProject.md" (not .Rmd) markdown file hosted on Github
# (do not upload the .Rmd or .md markdown files) through the same submission
# link provided on eLearning.
