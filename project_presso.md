USA Weather loss Analysis Tool
========================================================

date: August 20th 2015


USA Weather Losses 
========================================================

```r
library(ggplot2)
library(reshape2)
library(dplyr)

usa_wea_dmg <- read.csv("usa_wea_dmg.csv")
year_agg <- group_by(usa_wea_dmg,Year)
prop_dmg <- summarize(year_agg,Property_Damage = sum(Property_Damage),Crop_Damage = sum(Crop_Damage))
prop_dmg <- melt(prop_dmg,id.vars = c("Year"))
colnames(prop_dmg) <- c("Year","Damage_Type","Damage_Cost")
health_dmg <- summarize(year_agg,Fatalities = sum(Fatalities),Injuries = sum(Injuries))
health_dmg <- melt(health_dmg,id.vars = c("Year"))
colnames(health_dmg) <- c("Year","Damage_Type","Damage_Cost")
```

![plot of chunk unnamed-chunk-2](project_presso-figure/unnamed-chunk-2-1.png) 
***

```r
g2 <- ggplot(health_dmg, aes(x=Year, y=Damage_Cost,fill=Damage_Type)) 
g2 <- g2 + geom_bar(stat="identity",position="dodge")
g2 <- g2 + xlab("Year") + ylab("Damage Costs") + ggtitle("USA Weather Health Loss")
plot(g2)
```

![plot of chunk unnamed-chunk-3](project_presso-figure/unnamed-chunk-3-1.png) 

Weather Application
========================================================

The USA Weather loss Analysis Tool was designed to help to give the historical trends of the losses to guide tasked with planning on how to deal with these events.The tool provides data between the years 2001 to 2012 by allowing the analyis in two dimensions.
- A Country view to compare and analyze different states.
- A State view to Analyze weather events for a particular state.

The USA Weather loss Analysis Tool provides a great opportunity to analyze and plan for losses associated with server weather events. The application can be acessed at the location bellow:
https://knjenga.shinyapps.io/test2
Country View Analyis
========================================================
The Country view section of the application allows the user to analyze US weather Loss patterns on a national level. The user gets a graphical map of the Loss state by state.
The data displayed is based on the following user selections:
- The Type of weather Event
- The type of loss
- The range of years to display (2001-2013)
![alt text](country_view.PNG)
State View Analyis
========================================================
The State view section of the application allows the user to analyze weather Loss patterns in great detail with tantalizing interactive graphs after the user selects the state of interest. The Analysis can be visualized using the following formats:
- Bubble Charts
- Bar Charts
- Line Graphs
![alt text](all_state_horz.png)
