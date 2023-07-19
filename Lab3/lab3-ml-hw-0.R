#Q1
geneExp <- read.csv("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab3/R_script_data_machineLeaning/Lung_Cancer_patients.csv")
dim(geneExp)
colnames(geneExp)
rownames(geneExp)
geneExp.feature = as.matrix(geneExp)
dim(geneExp.feature)

testSet <- geneExp[c(31:56,87:112),-1] 
dim(testSet)

hc <- hclust(dist(testSet), "ave")

plot(hc, hang = -1)
#Q2
trainSet <- geneExp[c(1:30,57:86),]
dim(trainSet)
hc <- hclust(dist(trainSet), "ave")
clusterCut <- cutree(hc, 2)
table(clusterCut)
clusterCutMatrix <- as.matrix(table(clusterCut))
clusterCutMatrix 
trainSetMatrix <- as.matrix(trainSet)
library("gplots")
trainSetHeatmap <- trainSetMatrix[,-1]
trainSetHeatmap <- apply(trainSetHeatmap, c(1,2), function(x) return(as.numeric(x)))
pdf('myfigure_heatmap.pdf', height = 18, width = 10, family = 'Helvetica')
heatmap.2(trainSetHeatmap, RowSideColors=c(rep("red",clusterCutMatrix[1]), rep("blue",clusterCutMatrix[2])),
          dendrogram="row", trace = 'none', key =1)
dev.off()
#heatmap.2(trainSetHeatmap, RowSideColors=c(rep("red",clusterCutMatrix[1]), rep("blue",clusterCutMatrix[2])),
#          Colv=F,Rowv=T, key = 1, cexCol = 1.5, margin = c(3, 12), cexRow = 0.2,
#          trace = 'none',key.xlab = "", density = 'none', ylab = "", labCol = T) 
#heatmap.2 https://earlglynn.github.io/RNotes/package/gplots/heatmap2.html
#Q3
library("e1071")
modelSvm <- svm(x = trainSetHeatmap, y = trainSetMatrix[,1], kernel = "linear", 
             cost = 100, scale = TRUE, type = "C-classification")

#the class and summary of the SVM model
class(modelSvm)
summary(modelSvm)
preds <- predict(modelSvm, testSet)
preds
testLabel = geneExp[c(31:56,87:112),1]
result = table(predict = preds, true = testLabel)
result


