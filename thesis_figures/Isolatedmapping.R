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
  filter(NAME == c("Michigan", "Indiana"))

#county <- counties(state = c("MI", "IN", cb = TRUE, class = "sf"))
county <- counties(state = c("MI", "IN"))

study_counties <- county %>% 
  filter(NAME %in% c("Tuscola", "Posey", "Gibson", "Knox", "Floyd", "Clark", "Tippecanoe", "Lake", "Porter", "LaPorte", "Newton", "Jasper", "Pulaski", "Starke"))
  
study_counties2 <- study_counties[-8,]  

  

study_counties2 %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA) +
  geom_sf_label_repel(aes(label = NAME), force = 50) +
  theme_void() 
 # ggsn::scalebar(state, dist = 100, st.size=3, height=0.01, transform= TRUE, model = 'WGS84')
map1 <- study_counties2 %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA) +
  geom_sf_label_repel(aes(label = NAME), force = 50) +
  theme_void()

> map1 +
+     scalebar(study_counties2, border.size = 0.5, st.size = 2.3, dist = 50, dist_unit = "km",
+              transform = TRUE, model = "WGS84")


 ggsave("counties.pdf")

