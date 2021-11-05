from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from backend.models import Investor, Company, Strategy, Market, Deal, Foreign_inv

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})
def stockinformation(request,informationid = none):
    unit = models.Company.objects.get(id = informationid)
    Cid = unit.Cid
    CName = unit.CName
    COwner = unit.COwner
    Report = unit.Report
    Industry_type = unit.Industry_type
    unit.save()

    return render(request, 'tockinformation.html', locals())
