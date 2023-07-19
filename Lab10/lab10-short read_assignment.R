trimLowQualityBaseSeq <- function (shortRQ, minQuality, firstBase, minLength) {
  qualMat<- as(quality(shortRQ), "matrix")
  qualList<-split(qualMat,row(qualMat))
  ends <- lapply(qualList,function(x){which(x<minQuality)[1]-1}) 
  ends <- as.integer(ends)
  starts <- lapply(ends,function(x){min(x+1,firstBase)})
  starts <- as.integer (starts)
  newQ<-ShortReadQ(sread=subseq(sread(shortRQ),start=starts,end=ends), quality=new(Class=class(quality(
    shortRQ)),quality=subseq(quality(quality(shortRQ)),start=starts,end=ends)),id=id(shortRQ))
  lengthCutoff <- srFilter(function(x) { width(x)>=minLength},name="length cutoff")
  newQ[lengthCutoff(newQ)]
  return(newQ)
}
#trim <- trimLowQualityBaseSeq(reads, 30, 1, 18)
#head (sread (trim),3)
library(ShortRead) #Load ShortRead package
fq <-readFastq("SRR031724_1_subset.fastq") #Read a FASTQ file
newfq <- sample(fq, 10000)
newSet <- trimLowQualityBaseSeq(newfq, 20, 1, 30)
table(width(newSet))