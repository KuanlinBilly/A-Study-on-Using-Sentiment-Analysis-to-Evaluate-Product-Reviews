rm(list=ls())
library(tidyverse)  
library(tidytext)  
library(topicmodels) # LDA topic modelling 
library(tm)  
library(SnowballC)  
library(readxl)
library(dplyr)
library(tm)
library(NLP)

#Corpus
release_corpus <- Corpus(VectorSource(dataset$Text))
#inspect(release_corpus)

#delete numbers and punctuation
library(stringr)
release_corpus <- tm_map(release_corpus, removeNumbers)
release_corpus <- tm_map(release_corpus, removePunctuation)

#remove stop words
release_corpus <- tm_map(release_corpus, removeWords, words=stopwords("en"))

#character to lower
release_corpus <- tm_map(release_corpus, content_transformer(tolower))

#stemming
library(SnowballC)
release_corpus <- tm_map(release_corpus,stemDocument) # this function is to transform the plural words

#remove other unnecessary words 
rmwords <- c("they","this","just","even","these","will","dont","much","amazon","amazoncom","give","first",
             "also","think","make","now","want","still","never","lot","got","thought","sure",
             "without","whenever","unlike","somehow","yes","tend","today","the","have","day","not","but")
release_corpus <- tm_map(release_corpus, removeWords, words=rmwords)

tdm <- TermDocumentMatrix(release_corpus)
#tdm

#sparse terms
tdm <- removeSparseTerms(tdm,1-(10/length(release_corpus))) #term-document matrix
 
inspect(tdm[1:20, 1:5])

tdm1=(as.matrix(tdm))
#dim(tdm1)

freq_tdm <- rowSums(tdm1)
sort_tdm <- sort(freq_tdm, decreasing = TRUE) #frequency of words
#sort_tdm 
summary(sort_tdm)
