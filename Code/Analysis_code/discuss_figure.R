## ---- disc_fig_pack --------

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
require("ape")
require("phangorn")
require("phytools")
require("geiger")
library("gridExtra")

## ---- disc_fig_data --------

#grab states you want on the map
state <- states(cb = TRUE, class = "sf") %>% 
  filter(NAME %in% c("Michigan", "Indiana", "Colorado", "Kansas", "Nebraska", "Missousi"))

#grab counties in Michigan
county <- counties(state = c("MI"))
#just showing Tuscola County
study_counties <- county %>% 
  filter(NAME %in% c("Tuscola"))

## ---- disc_fig_plot --------

#plot this map with label
map_intro <- study_counties %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA, size = 2) +
  ggtitle("A. Introduced") +
  theme_void() 
  
#plot this map with label
map_native <- study_counties %>% 
  ggplot() +
  geom_sf(fill = "gray") +
  geom_sf(data = state, fill = NA, size = 2) +
  ggtitle("B. Native") +
  theme_void() 

#combine plots and save to pdf
g <- grid.arrange(map_intro, map_native, ncol = 2)


ggsave(file = "../../Results/discuss_fig_maps.pdf", g)


## ---- disc_fig_phylo --------


#make simple phylo and save to pdf
pdf(file = "../../Results/discuss_fig_phylo.pdf")
text.string <- "((Indiana, Michigan),Midwest);"
vert.tree<-read.tree(text=text.string)
rt.4<-rotate(vert.tree,4)
plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)
dev.off()




