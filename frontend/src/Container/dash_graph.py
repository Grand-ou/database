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

def show_credit_transaction(index, type, to_replace):
    scrap = CreditTransaction(last_month, file_path)
    credit_stat = pd.DataFrame(scrap.get_stat())
    credit_stat = credit_stat.iloc[::-1]
    credit_stat[index] = credit_stat[index].str.replace(to_replace, '')
    credit_stat[index] = credit_stat[index].astype(type)
    # print(credit_stat[index])
    return credit_stat[0], credit_stat[index]
    
def show_entrust_month(year, index, name):
    last_month = datetime.date.today() - relativedelta(months=2)
    scrap = EntrustMonth(last_month, file_path)

    stat = scrap.get_stat()
    for i in range(year):
        time.sleep(1)
        last_month -= relativedelta(months=last_month.month)
        scrap = EntrustMonth(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
        # print(stat)
    stat[7] = stat[3] + stat[4] + stat[5] + stat[6] 
    # print(stat['date'], stat[index])
    esun = stat[stat[2] == '玉山']
    esun.reset_index(inplace=True)
    al = stat[stat[2] != '玉山']
    al.reset_index(inplace=True)
    esun.drop(columns=['index'], inplace = True)
    al.drop(columns=['index'], inplace = True)
    rate = esun.iloc[:,3:].div(al.iloc[:,3:],axis=0)*100
    if name != '%':
        rate = esun
    rate[0] = esun[0]
    return rate[0], rate[index]
 
    
def show_securities_firm(month, index, type):

    last_month = datetime.date.today() - relativedelta(months=1)
    scrap = SecuritiesFirm(last_month, file_path)
    stat = scrap.get_stat()
    for i in range(month):
        time.sleep(1)
        last_month -= relativedelta(months=1)
        scrap = SecuritiesFirm(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
    # print(stat)
    # stat[4] = stat[4].str.replace('%', '')
    # stat[3] = stat[3].str.replace(',', '')
    # stat[index] = stat[index].astype(type)
    return stat['date'], stat[index]


def show_firm_transaction(month):
    last_month = datetime.date.today() - relativedelta(months=1)
    scrap = FirmTransaction(last_month, file_path)
    stat = scrap.get_stat()
    for i in range(month):
        time.sleep(1)
        last_month -= relativedelta(months=1)
        scrap = FirmTransaction(last_month, file_path)
        stat2 = scrap.get_stat()
        stat = pd.concat([stat2, stat],axis=0, ignore_index=True)
    # print(stat)
 

    return stat


app = dash.Dash()
server = app.server

def get_show_credit():
    sctx, scty = show_credit_transaction(4, 'float', '%')
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name='信用交易融資餘額占比'
    )
    layout=go.Layout(
        title='信用交易融資餘額占比',
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = '%'
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_credit2():
    sctx, scty = show_credit_transaction(3, 'int', ',')
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name='信用交易融資餘額'
    )
    layout=go.Layout(
        title='信用交易融資餘額',
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = 'amount(thousands NT)'
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_credit3():
    sctx, scty = show_credit_transaction(6, 'float', '%')
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name='信用交易融券餘額占比'
    )
    layout=go.Layout(
        title='信用交易融券餘額占比',
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = '%'
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_credit4():
    sctx, scty = show_credit_transaction(5, 'int', ',')
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name='信用交易融券餘額'
    )
    layout=go.Layout(
        title='信用交易融券餘額',
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = 'amount(NT)'
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_entrust(index, name, yaxis, type):
    sctx, scty = show_entrust_month(1, index, type)
    trace = go.Scatter(
        x=sctx,
        y=scty,
        name=name
    )
    layout=go.Layout(
        title=name,
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = yaxis
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_securities(index, name, yaxis, type):
    sctx, scty = show_securities_firm(22, index, type)

    trace = go.Scatter(
        x=sctx,
        y=scty,
        name=name
    )
    layout=go.Layout(
        title=name,
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = yaxis
    )
    return go.Figure(
        data = [trace],
        layout = layout
    )

def get_show_firm():
    data = []
    colors = ['aliceblue', 'antiquewhite', 'aqua', 'aquamarine', 'azure',
            'beige','bisque', 'black', 'blanchedalmond', 'blue',
            'blueviolet', 'brown', 'burlywood', 'cadetblue',
            'chartreuse', 'chocolate', 'coral', 'cornflowerblue',
            'cornsilk', 'crimson', 'cyan', 'darkblue', 'darkcyan',
            'darkgoldenrod', 'darkgray', 'darkgrey', 'darkgreen',
            'darkkhaki', 'darkmagenta', 'darkolivegreen', 'darkorange']
    stat = show_firm_transaction(20)
    groups = stat.groupby(by=2)
    print(groups)
    for group, df in groups:
        df = df.sort_values(by=[0])
    
        trace = go.Scatter(
            x=df[0],
            y=df[3],
            name=group,
            marker=dict(color=colors[len(data)])
            )
        data.append(trace)
    layout=go.Layout(
        title='證券商成交金額',
        yaxis={
            'hoverformat': '.2f' 
        },
        xaxis_title = 'Month Year',
        yaxis_title = 'Amount (NTD)'
    )
    return go.Figure(
        data = data,
        layout = layout
    )
app.layout = html.Div([
    # html.Div([
    #     dcc.Graph(
    #         id='show_credit',
    #         figure=get_show_credit()
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_credit2',
    #         figure=get_show_credit2()
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_credit3',
    #         figure=get_show_credit3()
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_credit4',
    #         figure=get_show_credit4()
    #     ),
    # ], style={'margin': 100}),
    # # enteust 
    # html.Div([
    #     dcc.Graph(
    #         id='show_entrust',
    #         figure=get_show_entrust(3, '非專業投資人委託買賣外國有價證券', 'Amount (NT)', '%  ')
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_entrust2',
    #         figure=get_show_entrust(4, '專業投資人委託買賣外國有價證券', 'Amount (NT)', '%  ')
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_entrust3',
    #         figure=get_show_entrust(3, '非專業投資人委託買賣外國有價證券占比', '%', '%')
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_entrust4',
    #         figure=get_show_entrust(4, '非專業投資人委託買賣外國有價證券占比', '%', '%')
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_securities1',
    #         figure=get_show_securities(3, '證券商成交金額', 'Amount (NT)', 'int')
    #     ),
    # ], style={'margin': 100}),
    # html.Div([
    #     dcc.Graph(
    #         id='show_securities2',
    #         figure=get_show_securities(4, '證券商成交金額占比', '%', 'float')
    #     ),
    # ], style={'margin': 100}),

    html.A("Link to external site", href='http://localhost:3000/index.html', target="_blank"),
    html.Div([
        dcc.Graph(
            id='show_firm',
            figure=get_show_firm()
        ),
    ], style={'margin': 100})
])

if __name__ == '__main__':
    app.run_server(debug=True)