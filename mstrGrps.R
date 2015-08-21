######################################################################################################
#
# Title:            mstrGrps.R
# Purpose:          Assigns Master groups to the orignal Weather Events
#                   The original Weather Events were too numerous for effective reporting 
#
######################################################################################################

mstrGrps <- function(wae_dmg_data) {
   for (i in 1:nrow(wae_dmg_data)) {
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"AVALANCE")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"AVALANCHE")==TRUE)
      ) {
         wae_dmg_data$Weather_Type[i] <- "AVALANCHE"
      }     
      if (str_detect(wae_dmg_data$EVTYPE[i],"FOG")==TRUE) {
         wae_dmg_data$Weather_Type[i] <- "FOG"
      }   
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"LIGHTNING")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"LIGHTING")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"LIGNTNING")==TRUE)
      ) {
         wae_dmg_data$Weather_Type[i] <- "LIGHTNING"
      }
      if (str_detect(wae_dmg_data$EVTYPE[i],"HURRICANE")==TRUE) {
         wae_dmg_data$Weather_Type[i] <- "HURRICANES"
      }     
      if (str_detect(wae_dmg_data$EVTYPE[i],"BLIZZ")==TRUE) {
         wae_dmg_data$Weather_Type[i] <- "BLIZZARDS"
      }   
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"LAND")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"MUD")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"ROCK")==TRUE)
      ) {
         wae_dmg_data$Weather_Type[i] <- "LAND SLIDES"
      }  
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"FLOOD")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"FLD")==TRUE)
      ) {
         wae_dmg_data$Weather_Type[i] <- "FLOODS"
      }  
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"STORM")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"TSTM")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"DEPRESSION")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"TYPHOON")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"GUSTNADO")==TRUE)      
      ) {
         wae_dmg_data$Weather_Type[i] <- "STORMS"
      }  
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"TORNADO")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"FUNNEL")==TRUE)
      ) {
         wae_dmg_data$Weather_Type[i] <- "TORNADO"
      }     
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"SNOW")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"ICE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"GLAZE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"ICY")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SLEET")==TRUE)        
      ) {
         wae_dmg_data$Weather_Type[i] <- "SNOW/ICE"
      }
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"COLD")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"FROST")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"WINTER")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"WINDCHILL")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"AGRICULTURAL FREEZE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"DAMAGING FREEZE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"FREEZING SPRAY")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"HARD FREEZE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"LOW TEMPERATURE")==TRUE)          
      ) {
         wae_dmg_data$Weather_Type[i] <- "COLD WEATHER"
      }
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"RAIN")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"HAIL")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"PRECIPITATION")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"DRIZZLE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SHOWER")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"MIXED PRECIP")==TRUE)
             
      ) {
         wae_dmg_data$Weather_Type[i] <- "RAIN/HAIL"
      }
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"DROUGHT")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"HEAT")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"HOT")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"FIRE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"WARM")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SMOKE")==TRUE)
             
      ) {
         wae_dmg_data$Weather_Type[i] <- "HOT/DRY WEATHER"
      }  
      if (   (str_detect(wae_dmg_data$EVTYPE[i],"SURF")==TRUE) 
             | (str_detect(wae_dmg_data$EVTYPE[i],"TIDE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SWELLS")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"HIGH")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SURGE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"RIP")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"ROGUE")==TRUE)
             | (str_detect(wae_dmg_data$EVTYPE[i],"SEICHE")==TRUE)   
             | (str_detect(wae_dmg_data$EVTYPE[i],"TSUNAMI")==TRUE)  
             | (str_detect(wae_dmg_data$EVTYPE[i],"RAPIDLY RISING WATER")==TRUE) 
      ) {
         wae_dmg_data$Weather_Type[i] <- "SURGE/SURF"
      }  
      if (   (  (str_detect(wae_dmg_data$EVTYPE[i],"WIND")==TRUE) 
                | (str_detect(wae_dmg_data$EVTYPE[i],"BURST")==TRUE)
                | (str_detect(wae_dmg_data$EVTYPE[i],"DUST")==TRUE)
                | (str_detect(wae_dmg_data$EVTYPE[i],"TURBULENCE")==TRUE)  
                | (str_detect(wae_dmg_data$EVTYPE[i],"WATERSPOUT")==TRUE)   
                | (str_detect(wae_dmg_data$EVTYPE[i],"ROUGH SEAS")==TRUE)            
      )
      & (wae_dmg_data$Weather_Type[i]== "OTHER")
      ) {
         wae_dmg_data$Weather_Type[i] <- "WIND"
      }    
   }
   wae_dmg_data
}  