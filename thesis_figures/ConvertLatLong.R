
library(maps)


#I am doing the reverse geocoding using the function map.where from the maps package.
#Here I used three maps of the package; world, state and county
country<-map.where(database="world", 
                           sampling$lon, sampling$lat)
state<-map.where(database="state", 
                         sampling$lon, sampling$lat)
county<-map.where(database="county", 
                        sampling$lon, sampling$lat)

