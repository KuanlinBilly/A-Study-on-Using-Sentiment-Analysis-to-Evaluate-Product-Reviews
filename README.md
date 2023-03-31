# A-Study-on-Using-Sentiment-Analysis-to-Evaluate-Product-Reviews   
This project focuses on leveraging sentiment analysis to evaluate product reviews, using Amazon e-commerce as an example. For more detailed information and code, refer to the [PDF file](https://github.com/KuanlinBilly/A-Study-on-Using-Sentiment-Analysis-to-Evaluate-Product-Reviews/blob/main/A%20Study%20on%20Using%20Sentiment%20Analysis%20to%20Evaluate%20Product%20Reviews%20%E2%80%94Take%20Amazon%20E-commerce%20as%20an%20example.pdf) included in this repository.

## Overview
By extracting and analyzing Amazon customer reviews data, this project employs techniques such as LDA Topic Modeling and Sentiment Analysis to uncover potential areas for marketing improvement. The insights gained aim to provide businesses with a roadmap to optimize marketing strategies and enhance their competitive edge.

This project offers a valuable resource for companies seeking to stay ahead in the marketing landscape by expertly blending data analysis with real-world business applications.

## About dataset:
The dataset used in this project consists of customer reviews for basketball shoes on Amazon.

<div align=center>
<img src="https://github.com/KuanlinBilly/A-Study-on-Using-Sentiment-Analysis-to-Evaluate-Product-Reviews/blob/main/img-folder/shoes.jpg">
</div>

## Methodology 
The R & Python languages are used for text mining, collecting, and processing basketball shoe purchase comments. LDA topic analysis in R and the TextBlob package in Python are applied for topic and sentiment analysis. The analysis results help identify consumer emotions, corresponding topics of positive and negative comments, and provide feasible recommendations.

## Steps

<div align=center>
<img src="https://github.com/KuanlinBilly/A-Study-on-Using-Sentiment-Analysis-to-Evaluate-Product-Reviews/blob/main/img-folder/Process.jpg">
</div>

1. Web Crawler environment setup
* Use Docker and Splash to set up the crawler environment.
    * Splash: Handles dynamic web pages rendered by JavaScript for network crawling.
    * Docker: Builds and runs Splash.

2. Data Collection
* Target: Basketball shoe product reviews.
* Steps:
    1. Load the specified website's HTML structure using the Requests library in Python, which allows for sending HTTP requests to fetch the web page content.
    2. Use BeautifulSoup, a Python library for parsing HTML and XML documents, to navigate and search through the website's HTML structure. It's essential to observe the website's structure and changes before starting the crawl to ensure accurate data extraction.
    3. Save the crawled results as an XLSX format file for further analysis and processing. This format is suitable for organizing structured data and can be easily imported into various data analysis tools.

3. Exploratory Data Analysis (EDA)

4. Text Cleansing
* Python part
    Utilize string and nltk packages to process text for sentiment analysis with TextBlob.
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
* Use TextBlob to return sentiment analysis results as (polarity, subjectivity) tuples.
* Sentiment categories: Positive, Negative, Neutral


## Conclusion
### Outcome
1. Efficient data retrieval using Python and crawling techniques for data acquisition.

2. Text cleansing of product reviews.
3. LDA Topic Modeling in R, to identify positive and negative sentiments and provide recommendations.   
 
4. Sentiment analysis performed on product reviews using Python, with visualized results.

### Future Outlook and Improvement Suggestions
1. Enhance the text cleansing process, such as customizing the stop words library according to e-commerce review data.

2. Apply and compare various sentiment classification models and machine learning algorithms to determine their effectiveness.

3. Optimize the number of topics in the LDA model for improved results.

4. Address the issue of ineffective topic differentiation in the LDA analysis by optimizing the number of topics or changing the target of analysis due to similarities in review data content for the current target.

5. Expand the sentiment analysis, including more emotions, such as joy, anger, sorrow, and happiness.
