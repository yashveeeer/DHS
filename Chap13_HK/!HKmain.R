# /*******************************************************************************************************************************
# Program: 				HKmain.do
# Purpose: 				Main file for the HIV Knowledge, Attitudes, and Behavior Chapter. 
# The main file will call other source files that will produce the MS indicators and produce tables.
# Data outputs:		coded variables and table output on screen and in excel tables.  
# Author: 				Courtney Allen
# Translated to R:Courtney Allen
# Date last modified:		September 5, 2022

# *******************************************************************************************************************************/

rm(list = ls(all = TRUE))


library(tidyverse)  # most variable creation here uses tidyverse 
library(tidyselect) # used to select variables in FP_EVENTS.R
library(haven)      # used for Haven labeled DHS variables
library(labelled)   # used for Haven labeled variable creation
library(expss)      # for creating tables with Haven labeled data
library(openxlsx)   # for exporting to excel
library(naniar)     # to use replace_with_na function
library(here)       # to get R project path

#path for R project
here()

# path for this chapter. This is also where the data is stored
chap <- "Chap13_HK"

# select your survey

# IR Files
IRdatafile <-  "UGIR7BFL.dta"
#AFIR71FL.dta GMIR81FL.dta

# MR Files
MRdatafile <- "UGMR7BFL.dta"
#AFIR71FL.dta GMIR81FL.dta

# ****************************

# IR (women) and MR (men) file variables

# open dataset
IRdata <-  read_dta(here(chap,IRdatafile))

# do separate R scripts for each subtopic
source(here(paste0(chap,"/HK_KNW_ATD.R")))
#Purpose: 	Code marital status variables

source(here(paste0(chap,"/HK_RSKY_BHV.R")))
#Purpose: 	Code multiple sex partners and higher risk sex variables

source(here(paste0(chap,"/HK_TEST_CONSL.R")))
#Purpose: 	Code HIV testing and counseling variables 

source(here(paste0(chap,"/HK_STI.R")))
#Purpose: 	Code HIV testing and counseling variables

source(here(paste0(chap,"/HK_BHV_YNG.R")))
#Purpose: 	Code HIV variables among young people

source(here(paste0(chap,"/HK_tables_WM.R")))
#Purpose: 	Produce tables for indicators computed above. 

# ****************************



# MR (men) only file variables

# open dataset
MRdata <-  read_dta(here(chap,MRdatafile))

# do separate R scripts for each subtopic
source(here(paste0(chap,"/HK_CIRCUM.R")))
#Purpose: 	Code circumcision variables


source(here(paste0(chap,"/HK_tables_MN.R")))
#Purpose: 	Produce tables for indicators computed above. 

# ****************************

