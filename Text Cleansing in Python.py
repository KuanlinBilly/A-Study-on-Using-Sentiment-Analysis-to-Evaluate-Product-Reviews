# 文字清理(Python) 
# Text Cleansing(Python)

from nltk.corpus import stopwords
from nltk import wordpunct_tokenize
from nltk.stem import WordNetLemmatizer
import string
import nltk
nltk.download('stopwords')
nltk.download('wordnet')

#string和nltk進行文字處理
def clean_review(review_text, *arg):
    allwords = list()
    for sentence in review_text:
        punct_token = wordpunct_tokenize(sentence)
        
        #remove stopwords
        stops = set(stopwords.words("english"))
        stops.update({'br'})
        punct_token = [word for word in punct_token if word not in 
        stops]
        #remove string.punctuation
        punct_token = [word for word in punct_token if word not in 
        string.punctuation]
        #remove word that is not alphabat or number
        punct_token = [word for word in punct_token if 
        word.isalnum()==True]
        #lower words
        punct_token = [word.lower() for word in punct_token ]
        #stem words
        punct_token = [WordNetLemmatizer().lemmatize(word) for word in 
        punct_token]
        allwords.append(' '.join(punct_token))
    return allwords

 

