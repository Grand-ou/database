import sys
import requests
import datetime
from crawler import CrawlerBase 
from dateutil.relativedelta import relativedelta
requests.session()

ata = requests.get(url)