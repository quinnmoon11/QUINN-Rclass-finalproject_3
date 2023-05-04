load .tre files
display bootstrap values
rotate into N->S
Annotate regions

Plot together with labels
 

require(ape)
require(ggtree)
require(treeio)
require(tidyverse)
library(patchwork)

phy_v1 <- read.nexus(file = '../../Data/Raw_data/sen_v1.tre', tree.names = NULL, force.multi = FALSE)
phy_v2 <- read.nexus(file = '../../Data/Raw_data/sen_v2.tre', tree.names = NULL, force.multi = FALSE)



phy2_v1 <- root(phy_v1, outgroup = "arizonae_OCGR6220", edgelabel = TRUE)
phy2_v2 <- root(phy_v2, outgroup = "arizonae_OCGR6220", edgelabel = TRUE)

#add + geom_text(aes(label=node)) to see the internal node numbers
p <- ggtree(phy2_v1) + geom_tiplab(offset = .0014, align = TRUE) #+ geom_text(aes(label=node))


sen_v1 <- p +   geom_cladelab(node=66, label="MI/IN", align=TRUE, 
                  offset = .006, textcolor='maroon', barcolor='maroon', angle = 90) +
                  geom_hilight(node=66, fill = 'maroon')
             
q <- ggtree(phy2_v2) + geom_tiplab(offset = .0014, align = TRUE) #+ geom_text(aes(label=node))


sen_v2 <- q +   geom_cladelab(node=46, label="MI/IN", align=TRUE, 
                  offset = .006, textcolor='maroon', barcolor='maroon', angle = 90) +
                  geom_hilight(node=46, fill = 'maroon')


pdf(file = "../../Results/sen_analy.pdf", width=15, height=7)
sen_v1 + sen_v2 + plot_annotation(tag_levels="A")
dev.off()

