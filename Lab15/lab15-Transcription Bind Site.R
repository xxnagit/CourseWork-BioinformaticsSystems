source("http://bioconductor.org/biocLite.R")
biocLite(c("MotifDb", "GenomicFeatures",
             "TxDb.Scerevisiae.UCSC.sacCer3.sgdGene",
             "org.Sc.sgd.db", "BSgenome.Scerevisiae.UCSC.sacCer3",
             "motifStack", "seqLogo"))
library(MotifDb)
library(seqLogo)
library(motifStack)
library(Biostrings)
library(GenomicFeatures)
library(org.Sc.sgd.db)
library(BSgenome.Scerevisiae.UCSC.sacCer3)


library(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene)
query(MotifDb, "DAL80")
pfm.dal80.jaspar <- query(MotifDb,"DAL80")[[1]]
seqLogo(pfm.dal80.jaspar)
pfm.dal80.scertf <- query(MotifDb,"DAL80")[[3]]
seqLogo(pfm.dal80.scertf)
dal1 <- "YIR027C"
chromosomal.loc <-
  transcriptsBy(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene, by="gene") [dal1]
promoter.dal1 <-
  getPromoterSeq(chromosomal.loc, Scerevisiae, upstream=1000, downstream=0)
pcm.dal80.jaspar <- round(100 * pfm.dal80.jaspar)
pcm.dal80.jaspar
matchPWM(pcm.dal80.jaspar, unlist(promoter.dal1)[[1]], "90%")
dal80.jaspar2014 <- query(MotifDb,"DAL80")[[1]]
dal80.jasparCORE <- query(MotifDb,"DAL80")[[2]]
dal80.scertf <-query(MotifDb,"DAL80")[[3]]
seqLogo(dal80.jaspar2014)
seqLogo(dal80.jasparCORE)
seqLogo(dal80.scertf)

pfm.dal80.jaspar2014 <- new("pfm", mat=query(MotifDb, "dal80")[[1]],
                            name="DAL80-JASPAR2014")
pfm.dal80.jasparCORE <- new("pfm", mat=query(MotifDb, "dal80")[[2]],
                            name="DAL80-JASPARCORE")
pfm.dal80.scertf <- new("pfm", mat=query(MotifDb, "dal80")[[3]],
                        name="DAL80-ScerTF")
pfm.dal80.jaspar2016 <- new("pfm", mat=query(MotifDb, "dal80")[[4]],
                            name="DAL80-JASPAR2016")
pfm.dal80.jaspar2018 <- new("pfm", mat=query(MotifDb, "dal80")[[5]],
                            name="DAL80-JASPAR2018")

plotMotifLogoStack(DNAmotifAlignment(c(pfm.dal80.jaspar2014,pfm.dal80.jasparCORE, pfm.dal80.scertf, pfm.dal80.jaspar2016, pfm.dal80.jaspar2018)))


