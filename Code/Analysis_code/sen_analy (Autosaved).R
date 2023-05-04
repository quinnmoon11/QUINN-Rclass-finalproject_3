
require(ape)
require(ggtree)
require(treeio)
require(tidyverse)
library(patchwork)

#read in the nexus files 
phy_v1 <- read.nexus(file = '../../Data/Raw_data/sen_v1.tre', tree.names = NULL, force.multi = FALSE)
phy_v2 <- read.nexus(file = '../../Data/Raw_data/sen_v2.tre', tree.names = NULL, force.multi = FALSE)


#root both trees
phy2_v1 <- root(phy_v1, outgroup = "arizonae_OCGR6220", edgelabel = TRUE)
phy2_v2 <- root(phy_v2, outgroup = "arizonae_OCGR6220", edgelabel = TRUE)

#add + geom_text(aes(label=node)) to see the internal node numbers
#add node labels
p <- ggtree(phy2_v1) + geom_tiplab(offset = .0014, align = TRUE) #+ geom_text(aes(label=node))

#color both highlight and vertical bar, the IN/MI clade
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

jpeg(file = "../../Results/sen_analy.jpeg", width=15, height=7)
sen_v1 + sen_v2 + plot_annotation(tag_levels="A")
dev.off()
pe