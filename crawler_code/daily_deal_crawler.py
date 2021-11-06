
import datetime
from crawler import CrawlerBase , get_csvdata
from dateutil.relativedelta import relativedelta
# file_path = 'C:\\Users\\grand\\github\\crawler'
file_path = 'C:\\Users\\ouchu\\database\\crawler_data'

class DailyDeal(CrawlerBase):
    def __init__(self, time, path):
        super().__init__(time, path)
        self.url = 'https://www.twse.com.tw/en/exchangeReport/FMTQIK?response=csv&date=' + time.strftime('%Y%m%d')
        self.filename = 'daily_deal'
    def get_data(self):
        self.data = get_csvdata(self.url)
    def  processing(self):
        parsed_csv = self.data
        for i in range(1, len(parsed_csv)-4):
            parsed_csv[i][0] = parsed_csv[i][0].replace('/', '-')

        parsed_csv.pop(0)
        parsed_csv.pop()
        parsed_csv.pop()
        parsed_csv.pop()
        parsed_csv.pop()
        self.header = parsed_csv[0]
        parsed_csv.pop(0)
        self.data = parsed_csv


if __name__ == '__main__':
    last_month = datetime.date.today() - relativedelta(months=2)
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday 
    crawler = DailyDeal(yesterday, file_path)
    crawler.download_to_csv()


