'''
步驟：
1.	Requests載入我們指定的網頁html結構 
2.	進行BeautifulSoup的爬取(開始爬取網站之前一定要觀察該網頁的變化)
3.	將爬蟲結果保存成 xlsx格式 
'''
import requests
from bs4 import BeautifulSoup
import pandas as pd
reviewlist = [] #存評論
# 爬網頁訊息function
def get_soup(url):
    r = requests.get('http://localhost:8050/render.html', params={'url': url, 'wait': 2}) #載入指定網頁的html結構
    soup = BeautifulSoup(r.text, 'html.parser')
    return soup

#抓評論function
def get_reviews(soup):
    reviews = soup.find_all('div', {'data-hook': 'review'})
    try:
        for item in reviews:
            review = {
            'product': soup.title.text.replace('Amazon.co.uk:Customer reviews:', '').strip(),
            'title': item.find('a', {'data-hook': 'review-title'}).text.strip(),
            'rating':  float(item.find('i', {'data-hook': 'review-star-rating'}).text.replace('out of 5 stars', '').strip()),
            'body': item.find('span', {'data-hook': 'review-body'}).text.strip(),
            }
            reviewlist.append(review)
    except: #例外處理
        pass
    
# 自動翻頁抓取評論 
for x in range(1,999):  
    soup = get_soup(f'https://www.amazon.com/PEAK-Basketball-Streetball-Breathable-Cushioning/product-reviews/B088LP6Y8J/ref=cm_cr_getr_d_paging_btm_prev_1?ie=UTF8&reviewerType=all_reviews&pageNumber={x}')
    print(f'Getting page: {x}') #x:頁數，隨翻頁變動
    get_reviews(soup)
    print(len(reviewlist))
    if not soup.find('li', {'class': 'a-disabled a-last'}): #翻到評論最後一頁會停止
        pass
    else:
        break

#將爬蟲結果保存成 xlsx格式
df = pd.DataFrame(reviewlist)
df.to_excel('scrape_text.xlsx', index=False)
print('Finish') #輸出檔案完成印Finish
