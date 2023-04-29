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

state <- states(cb = TRUE, class = "sf") %>% 
  filter(NAME %in% c("Michigan", "Indiana", "Colorado", "Kansas", "Nebraska", "Missousi"))

#county <- counties(state = c("MI", "IN", cb = TRUE, class = "sf"))
county <- counties(state = c("MI"))

study_counties <- county %>% 
  filter(NAME %in% c("Tuscola"))
     

study_counties %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA) +
  geom_sf_label_repel(aes(label = NAME), force = 50) +
  theme_void() 


study_counties %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA) +
  theme_void() 


 ggsave("counties.pdf")

