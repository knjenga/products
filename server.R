library(shiny)
library(dplyr)
suppressPackageStartupMessages(library(googleVis))


# The data used for analysis should in the working directory load it
#  working_dir <- getwd()
#  data_file <- paste0(working_dir,"/data/usa_wea_dmg.csv")
# Load the data file
  usa_wea_dmg <- read.csv("usa_wea_dmg.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
   output$weaPlot <- renderGvis({

   loss_typ_str = "Fatalities, Injuries,Property and Crop"
      
   #filter data based on weather type selected and years to display   
   graph_data <- filter(usa_wea_dmg,Weather_Type == input$var,
                        Year >= input$range[1],Year <= input$range[2])
   #aggreagate the filtered data for weather type selected and years to display   
   state_aggr <- group_by(graph_data, State_Name_Lower)     
   graph_data <- summarize(state_aggr,Property_Damage = sum(Property_Damage),
                           Crop_Damage = sum(Crop_Damage),
                           Fatalities = sum(Fatalities),
                           Injuries = sum(Injuries))
   #create the graphs to display depending on the user choice
   if (input$loss == "1") {
      loss_typ_str = "Fatalities "
      #create the Fatalities graph Large version
      F <- gvisGeoChart(graph_data, "State_Name_Lower", "Fatalities",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=700, height=500,
                                     colorAxis="{colors:['white','#FF2800','#FF2400','#FF0000','#DC143C','#800000']}"))
      #Display the Fatalities graphs
      DISP <- F 
   } 
   else if (input$loss == "2") {
      loss_typ_str = "Injuries"
      #create the Injuries graph smaller version
      I <- gvisGeoChart(graph_data, "State_Name_Lower", "Injuries",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=800, height=600,
                                     colorAxis="{colors:['white','#FFB347','#F77F00','#FF5800','#CC5500']}"))
      #Display the Injuries graphs
      DISP <- I 
   }
   else if (input$loss == "3") {
      loss_typ_str = "Property"
      #create the Property Damage graph smaller version
      P <- gvisGeoChart(graph_data, "State_Name_Lower", "Property_Damage",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=700, height=500,
                                     colorAxis="{colors:['white','#989898','#9D9A96','#414A4C','#0F0F0F']}"))
      #Display the Property Damage graphs
      DISP <- P
   }
   else if (input$loss == "4") {
      loss_typ_str = "Crop"
      #create the Crop Damage graph smaller version
      C <- gvisGeoChart(graph_data, "State_Name_Lower", "Crop_Damage",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=800, height=600,
                                     colorAxis="{colors:['white','#77DD77','#32CD32','#1CAC78','#006400']}"))
      #Display the Crop Damage graphs
      DISP <- C
   }
   else if (input$loss == "5") {
      #create the Fatalities graph smaller version
      F <- gvisGeoChart(graph_data, "State_Name_Lower", "Fatalities",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=400, height=300,colorAxis="{colors:['#800000']}"))
      #create the Injuries graph smaller version
      I <- gvisGeoChart(graph_data, "State_Name_Lower", "Injuries",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=400, height=300,colorAxis="{colors:['Blue']}"))
      #create the Property Damage graph smaller version
      P <- gvisGeoChart(graph_data, "State_Name_Lower", "Property_Damage",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=400, height=300,colorAxis="{colors:['#0F0F0F']}"))
      #create the Crop Damage graph smaller version
      C <- gvisGeoChart(graph_data, "State_Name_Lower", "Crop_Damage",
                        options=list(region="US", displayMode="regions", resolution="provinces",
                                     width=400, height=300,colorAxis="{colors:['Green']}"))
      #Merge the graphs to display them all at once
      L1 <- gvisMerge(F,I, horizontal=TRUE) 
      L2 <- gvisMerge(P,C, horizontal=TRUE) 
      #Display the combined graphs
      DISP <- Reduce(gvisMerge, list(L1,L2))    
   }
   #Text to be displayed
    output$text1 <- renderText({paste("All ",loss_typ_str," Losses caused by ", input$var)})   
   # Output the the year range selected 
     output$text2 <- renderText({paste(" Damage for Years ", input$range[1]," to ", input$range[2])}) 
   
   #Display the approproate graph
   DISP 
   
   })
})