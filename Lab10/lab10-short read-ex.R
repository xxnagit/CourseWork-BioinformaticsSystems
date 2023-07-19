  setwd("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab10")
source("http://bioconductor.org/biocLite.R")
biocLite ("ShortRead")
library(ShortRead) #Load ShortRead package
fq <-readFastq("SRR031724_1_subset.fastq") #Read a FASTQ file
fq
head(sread(fq), 3)
head(quality(fq), 3)
head(id(fq), 3)
getClass("ShortReadQ")
showMethods(class="ShortRead", where=getNamespace("ShortRead"))
table(width(fq))
abc <-alphabetByCycle(sread(fq))
abc[1:4, 1:8]
#Ex1
sampler <-FastqSampler("SRR031724_1_subset.fastq", 1000)
reads = yield(sampler) # sample of 1000 reads
count <- alphabetByCycle(sread(reads))
ncount <- count[c("N"),]
length(ncount)
plot(1:37,ncount,cex=1.2,pch=15,xlab="Cycle",ylab="Count", ylim = c(0,10),col="red",
     main="\"N\" Count vs. Cycle")

#Ex2
head (quality (fq))
qual <- as(quality(fq), "matrix")
dim(qual)
cycleMeans <- colMeans(qual)
plot(1:37,cycleMeans,cex=1.2,pch=15,xlab="Cycle",ylab="Mean", ylim = c(30,40),col="red",
     main="Means vs. Cycle")
#Ex3
minQuality = 30 # minimum quality
firstBase = 1
minLength = 18 #minimum sequence length
qualMat<- as(quality(reads), "matrix")

qualList<-split(qualMat,row(qualMat))
ends <- lapply(qualList,function(x){which(x<minQuality)[1]-1}) 
ends <- as.integer(ends)
starts <- lapply(ends,function(x){min(x+1,firstBase)})
starts <- as.integer (starts)
newQ<-ShortReadQ(sread=subseq(sread(reads),start=starts,end=ends), quality=new(Class=class(quality(
  reads)),quality=subseq(quality(quality(reads)),start=starts,end=ends)),id=id(reads))
#apply minLength using srFilter
lengthCutoff <- srFilter(function(x) { width(x)>=minLength},name="length cutoff")
newQ[lengthCutoff(newQ)]
head (sread (newQ),3)
head (quality (newQ),3)

head(newQ, 3)