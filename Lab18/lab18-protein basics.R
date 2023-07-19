install.packages("protr")
install.packages("bio3d")
library(bio3d)
library(protr)
pdb1 <- read.pdb("1BG2")
s1 <- aa321(pdb1$seqres)
s1 <- paste(s1, sep="",collapse="")
install.packages("seqinr")
library(seqinr)
s1 <- c2s(s1)
extractAAC(s1)
pdb <- read.pdb("1BG2")
class(pdb)
attributes(pdb)
head(pdb)
head(pdb$atom[, c("x","y","z")])
head(pdb$atom[pdb$calpha, c("resid", "elety", "x","y","z")])
aa321(pdb$seqres)
write.pdb(pdb, file="myPDBfile.pdb")
read.pdb("myPDBfile.pdb")
pdb <- read.pdb("1BG2")
tor <- torsion.pdb(pdb)
plot(tor$phi, tor$psi, main="(A) Ramachandran plot 1BG2")
scatter_psi <- tor$psi
scatter_phi <- tor$phi
library(RColorBrewer) # load RColourBrewer package
k <- 10 # define number of colours
my.cols <- rev(brewer.pal(k, "RdYlBu")) # Brew color pallette
smoothScatter(x=scatter_phi, y=scatter_psi,
              colramp=colorRampPalette(my.cols), xlim=c(-180,180), ylim=c(-180,180),xlab="Phi", 
              ylab="Psi", main="(B) Ramachandran plot 1BG2", pch=19, cex=0.00)







