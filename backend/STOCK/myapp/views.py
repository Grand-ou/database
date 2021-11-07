from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from myapp.models import Investor, Company, Strategy, Market, Deal, Foreign_inv


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleanedgit_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})
def stockinformation(request, informationid = none):
    unit = Company.objects.get(id = informationid)
    Cid = unit.Cid
    CName = unit.CName
    COwner = unit.COwner
    Report = unit.Report
    Industry_type = unit.Industry_type
    unit.save()

    return render(request, 'stockinformation.html', locals())
def Backtest(request):
    if request.method == 'POST':
        Company_id = request.POST['Company_id']
        Buy_indicator = request.POST['Buy_indicator']
        Buy_parameter = request.POST['BUY_parameter']
        Sell_indicator = request.POST['Sell_indicator']
        Sell_parameter = request.POST['Sell_parameter'] 
        Budget = request.POSt['Budget']##?
        unit = Strategy.objects.create(Company_id = Company_id, Buy_indicator = Buy_indicator, Sell_indicator = Sell_indicator, Sell_parameter = Sell_parameter ) 
        unit.save()
        
        ## 回測
        if Buy_indicator == 'RSI':
            BuyPriceset =  Deal.objects.filter(Company_id = Company_id , RSI = Buy_parameter).values('Open_price')
            Buyprice = 0
            Sellprice = 0
            for p in Priceset:
                if p <= Budget:
                    Buyprice = p
                    break
            Budget = Budget - Buyprice
            
            

    
    
       
    return render(request, 'Backtest.html', locals())
