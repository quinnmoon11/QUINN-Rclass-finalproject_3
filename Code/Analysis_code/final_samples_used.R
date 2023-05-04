#load required packages
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#read in coords for final samples
sampling <- read.table("../../Data/Raw_Data/RcoordsMI.txt", sep = "\t", header = TRUE)

#plot points and use repel  
ggplot(sampling, aes(lon, lat), color = "black") +
  borders("state") + geom_point(color = "red") +
  ggrepel::geom_text_repel(aes(label = Id), size = 2.3, max.overlaps = 10) +
  theme_void() +
  coord_fixed(1.3)
 #add this to fix coords coord_fixed(1.3)
  
ggsave("../../Results/final_samples_used.pdf")
 







