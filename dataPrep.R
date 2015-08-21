library(dplyr)
library(stringr)
source("mstrGrps.R")
# The data used for analysis should in the working directory load it
  working_dir <- getwd()
  data_file <- paste0(working_dir,"/data/repdata-data-StormData.csv")
# Load the data file
  wea_data <- read.csv(data_file)
# Add the year of the event
  wea_data <- mutate(wea_data,event_year = substr(as.Date(wea_data$BGN_DATE, format = "%y"),1,4))
# Process the data for analysis, get the data for each county in the United States
  WeaAgg <- group_by(wea_data,event_year,EVTYPE,STATE)
  dmg_cost_data <- summarize(WeaAgg,
                             prop_dmg_cost = sum(PROPDMG, na.rm = TRUE),
                             corp_dmg_cost = sum(CROPDMG, na.rm = TRUE),
                             total_fatalities = sum(FATALITIES, na.rm = TRUE),
                             total_injuries = sum(INJURIES, na.rm = TRUE), 
                             tot_dmg_Cost = prop_dmg_cost + corp_dmg_cost)
# Remove the records with no damage,injuries and deaths
  dmg_cost_data <- filter(dmg_cost_data, tot_dmg_Cost > 0 | total_fatalities > 0 | total_injuries > 0)
# create a column to hold the master weather types with the default
  dmg_cost_data$EVTYPE <- str_to_upper(dmg_cost_data$EVTYPE)
# create a column to hold the master weather types with the default
  dmg_cost_data <- mutate(dmg_cost_data,weather_type = 'OTHER')
# assign weather categories
  usa_wea_dmg <- asgn_wea_ctgy(dmg_cost_data)
# Write the formated data to a file for reporting
  write_file = paste0(working_dir,"/data/usa_wea_dmg.csv")
  write.csv(usa_wea_dmg, file = write_file)
