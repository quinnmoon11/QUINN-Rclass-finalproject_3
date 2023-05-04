#Mapping Midwest populations  

library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
#install.packages("devtools")
#devtools::install_github("yutannihilation/ggsflabel")
library(ggsflabel, warn.conflicts = FALSE)
#install.packages("tigris")
library(tigris, warn.conflicts = FALSE)
#install.packages("maptools")
#install.packages("ggsn")
library(ggsn)

#Load MI/IN state data from package
state <- states(cb = TRUE, class = "sf") %>% 
  filter(NAME == c("Michigan", "Indiana"))

#Load MI/IN county data from package
county <- counties(state = c("MI", "IN"))

#limit only to counties with known populations. County lists from (Minton 2001)
study_counties <- county %>% 
  filter(NAME %in% c("Tuscola", "Posey", "Gibson", "Knox", "Floyd", "Clark", "Tippecanoe", "Lake", "Porter", "LaPorte", "Newton", "Jasper", "Pulaski", "Starke"))
 
#drop one county (repeat) 
study_counties2 <- study_counties[-8,]  

#map states and fill in selected counties, repel county labels
map1 <- study_counties2 %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA) +
  geom_sf_label_repel(aes(label = NAME), force = 50) +
  theme_void()

#add scale bar to map
map1 + scalebar(study_counties2, border.size = 0.5, st.size = 1.8, dist = 50, dist_unit = "km",
             transform = TRUE, model = "WGS84")


 ggsave("../../Results/isolated_counties.pdf")

