
require(ape)
require(ggtree)
require(treeio)

#initial viewing and rotating of nodes with FigTree
#read in Nexus file
phy <- read.nexus(file = '../../Data/Raw_data/RefG1_nexus.tre', tree.names = NULL, force.multi = FALSE)

#root tree on arizonae outgroup
phy2 <- root(phy, outgroup = "arizonae_OCGR6220", edgelabel = TRUE)


#first step is making sure I can see node and tip labels
p <- ggtree(phy2) + geom_tiplab(offset = .0014, align = TRUE)
p +   geom_cladelab(node=61, label="MI/IN", align=TRUE, 
                  offset = .006, textcolor='maroon', barcolor='maroon', angle = 90) +
                  geom_hilight(node=61, fill = 'blue') +
                    geom_cladelab(node=52, label="Midwest", align=TRUE, 
                  offset = .007, textcolor='red', barcolor='red', angle = 90) +
                  geom_hilight(node=52, fill = 'red') +
                    geom_cladelab(node= c(51,49,46), label="South Central", align=TRUE, 
                  offset = .006, textcolor='yellow', barcolor='yellow') +
                  geom_hilight(node= c(51,49,46), fill = 'yellow') +
                    geom_cladelab(node=67, label="South East", align=TRUE, 
                  offset = .006, textcolor='blue', barcolor='blue', angle = 90) +
                  geom_hilight(node=67, fill = 'blue')

ggsave('../../Results/RefG1_annotated.pdf')

