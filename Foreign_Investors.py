import os

import datetime
import time
import csv
import numpy as np
import requests
import pandas as pd
from dateutil.relativedelta import relativedelta

from crawler import CsvCrawler
class ForeignInvestor(CsvCrawler):
    def __init__(self, time, path):
        super().__init__(time, path)
        self.url = 'https://www.twse.com.tw/fund/TWT38U?response=csv&date=' + time.strftime('%Y%m%d')
        self.filename = 'Foreign_Investor'
        print(self.url)
    def processing(self):
        line = self.data
        print(line)
        self.data = data
        self.header = header
if __name__ == '__main__':
    # file_path = 'C:\\Users\\grand\\github\\crawler'
    file_path = 'C:\\Users\\ouchu\\github\\crawler'
    last_month = datetime.date.today() - relativedelta(months=2)
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today 
    crawler = ForeignInvestor(yesterday, file_path)
    crawler.download_to_csv()


def crawl():
    from airflow.configuration import get_airflow_home
    file_path = os.path.join(get_airflow_home(), 'data', 'output', 'opendata')
    crawler = Option()
    crawler.main(file_path)
