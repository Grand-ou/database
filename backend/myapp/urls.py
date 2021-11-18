from django.conf.urls import url
from myapp import views

urlpatterns = [
    url('signup', views.signup),
    url('login',  views.login),
    url('stockinformation', views.stockinformation),
    url('seestrategy', views.seestrategy),
    #url('backtest', views.backtest),
]