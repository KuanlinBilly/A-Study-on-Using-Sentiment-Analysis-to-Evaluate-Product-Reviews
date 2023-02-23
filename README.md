# A-Study-on-Using-Sentiment-Analysis-to-Evaluate-Product-Reviews   
For more detailed information and code, refer to the PDF file included in this repository.
## Problem Statement
This project focuses on evaluating marketing strategies by leveraging the power of data scraping and analysis.   

By extracting data from Amazon, the project conducts a comprehensive analysis using techniques such as LDA Topic Modeling and Sentiment Analysis to uncover potential areas of improvement in marketing efforts. The insights obtained from this project are designed to provide businesses with a roadmap for optimizing their marketing strategies and elevating their competitive edge.   

This project expertly blends data analysis with real-world business applications, offering a valuable resource for companies seeking to remain ahead in the marketing landscape. 

## About dataset:
This project utilizes customer reviews of a basketball shoes from Amazon as its dataset.

## Methodology 
This project uses the R & Python languages for text mining, collecting and processing the purchase comments of basketball shoes. The topic and sentiment analysis are conducted by applying LDA topic analysis in R and TextBlob package in Python. The analysis results are used to analyze the emotions of consumers who purchase the product, identify the corresponding topics of positive and negative comments, and provide feasible recommendations.

## Steps
1. Web Crawler environment setup
Use Docker and Splash to set up the crawler environment.
* Splash: Most web pages are dynamic and are rendered by Javascript. Therefore, it is not possible to directly use a Python package for network crawling. We need Splash to help us obtain the generated dynamic pages.
* Docker: Helps us build and run Splash.

2. Data Collection
* Target: Product reviews of a Basketball Shoes
* Steps:
    1. Load the specified website html structure with Requests
    2. Use BeautifulSoup for crawling (observe the changes of the website before starting to crawl)
    3. Save the crawling result as xlsx format

3. Exploratory Data Analysis (EDA)

4. Text Cleansing
* Python part
    This part mainly uses the string and nltk packages to process text, in preparation for using the TextBlob package for sentiment analysis.
    * Text data cleaning steps:
        1. Tokenize the sentences
        2. Delete repetitive and unimportant words
        3. Remove punctuation
        4. Remove some words that are not numbers or English
        5. Convert all words to lowercase
        6. Group words with similar meanings as the same word 
        7. Return the result
* R part
    The text processing concepts here are roughly the same as in Python. This step is to clean up the text data required for the LDA algorithm in the following steps.

5. Topic Analysis
* Method: Perform topic analysis using LDA (Latent Dirichlet Allocation) model.
LDA (Latent Dirichlet Allocation) is a document topic generation model. The term "generation model" means that we believe:
    * A document selects a certain topic with a certain probability.
    * The topic chooses a certain word with a certain probability.
    * Each document represents a probability distribution of some topics and each topic represents a probability distribution of many words.
    * Note: LDA does not assign any labels to each topic. They are just topics 1, 2, 3 and 4, etc.
    
6. Sentiment Analysis
* The result of sentiment analysis using the TextBlob package will be returned in the form of tuple (polarity, subjectivity).
* Sentiment categories: Positive, Negative, Neutral


## Conclusion
### Outcome
1. In the data acquisition aspect, this project utilized Python with crawling techniques to improve the efficiency of data retrieval.

2. The product reviews were cleaned through text cleansing.  
3. Using R, LDA Topic Modeling was performed to identify positive and negative sentiments of the reviews and feasible recommendations were made.   
 
4. Sentiment analysis was performed on the product reviews using Python and the results were visualized.

### Future Outlook and Improvement Suggestions
1. The text cleansing process can be made more sophisticated, for example, customizing the stop words library according to e-commerce review data.

2. More different sentiment classification models and machine learning algorithms can be applied and the effectiveness of each model can be compared.

3. The number of topics in the LDA model can be optimized for better results.

4. From the LDA topic analysis results, it was found that the difference between each topic was not very effective. I believe there are two solutions to this issue. First, the number of topics in the LDA model can be optimized for better results. Second, we can change the target of the analysis as the issue may be due to the similarities in the content of the review data for the current target.

5. More emotions can be added to the sentiment analysis, such as joy, anger, sorrow, and happiness.
