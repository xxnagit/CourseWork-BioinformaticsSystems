setwd("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab11")
source("http://www.bioconductor.org/biocLite.R")
biocLite("edgeR")
load ("data/geneLevelCounts.rda")
load ("data/geneInfo.rda")
load ("data/laneInfo.rda")
class (geneLevelCounts)
dim(geneLevelCounts)
head(geneLevelCounts, 3)
head(geneInfo, 3)
laneInfo
means <- rowMeans(geneLevelCounts)
filter <- means >= 10
table(filter)
geneLevelCounts <- geneLevelCounts[filter,]
dim (geneLevelCounts)
library(RColorBrewer)
colors <- brewer.pal(9, "Set1")
totCounts <- colSums(geneLevelCounts)
barplot(totCounts, las=2, col=colors[laneInfo[,2]])
barplot(totCounts, las=2, col=colors[laneInfo[,4]])
boxplot(log2(geneLevelCounts+1), las=2, col=colors[laneInfo[,4]])
library(edgeR)
group <- laneInfo[9:14,2]
group <- droplevels(group)
counts <- geneLevelCounts[, 9:14]
cds <- DGEList( counts , group = group )
names(cds)
head(cds$counts, 3)
cds$samples
cds <- calcNormFactors(cds)
cds$samples
cds$samples$lib.size*cds$samples$norm.factors
cds <- calcNormFactors(cds, method="upperquartile")
cds$samples
cds <- estimateCommonDisp(cds)
names(cds)
cds$common.dispersion
sqrt(200) # poisson sd
sqrt(200 + 200^2 * cds$common.dispersion) # negative binomial
cds <- estimateTagwiseDisp(cds)
plotBCV(cds)
meanVarPlot <- plotMeanVar( cds ,show.raw.vars=TRUE ,
                            show.tagwise.vars=TRUE , show.binned.common.disp.vars=FALSE ,
                            show.ave.raw.vars=FALSE , dispersion.method = "qcml" , NBline = TRUE , nbins
                            = 100, pch = 16 , xlab ="Mean Expression (Log10 Scale)" , ylab = "Variance
                            (Log10 Scale)" , main = "Mean-Variance Plot" )

et <- exactTest(cds, pair=levels(group))
topTags(et) #extract top DE genes, ranked by P-value
top <- topTags(et, n=nrow(cds$counts))$table
de <- rownames(top[top$PValue<0.01,])
hist(top$PValue, breaks=20)
plotSmear(cds , de.tags=de)
abline(h=c(-2, 2), col="blue")
plot(top$logFC, -log10(top$PValue), pch=20, cex=.5, ylab="-log10(p-value)",
     xlab="logFC", col=as.numeric(rownames(top) %in% de)+1)
abline(v=c(-2, 2), col="blue")
write.table(top, file="Del_Gly_Comp.txt", sep='\t', quote=FALSE)