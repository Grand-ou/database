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

class Investor(models.Model):
    iid = models.AutoField(primary_key=True)
    iname = models.TextField()
    acct_no = models.TextField(unique=True)
    pwd = models.TextField()
    phone = models.TextField()

    class Meta:
        db_table = 'stock"."investor'

    def __str__(self):
        return self.iid

class Company(models.Model):
    cid = models.TextField(primary_key=True)
    cname = models.TextField()
    cowner = models.TextField()
    cyield = models.FloatField()
    pe_ratio = models.FloatField()
    industry_type = models.TextField()

    class Meta:
        db_table = 'stock"."company'

    def __str__(self):
        return self.cid

class Strategy(models.Model): ##存每個使用者的做了什麼決策
    sid = models.AutoField(primary_key=True)
    budget = models.FloatField()
    #Company_id = models.ForeignKey('Company', on_delete=models.CASCADE)
    creator_id = models.ForeignKey('Investor', on_delete=models.SET_NULL, null=True)
    strategy_type = models.CharField(max_length=1)#RSI:R, MACD:M, KD:K, EMA : E
    
    class Meta:
        db_table = 'stock"."strategy'
    
    def __str__(self):
        return f'{self.sid}_by_{self.creator_id}_with_{self.strategy_type}'

class RSI(models.Model): ##存用RSI的策略
    sid = models.ForeignKey('Strategy', on_delete=models.CASCADE, primary_key=True)
    company_id = models.TextField()
    threshold = models.FloatField()
    rsi_length = models.FloatField()
    loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'stock"."rsi'

    def __str__(self):
        return f'{self.sid}_thres:{self.threshold}_len:{self.rsi_length}_loss:{self.loss}'

class KD(models.Model): ##存用KD的策略
    sid = models.ForeignKey('Strategy', on_delete=models.CASCADE, primary_key=True)
    company_id = models.TextField()
    threshold = models.FloatField()
    kd_length = models.FloatField()
    loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'stock"."kd'

    def __str__(self):
        return f'{self.sid}_thres:{self.threshold}_len:{self.kd_length}_loss:{self.loss}'

class MACD(models.Model): ##存用MACD的策略
    sid = models.ForeignKey('Strategy',on_delete=models.CASCADE, primary_key=True)
    company_id = models.TextField()
    fast_line = models.FloatField()
    slow_line = models.FloatField()
    loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'stock"."macd'

    def __str__(self):
        return f'{self.sid}_loss:{self.loss}'

class EMA(models.Model): ##存用EMA的策略
    sid = models.ForeignKey('Strategy',on_delete=models.CASCADE, primary_key=True)
    company_id = models.TextField()
    fast_line = models.FloatField()
    slow_line = models.FloatField()
    loss = models.FloatField()
    profit = models.FloatField()

    class Meta:
        db_table = 'stock"."ema'

    def __str__(self):
        return f'{self.sid}_loss:{self.loss}'

class Deal(models.Model):
    company_id = models.ForeignKey('Company', on_delete=models.CASCADE)
    ddate = models.DateField()
    open_price = models.FloatField
    close_price = models.FloatField   
    volume = models.TextField()
    high = models.FloatField()
    low = models.FloatField()

    class Meta:
        db_table = 'stock"."deal'
        unique_together = (("company_id", "ddate"),)

    def __str__(self):
        return f'{self.company_id}_{self.ddate}_deal'

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
