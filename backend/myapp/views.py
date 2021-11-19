from django.core.checks.messages import Error
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.views.decorators.http import require_GET, require_POST

from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.shortcuts import render, redirect
from myapp.models import Investor, Company, Strategy, Deal, RSI, KD, MACD, EMA
import pandas as pd
import numpy as np


@api_view(['POST'])
def signup(request):
    if request.method == 'POST':
        try:
            iname_ = request.data['iname']
            acct_no_ = request.data['acct_no']
            pwd_ = request.data['pwd']
            phone_ = request.data['phone']
        except KeyError:
            return Response("4 parameters are all required.(iname,acct_no,pwd,phone)", status=status.HTTP_400_BAD_REQUEST)
        
        if acct_no_ in [element[0] for element in list(Investor.objects.values_list('acct_no'))]:
            return Response("Account already existed, try another one.", status=status.HTTP_400_BAD_REQUEST)
 
        new_investor = Investor(iname=iname_, acct_no=acct_no_, pwd=pwd_, phone=phone_)
        if list(Investor.objects.values_list('iid').order_by('iid')) != []:
            new_investor.iid = list(Investor.objects.values_list('iid').order_by('iid'))[-1][0] + 1
        else:
            new_investor.iid = 1

        new_investor.save()
        return Response("Successfully signed up.", status=status.HTTP_200_OK)

now_login_iid = -1
@api_view(['POST'])
def login_request(request):
    global now_login_iid
    if request.method == 'POST':
        try:
            acct_no_ = request.data['acct_no']
            pwd_ = request.data['pwd']
        except KeyError:
            return Response("2 parameters are all required.(acct_no,pwd)", status=status.HTTP_400_BAD_REQUEST)
        
        if acct_no_ not in [element[0] for element in list(Investor.objects.values_list('acct_no'))]:
            return Response("Invalid account.", status=status.HTTP_400_BAD_REQUEST)

        login_investor = Investor.objects.get(acct_no=acct_no_)

        if pwd_ != login_investor.pwd:
            return Response("Invalid password.", status=status.HTTP_400_BAD_REQUEST)

        now_login_iid = login_investor.iid
        return Response(login_investor.iname + "successfully logged in.", status=status.HTTP_200_OK)


@api_view(['POST'])
def stockinformation(request):
    if 'application/json' not in request.content_type:
        return Response("Content type should be 'application/json'.", status=status.HTTP_400_BAD_REQUEST)
    
    if request.method == 'POST':
        try:
            informationid = request.data['cname']
        except KeyError:
            return Response("1 parameter is required.(cname)", status=status.HTTP_400_BAD_REQUEST)

        unit = Company.objects.get(cname = informationid)
        result = []
        data = {}
        data['cid'] = unit.cid
        data['cname'] = unit.cname
        data['cowner'] = unit.cowner
        data['cyield'] = unit.cyield
        data['pe_ratio'] = unit.pe_ratio
        data['industry_type'] = unit.industry_type
        result.append(data)

        return Response(result, status=status.HTTP_200_OK)


@api_view(['GET'])
def seestrategy(request):
    if request.method == 'GET':
        if now_login_iid <= 0:
            return Response("Not logged in.", status=status.HTTP_400_BAD_REQUEST)

        result = []
        for unit in Strategy.objects.values().filter(creator_id = now_login_iid):
            data = {}
            data['sid'] = unit.sid
            data['budget'] = unit.budget
            data['creator_id'] = unit.creator_id
            data['strategy_type'] = unit.strategy_type
            result.append(data)

        return Response(result, status=status.HTTP_200_OK)


