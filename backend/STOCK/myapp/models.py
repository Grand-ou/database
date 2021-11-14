# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.db.models.base import Model
from django.db.models.deletion import CASCADE
from django.db.models.fields.related import ForeignKey

class Investor(models.model):
    Iid = models.AutoField(primary_key=True)
    IName = models.TextField()
    Acct_no = models.TextField(unique=True)
    Pwd = models.TextField()
    phone = models.TextField()

    class Meta:
        db_table = 'STOCK"."Investor'

    def __str__(self):
        return self.Iid

class Company(models.Model):
    Cid = models.TextField(primary_key=True)
    CName = models.TextField()
    COwner = models.TextField()
    Report = models.BinaryField(null=True) #財報:圖片
    Industry_type = models.TextField()

    class Meta:
        db_table = 'STOCK"."Company'

    def __str__(self):
        return self.Cid

class Strategy(models.Model): ##存每個使用者的做了什麼決策
    Sid = models.AutoField(primary_key=True)
    budget = models.FlaotField()
    Company_id = models.ForeignKey('Company', on_delete=models.CASCADE)
    Creator_id = models.ForeignKey('Investor', on_delete=models.SET_NULL, null=True)
    strategy_type = models.CharField()#RSI:R, MACD:M, KD:K, EMA : E
    #Buy_indicator = models.TextField()
    #Buy_parameter = models.DecimalField(decimal_places=2)
    #ell_indicator = models.TextField()
    #Sell_parameter = models.DecimalField(decimal_places=2)
    
    class Meta:
        db_table = 'STOCK"."Strategy'
    
    def __str__(self):
        return f'{self.Sid}_by_{self.Creator_id}_{self.Company_id}with{self.Strategy_type}'

class RSI(models.Model): ##存用RSI的策略
    Sid = models.ForeignKey('Strategy', on_delete=models.CASCADE, primary_key=True)
#    company_id = ForeignKey('Company', on_delete=models.CASCADE)
    Threshold = models.FloatField()
    Length = models.FloatField()
    Loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'STOCK"."RSI'

    def __str__(self):
        return f'{self.Sid}_thres:{self.Threshold}_len:{self.length}_loss:{self.Loss}'

class KD(models.Model): ##存用RSI的策略
    Sid = models.ForeignKey('Strategy', on_delete=models.CASCADE, primary_key=True)
    #company_id = ForeignKey('Company', on_delete=models.CASCADE)
    Threshold = models.FloatField()
    Length = models.FloatField()
    Loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'STOCK"."KD'

    def __str__(self):
        return f'{self.Sid}_thres:{self.Threshold}_len:{self.length}_loss:{self.Loss}'

class MACD(models.Model): ##存用RSI的策略
    Sid = models.ForeignKey('Strategy',on_delete=models.CASCADE, primary_key=True)
    #company_id = ForeignKey('Company', on_delete=models.CASCADE)
    Fast_line = models.FloatField()
    Slow_line = models.FloatField()
    Loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'STOCK"."MACD'

    def __str__(self):
        return f'{self.Sid}_loss:{self.Loss}'

class EMA(models.Model): ##存用RSI的策略
    Sid = models.ForeignKey('Strategy',on_delete=models.CASCADE, primary_key=True)
    #company_id = ForeignKey('Company', on_delete=models.CASCADE)
    Fast_line = models.FloatField()
    Slow_line = models.FloatField()
    Loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'STOCK"."EMA'

    def __str__(self):
        return f'{self.Sid}_loss:{self.Loss}'

#class Market(models.Model):
#    MDate = models.DateField(primary_key=True)
#    MIndex = models.FloatField()
#    Fluc_amount = models.FloatField()
#    Fluc_ratio = models.FloatField()
#    Deal_volume = models.TextField()

#    class Meta:
#        db_table = 'Stock"."Market'

#    def __str__(self):
#        return f'{self.MDate}_market'

class Deal(models.Model):
    Company_id = models.ForeignKey('Company', on_delete=models.CASCADE)
    Ddate = models.DateField()
    Open_price = models.DecimalField(decimal_places=2)
    Close_price = models.DecimalField(decimal_places=2)
    Volume = models.TextField()
    High = models.FloatField()
    Low = models.FloatField()
    #KD = models.DecimalField(decimal_places=2)
    #RSI = models.DecimalField(decimal_places=2)
    #MACD = models.DecimalField(decimal_places=2)
    Risk = models.DecimalField(decimal_places=2)
    Week_MA = models.DecimalField(decimal_places=2)
    Month_MA = models.DecimalField(decimal_places=2)
    Quarter_MA = models.DecimalField(decimal_places=2)

    class Meta:
        db_table = 'STOCK"."Deal'
        unique_together = (("Company_id", "Ddate"),)

    def __str__(self):
        return f'{self.Company_id}_{self.Ddate}_deal'
 	
#class Foreign_inv(models.Model):
#    Company_id = models.ForeignKey('Deal', to_field='Company_id', on_delete=models.CASCADE)
#    Deal_date = models.ForeignKey('Deal', to_field='Ddate', on_delete=models.CASCADE)
#    FBuy = models.TextField()
#    FSell = models.TextField()
#    FNet = models.TextField()
#    FHolding = models.TextField()
#    FHolding_ratio = models.DecimalField()

#    class Meta:
#        db_table = 'STOCK"."Foreign_inv'
#        unique_together = (("Company_id", "Deal_date"),)
    
#    def __str__(self):
#       return f'{self.Company_id}_{self.Deal_date}_foreign'
