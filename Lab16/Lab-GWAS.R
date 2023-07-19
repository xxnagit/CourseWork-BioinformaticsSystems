install.packages("SNPassoc")# A package for association studies
library(SNPassoc)
data(SNPs)
head(SNPs)
head(SNPs.info.pos)
dim(SNPs)
mySNP <- setupSNP(SNPs, 6:40, sep="")
myres <- association(casco~sex+snp10001+blood.pre, data = mySNP, 
                     model.interaction = c("dominant","codominant"))
myres
myres5th <- association(casco~sex+snp10005+blood.pre, data = mySNP, 
                     model.interaction = c("dominant","codominant"))
myres5th