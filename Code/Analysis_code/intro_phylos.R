#install.packages("ape")
#install.packages("phangorn")
#install.packages("phytools")
#install.packages("geiger")

require("ape")
require("phangorn")
require("phytools")
require("geiger")



#Simple phylo for native population (sister to Indiana)
pdf(file = "../../Results/intro_phylo_nat.pdf")
text.string <- "((Indiana, Michigan), Southern_Ancestral_Population);"
vert.tree<-read.tree(text=text.string)
rt.4<-rotate(vert.tree,4)
plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)
dev.off()

#Simple phylo for introduced population (sister to Missouri)
pdf(file = "../../Results/intro_phylo_intro.pdf")
text.string <- "((Not_Indiana_-e.g._Missouri, Michigan),Southern_Ancestral_Population);"
vert.tree<-read.tree(text=text.string)
rt.4<-rotate(vert.tree,4)
plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)
dev.off()
