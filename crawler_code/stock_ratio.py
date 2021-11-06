
import datetime
import pandas as pd
from crawler import CrawlerBase, get_csvdata
from dateutil.relativedelta import relativedelta
# file_path = 'C:\\Users\\grand\\github\\crawler'
file_path = 'C:\\Users\\ouchu\\database\\crawler_data'


class StockRatio(CrawlerBase):
    def __init__(self, time, path):
        super().__init__(time, path)
        self.url = 'https://www.twse.com.tw/exchangeReport/BWIBBU_d?response=csv&date=' + \
            time.strftime('%Y%m%d') + '&selectType=ALL'
        self.filename = 'stock_ratio'
        print(self.url)

    def get_data(self):
        self.data = get_csvdata(self.url)

    def processing(self):
        line = self.data
        line.pop(0)
        line.pop(0)
        line.pop(-1)
        line.pop(-1)
        line.pop(-1)
        line = pd.DataFrame(line)
        print(line)
        header = ['date', 'securities_code', 'securities_name',
                  'dividend_year', 'P/E_ratio', 'Fiscal_year_quarter']
        line.drop(columns=[3, 5], inplace=True)
        line.insert(0, '0', self.time.strftime('%Y-%m-%d'))
        line = line.values.tolist()
        # print(line)
        self.data = line

        self.header = header


if __name__ == '__main__':
    last_month = datetime.date.today() - relativedelta(months=2)
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday
    crawler = StockRatio(yesterday, file_path)
    crawler.download_to_csv()
