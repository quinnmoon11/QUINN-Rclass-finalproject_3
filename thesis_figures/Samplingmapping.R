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
 #add this to fix coords coord_fixed(1.3)
  
#plot without labels
ggplot(sampling, aes(lon, lat), fill = "gray94", color = "white") +
  borders("state") + geom_point(color = "red") +
  coord_fixed(1.3) +
  theme_void() 
  
#save the map as pdf
ggsave("sampling2.pdf")

 Citing tidygeocoder

 
