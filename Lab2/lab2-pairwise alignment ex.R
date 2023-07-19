source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)
sequence1 <- "GAATTCGGCTA"
sequence2 <- "GATTACCTA"
myScoringMat <- nucleotideSubstitutionMatrix(match = 1, mismatch = -1, 
                                             baseOnly = TRUE)
myScoringMat
gapOpen <- 2
gapExtend <- 1
myAlignment <- pairwiseAlignment(sequence1, sequence2,
                                 substitutionMatrix = myScoringMat, gapOpening = gapOpen,
                                 gapExtension = gapExtend, type="global", scoreOnly = FALSE)
myAlignment
data(package="Biostrings")
#Data sets in package 'Biostring':
data(BLOSUM62)
subMat <- "BLOSUM62"
sequence1 <- "PAWHEAE"
sequence2 <- "HEAGAWGHE"
myAlignProt <- pairwiseAlignment(sequence1, sequence2,
                                   substitutionMatrix = subMat, gapOpening = gapOpen, gapExtension =
                                     gapExtend, type="global", scoreOnly = FALSE)
myAlignProt
myAlignProt <- pairwiseAlignment(sequence1, sequence2,
                                   substitutionMatrix = subMat, gapOpening = gapOpen, gapExtension =
                                     gapExtend, type="local",scoreOnly = FALSE)
show(myAlignProt)
biocLite ("seqinr")
library(seqinr)
myseq <- read.fasta(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/myFasta.fasta")
dotPlot(myseq[[1]], myseq[[2]], col=c("white", "red"), xlab="Human",
          ylab="Chimpanzee")
human <- myseq[[1]]
chimp <- myseq[[2]]
human_seqString <- c2s (human)

chimp_seqString <- c2s(chimp)
human_seqString <- toupper( human_seqString )
chimp_seqString <- toupper(chimp_seqString)
globalAlign <- pairwiseAlignment(human_seqString, chimp_seqString,
                                 substitutionMatrix = "BLOSUM62", gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
globalAlign

source ("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/printPairwiseAlignment.R")
printPairwiseAlignment(globalAlign, 60)

source("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab2/sequencePermutatioTest.R")
pvalue <- permutest.seq(seq1=sequence1, seq2=sequence2, n=100)
pvalue <- permutest.seq(seq1=sequence1, seq2=sequence2, n=1000, plot=TRUE)
pvalue


