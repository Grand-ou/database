
import datetime
import pandas as pd
from crawler import CrawlerBase ,get_jsondata
from dateutil.relativedelta import relativedelta
file_path = 'C:\\Users\\grand\\database\\crawler_data'
# file_path = 'C:\\Users\\ouchu\\database\\crawler_data'

class StockInfo(CrawlerBase):
    def __init__(self, time, path):
        super().__init__(time, path)
        self.sheet = 'aaData'
        self.url = 'https://www.tpex.org.tw/web/stock/aftertrading/otc_quotes_no1430/stk_wn1430_result.php?l=zh-tw&d=' + str(time.year - 1911) + time.strftime('/%m/%d') + '&se=AL&_=1636002804352'
        self.filename = 'stock_info'
        print(self.url)
    def get_data(self):
        self.data = get_jsondata(self.url, self.sheet)
    def  processing(self):
        line = self.data
        header = ['date', 'securities_code', 'securities_name', 'close', 'open', 'high', 'low', 'trade_volumn']
        line.drop(columns=[3, 7, 8, 10, 11, 12, 13, 14, 15, 16], inplace = True)
        line.insert(0, '0', self.time.strftime('%Y-%m-%d'))
        line=line.values.tolist()
        
        # print(line)
        self.data = line

        self.header = header

if __name__ == '__main__':
    last_month = datetime.date.today() - relativedelta(months=2)
    today = datetime.date.today()
    oneday = datetime.timedelta(days=2)
    yesterday = today - oneday 
    crawler = StockInfo(yesterday, file_path)
    crawler.download_to_csv()


