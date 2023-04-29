install.packages("ape")
install.packages("phangorn")
install.packages("phytools")
install.packages("geiger")

require("ape")
require("phangorn")
require("phytools")
require("geiger")

#make simple phylos
text.string <- "((Indiana, Michigan),Midwest);"

vert.tree<-read.tree(text=text.string)
 rt.4<-rotate(vert.tree,4)
 plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)


#power point files
text.string <- "((Indiana, Michigan), Southern_Ancestral_Population);"
vert.tree<-read.tree(text=text.string)
rt.4<-rotate(vert.tree,4)
plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)


text.string <- "((Population_Not_Indiana, Michigan),Southern_Ancestral_Population);"
vert.tree<-read.tree(text=text.string)
rt.4<-rotate(vert.tree,4)
plot(rt.4,no.margin=TRUE,edge.width=2, cex=2)
#now working on my tre files
sexlin.tree<-read.tree(file="RAxML_bipartitions.RefG1.tre")
plotTree(sexlin.tree,ftype="i",fsize=0.6,lwd=1)
plot(sexlin.tree)
rt.14<-rotate(sexlin.tree,14)
plot(rt.14)
