
# *****************************************************************************
# Lab 3: Data Imputation ----
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
# repos = "https://cloud.r-project.org") # nolint
# }
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


# Introduction ----
# Data imputation, also known as missing data imputation, is a technique used
# in data analysis and statistics to fill in missing values in a dataset.
# Missing data can occur due to various reasons, such as equipment malfunction,
# human error, or non-response in surveys.

# Imputing missing data is important because many statistical analysis methods
# and Machine Learning algorithms require complete datasets to produce accurate
# and reliable results. By filling in the missing values, data imputation helps
# to preserve the integrity and usefulness of the dataset.

## Data Imputation Methods ----

### 1. Mean/Median Imputation ----

# This method involves replacing missing values with the mean or median value
# of the available data for that variable. It is a simple and quick approach
# but does not consider any relationships between variables.

# Unlike the recorded values, mean-imputed values do not include natural
# variance. Therefore, they are less “scattered” and would technically minimize
# the standard error in a linear regression. We would perceive our estimates to
# be more accurate than they actually are in real-life.

### 2. Regression Imputation ----
# In this approach, missing values are estimated by regressing the variable
# with missing values on other variables that are known. The estimated values
# are then used to fill in the missing values.

### 3. Multiple Imputation ----
# Multiple imputation involves creating several plausible imputations for each
# missing value based on statistical models that capture the relationships
# between variables. This technique recognizes the uncertainty associated with
# imputing missing values.

### 4. Machine Learning-Based Imputation ----
# Machine learning algorithms can be used to predict missing values based on
# the patterns and relationships present in the available data. Techniques such
# as K-Nearest Neighbours (KNN) imputation or decision tree-based imputation can
# be employed.

### 5. Hot Deck Imputation ----
# This method involves finding similar cases (referred to as donors) that have
# complete data and using their values to impute missing values in other cases
# (referred to as recipients).

### 6. Multiple Imputation by Chained Equations (MICE) ----
# MICE is flexible and can handle different variable types at once (e.g.,
# continuous, binary, ordinal etc.). For each variable containing missing
# values, we can use the remaining information in the data to train a model
# that predicts what could have been recorded to fill in the blanks.
# To account for the statistical uncertainty in the imputations, the MICE
# procedure goes through several rounds and computes replacements for missing
# values in each round. As the name suggests, we thus fill in the missing
# values multiple times and create several complete datasets before we pool the
# results to arrive at more realistic results.

## Types of Missing Data ----
### 1. Missing Not At Random (MNAR) ----
# Locations of missing values in the dataset depend on the missing values
# themselves. For example, students submitting a course evaluation tend to
# report positive or neutral responses and skip questions that will result in a
# negative response. Such students may systematically leave the following
# question blank because they are uncomfortable giving a bad rating for their
# lecturer: “Classes started and ended on time”.

### 2. Missing At Random (MAR) ----
# Locations of missing values in the dataset depend on some other observed
# data. In the case of course evaluations, students who are not certain about a
# response may feel unable to give accurate responses on a numeric scale, for
# example, the question "I developed my oral and writing skills " may be
# difficult to measure on a scale of 1-5. Subsequently, if such questions are
# optional, they rarely get a response because it depends on another unobserved
# mechanism: in this case, the individual need for more precise
# self-assessments.

### 3. Missing Completely At Random (MCAR) ----
# In this case, the locations of missing values in the dataset are purely
# random and they do not depend on any other data.

# In all the above cases, removing the entire response  because one question
# has missing data may distort the results.

# If the data are MAR or MNAR, imputing missing values is advisable.

# STEP 1. Install and Load the Required Packages ----
# The following packages should be installed and loaded before proceeding to the
# subsequent steps.

## NHANES ----
# The dataset we will use (for educational purposes) is the US National Health
# and Nutrition Examination Study (NHANES) dataset created from 1999 to 2004.

# Documentation of NHANES:
#   https://cran.r-project.org/package=NHANES or
#   https://cran.r-project.org/web/packages/NHANES/NHANES.pdf or
#   http://www.cdc.gov/nchs/nhanes.htm

# This requires the "NHANES" package available in R

if (!is.element("NHANES", installed.packages()[, 1])) {
  install.packages("NHANES", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("NHANES")

## dplyr ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("dplyr")

## naniar ----
# Documentation:
#   https://cran.r-project.org/package=naniar or
#   https://www.rdocumentation.org/packages/naniar/versions/1.0.0
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")

## ggplot2 ----
# We require the "ggplot2" package to create more appealing visualizations
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")

## MICE ----
# We use the MICE package to perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")

## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")


##Step 2.Load dataset
library(readr)
heart_disease <- read_csv("data/heart-disease.csv")
View(heart_disease)


### Subset of rows ----
# We then select 500 random observations to be included in the dataset
rand_ind <- sample(seq_len(nrow(heart_disease)), 101)
heart_disease <- heart_disease[rand_ind, ]

# STEP 3. Confirm the "missingness" in the Dataset before Imputation ----
# Are there missing values in the dataset?
any_na(heart_disease)

# How many?
n_miss(heart_disease)

# What is the percentage of missing data in the entire dataset?
prop_miss(heart_disease)

# How many missing values does each variable have?
heart_disease %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(heart_disease)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(heart_disease)

# Which variables contain the most missing values?
gg_miss_var(heart_disease)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(heart_disease) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together? Should bring an error since
#there are no missing values
#gg_miss_upset(heart_disease)

# Create a heatmap of "missingness" broken down by "Sex"
# First, confirm that the "Sex" variable is a categorical variable
is.factor(heart_disease$sex)
# Second, create the visualization
gg_miss_fct(heart_disease, fct = sex)

# We can also create a heatmap of "missingness" broken down by "exang"
# First, confirm that the "Depressed" variable is a categorical variable
is.factor(heart_disease$exang)
# Second, create the visualization
gg_miss_fct(heart_disease, fct = exang)


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
