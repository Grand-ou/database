import datetime
import time
from dateutil.relativedelta import relativedelta
from daily_deal_crawler import DailyDeal
from Foreign_Investors import ForeignInvestor
from stock_info import StockInfo
from stock_ratio import StockRatio
today = datetime.date.today()  - relativedelta(years=1)
this_year = datetime.datetime(datetime.date.today().year, 10, 17)
file_path = 'C:\\Users\\ouchu\\database\\crawler_data'
# file_path = 'C:\\Users\\grand\\database\\crawler_data'


today = this_year
for j in range(365):
    today = today + relativedelta(days=1)
    if today.weekday() >= 5:
        continue
    # DailyDeal(today, file_path).download_to_csv()
    # ForeignInvestor(today, file_path).download_to_csv()
    StockInfo(today, file_path).download_to_csv()
    # StockRatio(today, file_path).download_to_csv()
    time.sleep(1)
