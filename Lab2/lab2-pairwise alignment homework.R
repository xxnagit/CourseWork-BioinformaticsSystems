#Q1
source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)
data(package="Biostrings")
biocLite ("seqinr")
library(seqinr)
#Data sets in package 'Biostring':
data(BLOSUM62)
seq1 <- read.fasta(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/E1FTG0.fasta")
seq2 <- read.fasta(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/A8PZ80.fasta")
seq1_s <- c2s(seq1[[1]])
seq2_s <- c2s(seq2[[1]])
seq1_s <- toupper(seq1_s)
seq2_s <- toupper(seq2_s)
gapOpen <- 10
gapExtend <- 0.5
subMat <- "BLOSUM62"
globalAlign_62 <- pairwiseAlignment(seq1_s, seq2_s,
                                 substitutionMatrix = subMat, gapOpening = 10, 
                                 gapExtension = 0.5, type = "global", scoreOnly = FALSE)
globalAlign_62
source("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/sequencePermutatioTest.R")
pvalue <- permutest.seq(seq1=seq1_s, seq2=seq2_s, subMat = "BLOSUM62", n=100)
pvalue <- permutest.seq(seq1=seq1_s, seq2=seq2_s, subMat = "BLOSUM62", n=1000, plot=TRUE)
pvalue
#Q2
subMat <- "BLOSUM50"
globalAlign_50 <- pairwiseAlignment(seq1_s, seq2_s,
                                 substitutionMatrix = subMat, gapOpening = 10, 
                                 gapExtension = 0.5, scoreOnly = FALSE)
globalAlign_50
pvalue <- permutest.seq(seq1_s, seq2_s, subMat = "BLOSUM50", n=100)
pvalue <- permutest.seq(seq1_s, seq2_s, subMat = "BLOSUM50", n=1000, plot=TRUE)
pvalue
#Q3
source ("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/printPairwiseAlignment.R")
printPairwiseAlignment(globalAlign_62, 60)



