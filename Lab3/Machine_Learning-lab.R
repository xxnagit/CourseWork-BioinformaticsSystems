
######################################################
###Basic Machine learning



######################################################
###Data - iris
######################################################
data(iris)

dim(iris)

head(iris)

colnames(iris)

#the number of each species
table(iris$Species)

#plot Petal.length and Petal.width
plot(iris$Petal.Length, iris$Petal.Width, pch=23, bg=c("red","darkgreen","blue")[unclass(iris$Species)], main="Anderson's Iris Data") 
legend ('topleft', c('setosa', 'versicolor', 'virginica'), pch = rep(18,3), col = c("red","darkgreen","blue"), cex = 1.5)

boxplot(iris[,-5], col = c("red","green","blue","yellow"))

pairs(iris[1:4], main = "Edgar Anderson's Iris Data", pch = 23, bg = c("red", "darkgreen", "blue")[unclass(iris$Species)])



######################################################
###K-means clustering
###kmeans()
######################################################
mat = iris[, -5]

head(mat)

types = iris[, 5]

types

# set the seed to ensure reproducibility
set.seed(20)

#kmeans is a function, 3 clusters are expected
kmOut <- kmeans(mat[,3:4], 3, iter.max = 20)

summary(kmOut)

kmOut

kmOut$centers

kmOut$cluster

table(kmOut$cluster, iris$Species)

kmOut$cluster <- as.factor(kmOut$cluster)
install.packages("ggplot2")
library("ggplot2")
ggplot(iris, aes(Petal.Length, Petal.Width, color = kmOut$cluster)) + geom_point()

######################################################
###Hierarchical clusters
###hclust()
######################################################
iris.feature = as.matrix(iris[,-5])

rownames(iris.feature) = iris[,5]
iris.feature
hc <- hclust(dist(iris.feature), "ave")

plot(hc, hang = -1)

#The dist() function
?dist
install.packages("gplots")
library("gplots")
heatmap.2(iris.feature,RowSideColors=c(rep("green",50), rep("red",50), rep("blue",50)),
          Colv=F,Rowv=T, key = 1, cexCol = 1.5, margin = c(3, 12), cexRow = 0.2,
          trace = 'none',key.xlab = "", density = 'none', ylab = "", labCol = T) 



######################################################
###Linear regression
###Correlation, cor()
######################################################
setosa = iris[iris$Species == "setosa",]

plot(setosa$Sepal.Length, setosa$Sepal.Width, pch = 20, cex.lab = 1.5, main = "COR")

lines(c(4,6),c(2,4.5))

#cor(), calculate the correlation
cor = cor(setosa$Sepal.Length, setosa$Sepal.Width)

#add a text at x = 5.5, y = 2.6
label = paste("cor = ", cor, sep = "")

text(5.5,2.6, labels = label, cex = 1.5)

#test the correlation, P-value
cor = cor(setosa$Sepal.Length, setosa$Sepal.Width)

cor

cor = cor.test(setosa$Sepal.Length, setosa$Sepal.Width)

cor

cor$p.value

###use different methods
#"pearson", "kendall", "spearman", pearson is the default method
cor(setosa$Sepal.Length, setosa$Sepal.Width, method = "pearson")

#use kendall method
cor(setosa$Sepal.Length, setosa$Sepal.Width, method = "kendall")

#use spearman method
cor(setosa$Sepal.Length, setosa$Sepal.Width, method = "spearman")



######################################################
###Linear regression
###lm()
######################################################
setosa = iris[iris$Species == "setosa",]

#exclude the first row
train = setosa[-1,]

#the test data are the first row
test = setosa[1,]

#independent variable
x = train$Sepal.Width 

#dependent variable
y = train$Sepal.Length 

#formula
lm.Sepal <- lm(y ~ x) 

summary(lm.Sepal)

#predict y of test data
pred = data.frame(x = test$Sepal.Width)

predicted = predict(lm.Sepal, pred, interval = "prediction",level = 0.95)

trueVale = test$Sepal.Length

cat("test Sepal.Length = ", trueVale, ", ", "predicted = ", predicted[1,1])



######################################################
###Support vector machine
###R package "e1071"
######################################################
source("http://bioconductor.org/biocLite.R")
biocLite("e1071")
library (e1071)

#please modify the path of the file in your machine         
geneExp <- read.csv("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab3/R_script_data_machineLeaning/Lung_Cancer_patients.csv")

dim(geneExp)

#show the first 5 columns
head(geneExp[,1:5])

trainSet <- geneExp[c(1:30,57:86),]

dim(trainSet)

#exclude the first column 
testSet <- geneExp[c(31:56,87:112),-1] 

dim(testSet)

head(testSet[,1:5])

#fit a model using the trainning data
#x is the data matrix for learning, y is the label vector indicating the types of the samples
install.packages("e1071")
library("e1071")
model <- svm(x = trainSet[,-1], y = trainSet[,1], kernel = "linear", scale = TRUE, type = "C-classification")

#the class and summary of the SVM model
class(model)

summary(model)

#10-fold cross-validation
model <- svm(trainSet[,-1], trainSet[,1], kernel = "linear",scale = TRUE, type = "C-classification", cross = 10)

#see the help of svm, other options of kernel
?svm 

summary(model)

#predict the testing data
dim(testSet)

head(testSet[,1:5])

preds <- predict(model, testSet)

preds

#the accuracy 
testLabel = geneExp[c(31:56,87:112),1]

acc = sum(preds == testLabel) / length(preds)

print(acc)

cat("Testing accuracy: ", acc * 100, "%\n", sep = "")

table(predict = preds, true = testLabel)

#the weight vector w
w = t(model$coefs) %*% model$SV

w[,1:6]

#the order of the features (genes)
order(abs(w), decreasing = TRUE)

head(colnames(testSet)[order(abs(w), decreasing = TRUE)])

head(w[order(abs(w), decreasing = TRUE)])

#use the top 6 genes a features
top6Features = head(order(abs(w), decreasing = TRUE))

model.2 = svm(trainSet[,top6Features], trainSet[,1], kernel = "linear",scale = TRUE, type = "C-classification")

preds.2 = predict(model.2, testSet[,top6Features])

result = table(predict = preds.2, true = testLabel)

result

acc = sum(preds.2 == testLabel) / length(preds.2)

acc

######################################################
#measure the performance
######################################################

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

###plot the ROC
#install the R package
install.packages ('ROCR')
library(ROCR)

model.3 = svm(trainSet[,top6Features], trainSet[,1], kernel = "linear",scale = TRUE, type = "C-classification",decision.values = TRUE)

preds.3 = predict(model.3, testSet[,top6Features], decision.values = TRUE)

#usually, we use +1 to label positive samples (normal), 0/-1 as nagetive (tumor)
svm.roc <- prediction(attributes(preds.3)$decision.values, c(rep(1,26),rep(-1,26)))

svm.auc <- performance(svm.roc, "tpr","fpr" )

plot(svm.auc)
