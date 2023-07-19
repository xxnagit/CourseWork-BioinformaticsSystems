#Ex1
setwd("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab11")
library(edgeR)
load ("data/geneLevelCounts.rda")
load ("data/geneInfo.rda")
load ("data/laneInfo.rda")
laneInfo
group1 <- laneInfo[1:11,2]
group1 <- droplevels(group1)
counts1 <- geneLevelCounts[, 1:11]
cds1 <- DGEList( counts1 , group = group1 )
names(cds1)
head(cds1$counts1, 3)
cds1$samples
cds1 <- estimateCommonDisp(cds1)
cds1 <- estimateTagwiseDisp(cds1)
plotBCV(cds1)
et1 <- exactTest(cds1, pair=levels(group1))
topTags(et1)
top1 <- topTags(et1, n=nrow(cds1$counts1))$table
de1 <- rownames(top1[top1$PValue<0.01,])
hist(top1$PValue, breaks=20)
write.table(top1, file="YTD_Del_Comp.txt", sep='\t', quote=FALSE)
#Ex2
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

genes_inter <- de1[which(de1 %in% de)]
write.table(genes_inter, file="Genes_Intersection.txt", sep='\t', quote=FALSE)
