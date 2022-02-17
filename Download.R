ncbi_ids <- c("HQ433692.1", "HQ433694.1", "HQ433691.1")
#put these three characters into a dataframe we will call "ncbi_ids"
library(rentrez)
#load the package "rentrez"
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
#entrez_fetch downloads data from the NCBI database, db is the name of the database to use, id is telling it what to pull from the NCBI data base since the dataframe containes accession and version numbers
Bburg
Bburg <-gsub(".*1 *([GATC])","\\1",paste(Bburg))
Bburg<-gsub(".*ORIGIN +","",paste(Bburg,collapse=""))
#currently only one obs, containes 3 sequences of 16S gene of Borrelia burgdoferi
Sequences<-strsplit(Bburg, "Borrelia burgdorferi", fixed = TRUE)
print(Sequences)
#Splitting into 3 sequences 
header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
gsub("[\n]", "", Sequences)
#removing newline character
write.csv(Sequences, file = '/Users/LaurynJoslin/Desktop/Rentrez/Sequences.csv')
#writing the Sequences.csv csv

