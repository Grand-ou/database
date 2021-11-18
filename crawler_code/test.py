import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd
import os
import sys
import time
import datetime
from dateutil.relativedelta import relativedelta
from matplotlib import pyplot as plt
import pandas as pd


plt.rcParams["figure.dpi"] = 120
sys.path.append('C:\\Users\\ouchu\\github\\securities_od')
sys.path.append('C:\\Users\\ouchu\\github\\securities_od\\securities')
# print(sys.path)
from securities.credit_transaction_crawler import CreditTransaction
from securities.securities_firm_crawler import SecuritiesFirm
from securities.firm_transaction_crawler import FirmTransaction
from securities.entrust_month_crawler import EntrustMonth
file_path = 'C:\\Users\\ouchu\\github\\crawler'
last_month = datetime.date.today() - relativedelta(months=2)

def show_credit_transaction(title, ylabel, index):
    scrap = CreditTransaction(last_month, file_path)
    credit_stat = pd.DataFrame(scrap.get_stat())
    credit_stat = credit_stat.iloc[::-1]
    credit_stat[index] = credit_stat[index].str.replace('%', '')
    credit_stat[index] = credit_stat[index].astype('float')
    print(credit_stat[index])
    plt.plot(credit_stat[0], credit_stat[index],color="black")
    plt.xticks(credit_stat[0], rotation='vertical', fontsize=10)

    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=True,      # ticks along the bottom edge are off
        top=False)         # ticks along the top edge are off

    plt.subplots_adjust(bottom=0.1)
    plt.xlabel('Year-month')
    plt.ylabel(ylabel)
    plt.title('Line Chart for '+ title)
    plt.show()
    
def show_entrust_month(year, index, name):
    last_month = datetime.date.today() - relativedelta(months=2)
    xlabel = 'Year-month'
    ylabel = 'Amount (billion NT)'
    scrap = EntrustMonth(last_month, file_path)

    stat = scrap.get_stat()
    for i in range(year):
        time.sleep(1)
        last_month -= relativedelta(months=last_month.month)
        scrap = EntrustMonth(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
        print(stat)
    stat[7] = stat[3] + stat[4] + stat[5] + stat[6] 
    # print(stat['date'], stat[index])
    esun = stat[stat[2] == '玉山']
    esun.reset_index(inplace=True)
    al = stat[stat[2] != '玉山']
    al.reset_index(inplace=True)
    esun.drop(columns=['index'], inplace = True)
    al.drop(columns=['index'], inplace = True)
    # print(esun)
    # print(al)
    rate = esun.iloc[:,3:].div(al.iloc[:,3:],axis=0)*100
    # print(rate)
    rate = esun
    # rate[0] = esun[0]
    plt.plot(rate[0], rate[index],color="black")
    plt.xticks(rate[0], rotation='vertical', fontsize=10)

    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=False,      # ticks along the bottom edge are off
        top=False)         # ticks along the top edge are off

    plt.subplots_adjust(bottom=0.1)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title('Line Chart for '+ name)
    plt.show()
    
def show_securities_firm(month, index):

    last_month = datetime.date.today() - relativedelta(months=1)
    xlabel = 'Year-month'
    ylabel = 'Amount (NYD)'
    scrap = SecuritiesFirm(last_month, file_path)
    stat = scrap.get_stat()
    for i in range(month):
        time.sleep(1)
        last_month -= relativedelta(months=1)
        scrap = SecuritiesFirm(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
    stat[index] = stat[index].astype('float')
    # print(stat['date'], stat[index])
    plt.plot(stat['date'], stat[index],color="black")
    plt.xticks(stat['date'], rotation='vertical', fontsize=4)

    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=False,      # ticks along the bottom edge are off
        top=False)         # ticks along the top edge are off

    plt.subplots_adjust(bottom=0.1)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title('Line Chart for short selling')
    plt.show()

def show_firm_transaction(month, index):
    last_month = datetime.date.today() - relativedelta(months=1)
    xlabel = 'Year-month'
    ylabel = 'Amount (NYD)'
    scrap = FirmTransaction(last_month, file_path)
    stat = scrap.get_stat()
    for i in range(month):
        time.sleep(1)
        last_month -= relativedelta(months=1)
        scrap = FirmTransaction(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
    print(stat)
    pd.set_option('display.float_format', lambda x: '%.3f' % x)
    # stat[index] = stat[index].astype('float')
    stat = stat[stat[1] == '8840']
    # print(stat['date'], stat[index])
    plt.plot(stat[0], stat[index],color="black")
    plt.xticks(stat[0], rotation='vertical', fontsize=7)

    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=False,      # ticks along the bottom edge are off
        top=False)         # ticks along the top edge are off

    plt.subplots_adjust(bottom=0.1)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title('Line Chart for trading amount')
    plt.show()

# show_securities_firm(4, 3)


# show_firm_transaction(5, 3)
# show_credit_transaction('margin trading', '%', 4)
# show_credit_transaction('short selling', '%', 6)
# show_entrust_month(1, 4, 'General professional investors')
# show_entrust_month(1, 3, 'Non-professional investors')
# show_entrust_month(1, 6, 'Professional Institutional Investor')
# show_entrust_month(1, 7, 'Total entrust foreign securities')
app = dash.Dash()
server = app.server
df = pd.read_csv('C:\\Users\\ouchu\\database\\crawler_data\\daily_deal_output.csv')
print(df)
def get_show_scatter():
    sctx = df['Date']
    df['TAIEX'] = df['TAIEX'].str.replace(',', '')
    scty = df['TAIEX'].astype('float')
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name='活跃用户'
    )
    layout=go.Layout(
        title='活跃用户信息',
        yaxis={
            'hoverformat': '' #如果想显示小数点后两位'.2f'，显示百分比'.2%'
        }
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

app.layout = html.Div([
    dcc.Graph(
        id='show_scatter',
        figure=get_show_scatter()
    ),
], style={'margin': 100})

if __name__ == '__main__':
    app.run_server(debug=True)