@require_POST
def rsi_create(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Length = request.POST.get('Length')
        Threshold = request.POST.get('Threshold')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')
        Budget = request.POST.get('Budget')

        strategy = Strategy(budget=Budget, creator_id=Creator_id, strategy_type='R')
        strategy.save
        Sid = Strategy.objects.latest('Sid')
        rsi = RSI(sid=Sid, company_id=Company_id, length=Length, threshold=Threshold, profit=Profit, loss=Loss)
        rsi.save()
        return render(request, 'rsi_create.html', locals())

@require_POST
def macd_create(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Fast_line = request.POST.get('Fast_line')
        Slow_line = request.POST.get('Slow_line')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')
        Budget = request.POST.get('Budget')

        strategy = Strategy(budget=Budget, creator_id=Creator_id, strategy_type='M')
        strategy.save
        Sid = Strategy.objects.latest('Sid')
        macd = MACD(sid=Sid, company_id=Company_id, fast=Fast_line, slow=Slow_line, profit=Profit, loss=Loss)
        macd.save()
        return render(request, 'macd_create.html', locals())

@require_POST
def Kd_create(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Length = request.POST.get('Length')
        Threshold = request.POST.get('Threshold')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')
        Budget = request.POST.get('Budget')

        strategy = Strategy(budget=Budget, creator_id=Creator_id, strategy_type='K')
        strategy.save
        kd = KD(sid=Sid, company_id=Company_id, fast=Fast_line, slow=Slow_line, profit=Profit, loss=Loss)
        kd.save()
        return render(request, 'kd_create.html', locals())

@require_POST
def Ema_create(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Fast_line = request.POST.get('Fast_line')
        Slow_line = request.POST.get('Slow_line')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')
        Budget = request.POST.get('Budget')

        strategy = Strategy(budget=Budget, creator_id=Creator_id, strategy_type='E')
        strategy.save
        Sid = Strategy.objects.latest('Sid')
        ema = EMA(sid=Sid, company_id=Company_id, fast=Fast_line, slow=Slow_line, profit=Profit, loss=Loss)
        ema.save()
        return render(request, 'ema_create.html', locals())


def test(sig, Open):
    rets = []
    stock = 0
    buy_price = 0
    sell_price = 0

    for i in range(len(sig)):
        if sig[i] == 1:
            buy_price = Open[sig.index[i+1]]
            stock += 1
        elif sig[i] == -1:
            sell_price = Open[sig.index[i+1]]
            stock -= 1
            rets.append((sell_price-buy_price)/buy_price)
            buy_price = 0
            sell_price = 0

    total_ret = 1
    for ret in rets:
        total_ret *= 1 + ret
    print(str(round((total_ret - 1)*100,2)) + '%')



@require_POST
def back_test_rsi(request):
    if request.method == "POST":
        Company_id = request.POST.get('Company_id')
        period = request.POST.get('Length')
        Threshold = request.POST.get('Threshold')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')

        deal = pd.DataFrame(list(Deal.objects.filter(company_id=Company_id).order_by('ddate').values(close_price, open_price)))
        Close = deal['close_price'].squeeze()
        Open = deal['open_price'].squeeze()

        Chg = Close - Close.shift(1)
        Chg_pos = pd.Series(index=Chg.index, data=Chg[Chg>0])
        Chg_pos = Chg_pos.fillna(0)
        Chg_neg = pd.Series(index=Chg.index, data=-Chg[Chg<0])
        Chg_neg = Chg_neg.fillna(0)
        
        up_mean = []
        down_mean = []
        for i in range(period+1, len(Chg_pos)+1):
            up_mean.append(np.mean(Chg_pos.values[i-period:i]))
            down_mean.append(np.mean(Chg_neg.values[i-period:i]))
        
        rsi = []
        for i in range(len(up_mean)):
            rsi.append( 100 * up_mean[i] / ( up_mean[i] + down_mean[i] ) )
        rsi_series = pd.Series(index = Close.index[period:], data = rsi)

        sig = []

        stock = 0

        for i in range(len(rsi_series)):
            if rsi_series[i] > (100-Threshold) and stock == 1:
                stock -= 1
                sig.append(-1)
            elif rsi_series[i] < Threshold and stock == 0:
                stock += 1
                sig.append(1)
            else:
                sig.append(0)
        rsi_sig = pd.Series(index = rsi_series.index, data = sig)

        score = test(rsi_sig, Open)

    return render(request, 'back_test_rsi.html', locals())

@require_POST
def back_test_kd(request):
    if request.method == "POST":
        Company_id = request.POST.get('Company_id')
        period = request.POST.get('Length')
        Threshold = request.POST.get('Threshold')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')

        deal = pd.DataFrame(list(Deal.objects.filter(company_id=Company_id).order_by('ddate').values()))
        Close = deal['close_price'].squeeze()
        Open = deal['open_price'].squeeze()
        High = deal['high'].squeeze()
        Low = deal['low'].squeeze()

        rsv_h = High.rolling(period, min_periods=period).max()
        rsv_h = rsv_h.fillna(0)
        rsv_l = Low.rolling(period, min_periods=period).min()
        rsv_l = rsv_l.fillna(0)
        
        rsv = (Close-rsv_l)/(rsv_h-rsv_l)*100
    
        k = [50]
        d = [50]
        
        for i in range(period-1, len(rsv)):
            k_t = k[-1]*2/3 + rsv[i]/3
            k.append(k_t)
            d_t = k_t/3 + d[-1]*2/3
            d.append(k[-1]/3 + d[-1]*2/3)

        sig = []

        stock = 0

        for i in range(len(d)):
            if d[i] > (100-Threshold) and stock == 1:
                stock -= 1
                sig.append(-1)
            elif d[i] < Threshold and stock == 0:
                stock += 1
                sig.append(1)
            else:
                sig.append(0)
        kd_sig = pd.Series(index = d.index, data = sig)

        score = test(kd_sig, Open)

    return render(request, 'back_test_kd.html', locals())

@require_POST
def back_test_macd(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Fast_line = request.POST.get('Fast_line')
        Slow_line = request.POST.get('Slow_line')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')

        deal = pd.DataFrame(list(Deal.objects.filter(company_id=Company_id).order_by('ddate').values(close_price, open_price)))
        Close = deal['close_price'].squeeze()
        Open = deal['open_price'].squeeze()

        ema_1 = Close.ewm(span=12, adjust=False).mean()
        ema_2 = Close.ewm(span=26, adjust=False).mean()
        f = ema_1 - ema_2
        macd = f.ewm(span=9, adjust=False).mean()
        
        macd_series = f - macd

        sig = []

        stock = 0

        for i in range(len(macd_series)):
            if macd_series[i] > 0 and stock == 1:
                stock -= 1
                sig.append(-1)
            elif macd_series[i] < 0 and stock == 0:
                stock += 1
                sig.append(1)
            else:
                sig.append(0)
        macd_sig = pd.Series(index = macd_series.index, data = sig)

        score = test(macd_sig, Open)

    return render(request, 'back_test_macd.html', locals())

@require_POST
def back_test_ema(request):
    if request.method == "POST":
        Creator_id = request.POST.get('Creator_id')
        Company_id = request.POST.get('Company_id')
        Fast_line = request.POST.get('Fast_line')
        Slow_line = request.POST.get('Slow_line')
        Profit = request.POST.get('Profit')
        Loss = request.POST.get('Loss')

        deal = pd.DataFrame(list(Deal.objects.filter(company_id=Company_id).order_by('ddate').values(close_price, open_price)))
        Close = deal['close_price'].squeeze()
        Open = deal['open_price'].squeeze()

        ema_1 = Close.ewm(span=12, adjust=False).mean()
        ema_2 = Close.ewm(span=26, adjust=False).mean()
        f = ema_1 - ema_2

        sig = []

        stock = 0

        for i in range(len(f)):
            if f[i] > 0 and stock == 1:
                stock -= 1
                sig.append(-1)
            elif f[i] < 0 and stock == 0:
                stock += 1
                sig.append(1)
            else:
                sig.append(0)
        ema_sig = pd.Series(index = f.index, data = sig)

        score = test(ema_sig, Open)

    return render(request, 'back_test_macd.html', locals())

