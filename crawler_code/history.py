import datetime
import time
from dateutil.relativedelta import relativedelta
from daily_deal_crawler import DailyDeal
from Foreign_Investors import ForeignInvestor
from stock_info import StockInfo
from stock_ratio import StockRatio
today = datetime.date.today()  - relativedelta(years=1)
<<<<<<< HEAD
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
=======
<<<<<<< HEAD
file_path = 'C:\\Users\\ASUS\\Downloads\\1101_NTUIM_DBM_web_tutorial-master\\1101_NTUIM_DBM_web_tutorial-master\\database\\crawler_data'

# dags_list = [
#     ['daily_deal', DailyDeal(today, file_path).download_to_csv],
#     ['Foreign_Investors', ForeignInvestor(today, file_path).download_to_csv],
#     ['stock_info', StockInfo(today, file_path).download_to_csv],
#     ['stock_ratio', StockRatio(today, file_path).download_to_csv]
# ]

for j in range(365):
    today = today + relativedelta(days=1)
    if today.weekday() >= 5:
        continue
    # DailyDeal(today, file_path).download_to_csv()
    ForeignInvestor(today, file_path).download_to_csv()
    # StockInfo(today, file_xpath).download_to_csv()
    # StockRatio(today, file_path).download_to_csv()
    time.sleep(1)
=======
file_path = 'C:\\Users\\ouchu\\database\\crawler_data'
# file_path = 'C:\\Users\\grand\\database\\crawler_data'

dags_list = [
    ['daily_deal', DailyDeal(today, file_path).download_to_csv],
    ['Foreign_Investors', ForeignInvestor(today, file_path).download_to_csv],
    ['stock_info', StockInfo(today, file_path).download_to_csv],
    ['stock_ratio', StockRatio(today, file_path).download_to_csv]
]
for i in dags_list:
    for j in range(365):
        today = today + relativedelta(days=1)
        if today.weekday() >= 5:
            continue
        DailyDeal(today, file_path).download_to_csv()
        # ForeignInvestor(today, file_path).download_to_csv()
        # StockInfo(today, file_path).download_to_csv()
        # StockRatio(today, file_path).download_to_csv()
        time.sleep(1)
>>>>>>> 032333f92b85a1438927ae07f91c6f2791e6fe4a
>>>>>>> 53051139031497281ef6d42dfba4df1e19ceed94
