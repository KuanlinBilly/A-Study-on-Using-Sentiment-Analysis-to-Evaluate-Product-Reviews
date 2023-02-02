#LDA model
#LDA model using package
library(topicmodels)

# function to get & plot the most informative terms by a specificed number
# of topics, using LDA
top_terms_by_topic_LDA <- function(input_text, # columm from a dataframe
                                   plot = T, # return a plot? TRUE by defult
                                   number_of_topics = 4) # number of topics (4 by default)
{    
  # create a corpus and document term matrix
  Corpus <- Corpus(VectorSource(input_text)) # make a corpus object
  DTM <- DocumentTermMatrix(Corpus) # get the count of words/document
  
  # remove any empty rows in our document term matrix  
  unique_indexes <- unique(DTM$i) # get the index of each unique value
  DTM <- DTM[unique_indexes,]  
  
  # preform LDA & get the words/topic in a tidy text format
  lda <- LDA(DTM, k = number_of_topics, control = list(seed = 1234))
  topics <- tidy(lda, matrix = "beta")
  
  # get the top ten terms for each topic
  top_terms <- topics  %>%  
    group_by(topic) %>% # treat each topic as a different group
    top_n(10, beta) %>% # get the top 10 most informative words
    ungroup() %>%  
    arrange(topic, -beta)  
  
  # if the user asks for a plot (TRUE by default)
  if(plot == T){
    # plot the top ten terms for each topic in order
    top_terms %>% # take the top terms
      mutate(term = reorder(term, beta)) %>% # sort terms by beta value 
      ggplot(aes(term, beta, fill = factor(topic))) + # plot beta by theme
      geom_col(show.legend = FALSE) + # as a bar plot
      facet_wrap(~ topic, scales = "free") + # which each topic in a seperate plot
      labs(x = NULL, y = "Beta") +  
      coord_flip() # turn bars sideways
  }else{ 
    # if the user does not request a plot
    # return a list of sorted terms instead
    return(top_terms)
  }
}

# plot top ten terms in the Amazon product reviews by topic
top_terms_by_topic_LDA(release_corpus, number_of_topics = 4)

# 我們把評論分成正面與負面再分別做LDA主題分析
# We divide the reviews into positive and negative and then do LDA topic analysis respectively.

# 正面評倫 positive
#Corpus

data_posi <- subset(dataset,rating==4 | rating==5) # 正面評倫
release_corpus_posi <- Corpus(VectorSource(data_posi$Text))
#inspect(release_corpus_posi)

#delete numbers and punctuation

release_corpus_posi <- tm_map(release_corpus_posi, removeNumbers)
release_corpus_posi <- tm_map(release_corpus_posi, removePunctuation)

#remove stop words
release_corpus_posi <- tm_map(release_corpus_posi, removeWords, words=stopwords("en"))



#character to lower
release_corpus_posi <- tm_map(release_corpus_posi, content_transformer(tolower))

#stemming

release_corpus_posi <- tm_map(release_corpus_posi,stemDocument) 
# this function is to transform the plural words
release_corpus_posi <- tm_map(release_corpus_posi, removeWords, words=rmwords)

tdm <- TermDocumentMatrix(release_corpus_posi)
#tdm

#sparse terms
tdm <- removeSparseTerms(tdm,1-(10/length(release_corpus_posi))) #term-document matrix
#tdm

#inspect(tdm[1:20, 1:5])
tdm1=(as.matrix(tdm))
#dim(tdm1)

freq_tdm <- rowSums(tdm1)
sort_tdm <- sort(freq_tdm, decreasing = TRUE) #frequency of words
#sort_tdm 
summary(sort_tdm)
#plot it
top_terms_by_topic_LDA(release_corpus_posi, number_of_topics = 2)

# negative
# 負面評論
data_neg <- subset(dataset,rating==1 | rating==2) # 負面評論
#Corpus
release_corpus_neg <- Corpus(VectorSource(data_neg$Text))
#inspect(release_corpus_neg)

#delete numbers and punctuation

release_corpus_neg <- tm_map(release_corpus_neg, removeNumbers)
release_corpus_neg <- tm_map(release_corpus_neg, removePunctuation)

#remove stop words
release_corpus_neg <- tm_map(release_corpus_neg, removeWords, words=stopwords("en"))



#character to lower
release_corpus_neg <- tm_map(release_corpus_neg, content_transformer(tolower))

#stemming

release_corpus_neg <- tm_map(release_corpus_neg,stemDocument) 

release_corpus_neg <- tm_map(release_corpus_neg, removeWords, words=rmwords)

tdm <- TermDocumentMatrix(release_corpus_neg)
#tdm

#sparse terms
tdm <- removeSparseTerms(tdm,1-(10/length(release_corpus_neg))) #term-document matrix
#tdm

#inspect(tdm[1:20, 1:5])
tdm1=(as.matrix(tdm))
#dim(tdm1)

freq_tdm <- rowSums(tdm1)
sort_tdm <- sort(freq_tdm, decreasing = TRUE) #frequency of words
#sort_tdm 
summary(sort_tdm)

#plot it
top_terms_by_topic_LDA(release_corpus_neg, number_of_topics = 4)