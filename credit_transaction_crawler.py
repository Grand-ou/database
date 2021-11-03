import datetime
import time
import os
import csv
import requests

import pandas as pd
from dateutil.relativedelta import relativedelta
from bs4 import BeautifulSoup

from crawler import JsonCrawler
last_month = datetime.date.today() - relativedelta(months=1)
def save_link(book_link, book_name):
    the_book = requests.get(book_link, stream=True)
    with open(book_name, 'wb') as f:
        for chunk in the_book.iter_content(1024 * 1024 * 2):  # 2 MB chunks
            f.write(chunk)


# file_path = 'C:\\Users\\grand\\github\\crawler'
file_path = 'C:\\Users\\ouchu\\github\\crawler'


class AfterHour(JsonCrawler):
    def __init__(self, time, path):
        super().__init__(time, path)
        self.url = 'https://www.twse.com.tw/exchangeReport/BFT41U?response=csv&date=20211027&selectType=ALL'
        self.filename = 'after_hour'

    def processing(self):
        
        line = self.data
        print(line)
        cnt = 0
        data = []
        for l in line:
            if cnt > 35:
                break
            elif len(l) == 0:
                continue
            
            if l[2].isdigit():
                cnt += 1
                row = l.split(' ')
                row = [x for x in row if x != '']
                row = [last_month.strftime('%Y-%m-%d')] + row

                if(cnt == 19):
                    row[3] = '合庫'
                if(cnt == 26):
                    row[3] = '土銀'
                if cnt == 34:
                    row.pop(4)
                    row.pop(4)
                    row[3] = '新百王'

                row.pop(9)
                row.pop(8)
                row.pop(7)
                row.pop(5)
                row.pop(1)
                data.append(row)
        self.data = data
        self.header = ['Date', 'Securities company code', 'Securities company name', 'Margin trading', 'Short selling']
if __name__ == '__main__':
    crawler = AfterHour(last_month, file_path)
    crawler.download_to_csv()


