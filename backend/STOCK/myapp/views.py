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
            raw_password = form.cleanedgit_data.get('password')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})
def login_request(request):
	if request.method == "POST":
		form = AuthenticationForm(request, data=request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				login(request, user)
				messages.info(request, "You are now logged in as {username}.")
				return redirect("main:homepage")
			else:
				 return Response("Invalid username or password.", status=status.HTTP_400_BAD_REQUEST)
                
		else:
			return Response("Invalid username or password.", status=status.HTTP_400_BAD_REQUEST)

	form = AuthenticationForm()
	return Response("you are logged in.", status=status.HTTP_200_OK)



def stockinformation(request, informationid = none):
    unit = Company.objects.get(id = informationid)
    Cid = unit.Cid
    CName = unit.CName
    COwner = unit.COwner
    Report = unit.Report
    Industry_type = unit.Industry_type
    unit.save()

   return Response("stock information", status=status.HTTP_200_OK)

def strategecreate(request):
     ## 將策略存進資料庫
    if request.method == 'POST':
        Company_id = request.POST['Company_id']
        Buy_indicator = request.POST['Buy_indicator']
        Buy_parameter = request.POST['BUY_parameter']
        Sell_indicator = request.POST['Sell_indicator']
        Sell_parameter = request.POST['Sell_parameter'] 
        Budget = request.POST['Budget']##?
        unit = Strategy.objects.create(Company_id = Company_id, Buy_indicator = Buy_indicator, Sell_indicator = Sell_indicator, Sell_parameter = Sell_parameter ) 
        unit.save()
      return Response("stratege saved", status=status.HTTP_200_OK)   
def seestratege(request, user = None):
     unit = Strategy.objects.get(id = user)
     Sid = unit.sid
     budget = unit.budget
     Company_id = unit.Company_id
     Creator_id = unit.Creator_id
     strategy_type = unit. strategy_type
     unit.save()

   return Response("stratege", status=status.HTTP_200_OK)

#def Backtest(request):

        ## 回測
    if Buy_indicator == 'RSI':
        BuyPriceset =  Deal.objects.filter(Company_id = Company_id , RSI = Buy_parameter).values('Open_price')
        ## SellPriceset =  Deal.objects.filter(Company_id = Company_id , RSI = Buy_parameter).values('Open_price')
        Buyprice = 0
        Sellprice = 0
        for p in BuyPriceset:
            if p <= Budget:
                Buyprice = p
                Budget = Budget - Buyprice
                break
        


       
    return render(request, 'Backtest.html', locals())
