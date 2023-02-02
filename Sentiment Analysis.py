#情緒分析 ( Python )
#情緒分析 
from textblob import TextBlob
import matplotlib.pyplot as plt
import re
def getSubjectivity(text):
    return TextBlob(text).sentiment.subjectivity
def getPolarity(text):
    return TextBlob(text).sentiment.polarity
# creat two columns 
df_clean = pd.DataFrame(df_clean)
df_clean = df_clean.rename(columns={0:'body'})
df_clean['Subjectivity'] = df_clean['body'].apply(getSubjectivity)
df_clean['Polarity'] =df_clean['body'].apply(getPolarity)

#情緒分類function
def getAnalysis(score):
    if score <0:
        return 'Negative'
    elif score==0:
        return 'Neutral'
    else:
        return 'Positive'
df_clean['Analysis'] = df_clean['Polarity'].apply(getAnalysis)
df_clean.head()

# list out all of the positive reviews(研究專案報告這裡就先不印出來，很占篇幅)
j = 1 
sortedDF = df_clean.sort_values(by=['Polarity'])
for i in range(0,sortedDF.shape[0]):
    if(sortedDF['Analysis'][i] == 'Positive'):
       # print(str(j) + ')' + sortedDF['body'][i])
        #print()
        j = j+1
        
#Negative
j = 1
sortedDF = df_clean.sort_values(by = ['Polarity'],ascending = False)
for i in range(0,sortedDF.shape[0]):
    if(sortedDF['Analysis'][i] == 'Negative'):
        #print(str(j) + ')' + sortedDF['body'][i])
       # print()
        j = j+1

#資料視覺化 Data Visulization

#plot the polarity and subjectivity
plt.figure(figsize=(8,6))
for i in range(0,df_clean.shape[0]):
    plt.scatter(df_clean['Polarity'][i],df_clean['Subjectivity'][i],color='blue') 
plt.title('Sentiment Analysis')
plt.xlabel('Polarity')
plt.ylabel('Subjectivity')
plt.grid()
plt.show()

# Get the percentage of positive reviews
rPositive_reviews = df_clean[df_clean.Analysis =='Positive']
rPositive_reviews = rPositive_reviews['body']

round((rPositive_reviews.shape[0]/df_clean.shape[0])*100,1)
## 73.9
rPositive = round((rPositive_reviews.shape[0]/df_clean.shape[0])*100,1)

# Get the percentage of negative reviews
rNegative_reviews = df_clean[df_clean.Analysis =='Negative']
rNegative_reviews = rNegative_reviews['body']

round((rNegative_reviews.shape[0]/df_clean.shape[0])*100,1)

rNegative = round((rNegative_reviews.shape[0]/df_clean.shape[0])*100,1)

# Get the percentage of Neutral reviews
rNeutral_reviews = df_clean[df_clean.Analysis =='Neutral']
rNeutral_reviews = rNeutral_reviews['body']

round((rNeutral_reviews.shape[0]/df_clean.shape[0])*100,1)

rNeutral = round((rNeutral_reviews.shape[0]/df_clean.shape[0])*100,1)

#rPositive+rNegative+rNeutral

#Show the value counts
df_clean['Analysis'].value_counts()

# plot and visualize the counts
plt.title('Sentiment Analysis')
plt.xlabel('Sentiment')
plt.ylabel('Counts')
my_colors = list('gyr')
df_clean['Analysis'].value_counts().plot(kind='bar',color=my_colors)
plt.show()

