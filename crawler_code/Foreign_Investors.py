import sys

import datetime
import pandas as pd
from crawler import CrawlerBase ,get_csvdata
from dateutil.relativedelta import relativedelta
# file_path = 'C:\\Users\\grand\\github\\crawler'
file_path = 'C:\\Users\\ouchu\\database\\crawler_data'

class ForeignInvestor(CrawlerBase):
    def __init__(self, time, path):
        super().__init__(time, path)
        
        self.url = 'https://www.twse.com.tw/fund/TWT38U?response=csv&date=' + time.strftime('%Y%m%d')
        self.filename = 'foreign_investor'
        print(self.url)
    def get_data(self):
        self.data = get_csvdata(self.url)
    def  processing(self):
        parsed_csv = self.data

        parsed_csv.pop(0)
        parsed_csv.pop(0)
        parsed_csv.pop(0)
        for i in range(8):
            parsed_csv.pop(-1)

        line = pd.DataFrame(parsed_csv)
        line.drop(columns=[0, 3, 4, 5, 6, 7, 8, 11], inplace=True)
        line.insert(0, '0', self.time.strftime('%Y-%m-%d'))
        print(line)
        self.data = line.values.tolist()
        self.header = ['date', 'securities_code', 'securities_name', 'buy', 'sell']

if __name__ == '__main__':
    last_month = datetime.date.today() - relativedelta(months=2)
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday 
    crawler = ForeignInvestor(yesterday, file_path)
    crawler.download_to_csv()


