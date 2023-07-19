#Q1
train <- read.table('/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab3/breast-cancer_svm_train.txt', sep = '\t', header = T)
test <- read.table('/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab3/breast-cancer_svm_test.txt', sep = '\t', header = T)
#dim(train)
hc <- hclust(dist(test), "ave")
plot(hc, hang = -1)
#Q2
library("gplots")
#using Hierarchical clusters species#
#hc <- hclust(dist(train), "ave")
#clusterCut <- cutree(hc, 2)
#table(clusterCut)
#clusterCutMatrix <- as.matrix(table(clusterCut))
#clusterCutMatrix 
##Convert Dataframe to Numetric Matix###
#trainMatrix <- data.matrix(train)
#head(trainMatrix[1:5,1:5])

trainSetMatrix <- as.matrix(train)
trainSetHeatmap <- trainSetMatrix[,-10]
sumM = sum(trainSetMatrix[,10] == "Malignant")
sumM 
sumB = sum(trainSetMatrix[,10] == "Benign")
sumB
trainSetHeatmap <- apply(trainSetHeatmap, c(1,2), function(x) return(as.numeric(x)))
pdf('figure_heatmap_cancerTrain.pdf', height = 18, width = 10, family = 'Helvetica')
heatmap.2(trainSetHeatmap, RowSideColors=c(rep("red",sumM), rep("blue",sumB)),
          dendrogram="row", trace = 'none', key =1)
dev.off()
#Q3
library("e1071")
modelS <- svm(x = trainSetHeatmap, y = trainSetMatrix[,10], kernel = "linear", 
                cost = 100, scale = TRUE, type = "C-classification")
#the class and summary of the SVM model
class(modelS)
summary(modelS)
preds <- predict(modelS, test[,-10])
preds
testLabel <- test[,10]
result = table(predict = preds, true = testLabel)
result
#tumor is positive 
#true positive
TN = result[1,1]
#true negative
TP = result[2,2]
#false positive
FP = result[2,1]
#false negative
FN = result[1,2]
sensitivity = TP / (TP + FN)
sensitivity
specificity = TN / (TN + FP)
specificity
acc = (TP + TN) / (TP + TN + FP + FN)
acc

