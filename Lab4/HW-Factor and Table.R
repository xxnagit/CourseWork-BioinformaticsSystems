#Q1
con <- file("CreateFile.txt", "w")
cat("Create a text [2] Read the text and determine which words
were in the text, and then output a list giving the words and their
    locations within the text.", file=con)
close(con)
wordList <- scan("CreateFile.txt", what = " ")
class(wordList)
len <- length(wordList)
index <- c(1:len)
wordList <- gsub("[\\.]","", wordList)
wordList <- gsub("[\\,]","", wordList)
wordList # reomove all punctuations
words <- cbind(index, wordList) # combine all the words and position indexes into a table
words
split(1:len, wordList) # combine the position indexes of the same word
#Q2
attach(iris)
colnames(iris, do.NULL = TRUE, prefix = "col")
#speciesSum <- tapply(iris[,1],iris$Species,length)
#speciesSum[2]
#spSetosa <- iris[iris$Species == "setosa",]
#spSetosaMean <- apply(data.matrix(spSetosa),2,mean)
#spSetosaMean$Species = setosa
sepalLen <- tapply(iris$Sepal.Length, list(iris$Species), mean)
sepalWid <- tapply(iris$Sepal.Width, list(iris$Species), mean)
petalLen <- tapply(iris$Petal.Length, list(iris$Species), mean)
petalWid <- tapply(iris$Petal.Width, list(iris$Species), mean)
re1 <- cbind(c(sepalLen, sepalWid, petalLen, petalWid))
library(stringr)
numextract <- function(string){ 
  str_extract(string, "\\-*\\d+\\.*\\d*")
}
numextract(re1)
result <- matrix(re1, nrow = 3)
rownames(result) <- c("setosa", "versicolor", "virginica")
colnames(result) <- c("Sepal.Length.mean", "Sepal.Width.mean",
                      "Petal.Length.mean", "Petal.Width.mean")
result



