#load required packages
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#read in coords for samples

sampling <- read.table("RcoordsMI.txt", sep = "\t", header = TRUE)
sampling 
#plot points and use repel  
ggplot(sampling, aes(lon, lat), color = "black") +
  borders("state") + geom_point(color = "red") +
  ggrepel::geom_text_repel(aes(label = Id), size = 2.3, max.overlaps = 10) +
  theme_void() +
  coord_fixed(1.3)
  
 #add this to fix coords coord_fixed(1.3)
  
#plot without labels
ggplot(sampling, aes(lon, lat), fill = "gray94", color = "white") +
  borders("state") + geom_point(color = "red") +
  coord_fixed(1.3) +
  theme_void() 
  
#save the map as pdf
ggsave("sampling2.pdf")
ggsave("finalsampling.jpg")

 
 
#Mapping Midwest populations  

library(maps)

ggplot(mw, aes(long, lat), color = "black")
mw <- map_data("county", c("illinois", "indiana", "michigan"))
 
 
 
mw <- map_data("county", c("illinois", "indiana", "michigan"))
mw <- map_data("state", c("illinois", "indiana", "michigan"))

ggplot(mw, aes(long, lat)) +
  geom_polygon(aes(group = group), fill = NA, colour = "black") +
  theme_void() +
  coord_fixed(1.3)
  
#take off high lat counties
require(dplyr)
below45 <- filter(mw,lat < 45)
 

 
 
 
 
#states data
states <- map_data("state")
  
 p <- ggplot(data = states)
 #make blank US Map
p <- ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, group = group), fill = "white", color = "black") + 
  coord_fixed(1.3) +
  coord_fixed(1.3)
p









