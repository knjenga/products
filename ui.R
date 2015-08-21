library(shiny)

usa_wea_dmg <- read.csv("usa_wea_dmg.csv")
last_state <- read.csv("last_state.csv")

shinyUI(navbarPage(title = 'US Weather Losses',                  
   tabPanel("Country View",inverse=TRUE,collapsable = TRUE,
      htmlOutput("weaPlot"),
      fluidRow(
         column(3,
            selectInput("var", 
                        label = "Weather Category",
                        choices = c("AVALANCHE","BLIZZARDS", "COLD WEATHER", "FLOODS",
                                    "FOG","HOT/DRY WEATHER", "HURRICANES","LAND SLIDES",
                                    "LIGHTNING","OTHER", "RAIN/HAIL", "SNOW/ICE",
                                    "STORMS" ,"SURGE/SURF","TORNADO","WIND"),
                        selected = "STORMS")
         ),
         column(4, offset = 1,     
            radioButtons("loss", "Loss type",
                         c("Fatalities" = "1",
                           "Injuries" = "2",
                           "Property Damage" = "3",
                           "Crop Damage" = "4",
                           "All Loss Types" = "5"),selected = "5")
         ),
         column(4,
            sliderInput("range", 
                        label = "Years Range:",
                        min = 2001, max = 2012, value = c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012))                           
         )
      )   
   ),
   tabPanel(title= "State View",
      sidebarLayout(position = "left",fluid= TRUE,
         selectInput("state",label = "State to Analyze",
                     choices = c("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut",
                                 "Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa",
                                 "Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan",
                                 "Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire",
                                 "New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma",
                                 "Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee",
                                 "Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"),
                                 selected = "Texas"),
         mainPanel(
            htmlOutput("statePlot")
         )
      )
   ),
   navbarMenu("Help",
   tabPanel(title= "Country View Tab",
            h3("Introduction",align = "left"),
            br(),
            p("Every year sever weather events in the United States cause hundreds of Deaths and Injuries as wells as millions of Dollars of both property and Crop Damage. Various state Government planning officials are tasked with planning on how to deal with these Weather events. The US Weather application is designed to give them Information to help them with their planning."),
            br(),
            p("The data used by the application was obtained from the U.S. National Oceanic and Atmospheric Administration (NOAA) storm database. The database tracks Weather events across the US and has been doing so for the past several decades. The application only uses the most recent data from which is data from the Years 2001-2012"),
            
            h3("Country View - Tab",align = "left"),
            p("The Country View tab is used to present historical severe weather events in the United States by presenting the data in graphical map format."),
            p("The Graphs appear at the top of the page and the controls are at the bottom of the page."),
            br(),
            h4("Weather Category - pull down",align = "Left"),
            p("The Weather Category - pull down is used to selecte the type of weather catergory you want to compare across the US"),
            br(),
            h4("Loss Type - Radio Buttons",align = "Left"),
            p("The Loss Type - Radio Buttons allow the user to select the of Weather Loss to be displayed."),
            br(),
            h4("Years Range- Slider",align = "Left"),
            p("Years Range- Allows the user to select what years they want refelcted in the graphs.")
   ),
   tabPanel(title= "State View Tab",
            h3("Introduction",align = "left"),
            br(),
            p("Every year sever weather events in the United States cause hundreds of Deaths and Injuries as wells as millions of Dollars of both property and Crop Damage. Various state Government planning officials are tasked with planning on how to deal with these Weather events. The US Weather application is designed to give them Information to help them with their planning."),
            p("The data used by the application was obtained from the U.S. National Oceanic and Atmospheric Administration (NOAA) storm database. The database tracks Weather events across the US and has been doing so for the past several decades. The application only uses the most recent data from which is data from the Years 2001-2012"),
            h3("State View - Tab",align = "left"),
            p("The Country View tab is used to present a single states loss data in a motion chart that allows for free form analyis."),
            h4("State - pull down",align = "Left"),
            p("The State - pull down allows the user to select a state in the United states they wish to do detalied analyis on"),
            br(),
            p("The state analysis data  is presented using a motion graph format, for details on how to use the a motion graph please refer to the picture bellow."),
            img(src = "gvis_how_to.png", height = 600, width = 600)   
   )
   )
))