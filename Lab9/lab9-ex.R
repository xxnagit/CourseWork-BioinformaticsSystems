library(seqinr)
seqs <- read.fasta(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab9/fastaMSA.fasta", 
                                       seqtype = "DNA",as.string = TRUE, forceDNAtolower = FALSE)
#Q1
attributes(seqs)
myAlignment <- read.alignment(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab9/Clustal.phylip", format = "phylip")
class(myAlignment)
names(myAlignment)
myAlignment$seq
install.packages ("Biostrings")
library (Biostrings)
source ("/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab9/printMultipleAlignment.R")
printMultipleAlignment(myAlignment, 60)
#Q2
seqdist <- dist.alignment(myAlignment) # Calculate the genetic distances
seqdist
install.packages("ape")
library(ape)
myphylo <- triangMtd(seqdist)
plot(myphylo, type="phylogram", edge.color="red", cex=1, edge.width=1,main="(A) Phylogram")
plot(myphylo, type="cladogram", edge.color="red", cex=1, edge.width=1, main="(B) Cladogram")
plot(myphylo, type="fan", edge.color="red", cex=1, edge.width=1, main="(C) Fan")
plot(myphylo, type="unrooted", edge.color="red", cex=1, edge.width=1, main="(D) Unrooted")
#Q3
readf <- read.alignment(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/Lab9/result.fasta", format = "fasta")
fdist <- dist.alignment(readf) # Calculate the genetic distances
fdist
fphylo <- triangMtd(fdist)
plot(fphylo, type="phylogram", edge.color="red", cex=1, edge.width=1,main="(A) Phylogram")
