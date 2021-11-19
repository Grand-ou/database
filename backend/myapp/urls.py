from django.conf.urls import url
from myapp import views

urlpatterns = [
    url('signup', views.signup),
    url('login',  views.login_request),
    url('stockinformation', views.stockinformation),
    url('seestrategy', views.seestrategy),
    url('create/rsi', views.rsi_create),
    url('create/macd', views.macd_create),
    url('create/kd', views.Kd_create),
    url('create/ema', views.Ema_create),
    url('backtest/rsi', views.back_test_rsi),
    url('backtest/macd', views.back_test_macd),
    url('backtest/kd', views.back_test_kd),
    url('backtest/ema', views.back_test_ema),
]
