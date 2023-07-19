install.packages("ape")
install.packages("seqinr")
library(ape)
library(seqinr)
seq_1_DNAbin <- read.GenBank("JF806202")
attr(seq_1_DNAbin, "species")
seq_1_DNAbin$JF806202
seq_1_character <- read.GenBank("JB806202", as.character = TRUE)
lizards_accession_numbers <- c("JF806202", "HM161150", "FJ356743", "JF806205",
                               "JQ073190", "GU457971", "FJ356741", "JF806207",
                               "JF806210", "AY662592", "AY662591", "FJ356748",
                               "JN112660", "AY662594", "JN112661", "HQ876437",
                               "HQ876434", "AY662590", "FJ356740", "JF806214",
                               "JQ073188", "FJ356749", "JQ073189", "JF806216",
                               "AY662598", "JN112653", "JF806204", "FJ356747",
                               "FJ356744", "HQ876440", "JN112651", "JF806215",
                               "JF806209")
lizards_sequences <- read.GenBank(lizards_accession_numbers) 
#read sequences and place them in a DNAbin object
lizards_sequences #a brief summary of what is in the object, including base composition
str(lizards_sequences) #a list of the DNAbin elements with length of the sequences
#notice the one of the attributes is the species names
lizards_sequences_GenBank_IDs <- paste(attr(lizards_sequences, "species"), names
                                       (lizards_sequences), sep ="_RAG1_")
#build a character vector with the species, GenBank accession numbers, and gene name "_RAG1_ 
#this is its common abbreviation: recombination activating protein
write.dna(lizards_sequences, file ="lizard_fasta_1.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = "", colw = 10)
#nbcol: a numeric specifying the number of columns per row (6 by default)
#colsep: a character used to separate the columns (a single space by default)
#colw: a numeric specifying the number of nucleotides per column (10 by default).
#Read our fasta file using the seqinr package
lizard_seq_seqinr_format <- read.fasta(file = "/Users/machikara/Desktop/Application_2017fall/UALR Courses/BINF5445/Labs/lizard_fasta_1.fasta", 
                                       seqtype = "DNA",as.string = TRUE, forceDNAtolower = FALSE)
#Rewrite the fasta file using the name vector that was created previously
write.fasta(sequences = lizard_seq_seqinr_format, names = lizards_sequences_GenBank_IDs,
              nbchar = 10, file.out = "lizard_seq_seqinr_format.fasta")
#Q2
jellyfishAccessNos <- c("AAC53663", "AAA27722", "AAN41637", "AAK02062")
write(jellyfishAccessNos, file ="jellyfish_accessNo.txt")


