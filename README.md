# 投資策略輔助系統
註冊/登入後，根據需求去選擇要看個股資訊還是建立決策

### contribution & tasks
- 歐崇愷    資料收集/前端撰寫
- 李書成    資料庫設計/後端撰寫/投影片製作
- 莊莊      網頁功能設計/後端撰寫/腳本撰寫
- 陳沛竹    資料庫設計/後端撰寫/前後端連接
- 張庭庸    網頁功能設計/後端撰寫
- 蔡宇倫    前端撰寫/前後端連接/前後端連接
## Database
- 下載 [PostgreSQL 13](https://www.postgresql.org/download/) 以及 [pgAdmin](https://www.pgadmin.org/) (GUI介面)
- db 資料夾裡有2個 sql 檔案
* 在 pgAdmin 登入後創建一個名為 Stock 的資料庫
* 右鍵點擊資料庫 > 選擇 Restore
* 選擇位於 db 資料夾的 STOCK_custom.sql 檔案進行 Restore

### API
- **API說明文件**:https://sincere-citipati-3cc.notion.site/API-ed180f7c09a945fdb7c6b7699acf76e0
- **API endpoint**: http://127.0.0.1:8000/api
- **三個接口**:
    >POST /signup

    >POST /login

    >POST /stockinformation

    >GET /seestrategy

    >POST /create/(rsi, macd, kd, or ema 其中一個)

    >POST /backtest/(rsi, macd, kd, or ema 其中一個)
## backend-使用mac做示範

- 確定電腦有安裝 `python3` 以及完成上述資料匯入資料庫的指令後打開終端機執行以下指令：
```shell
# for mac
cd backend
python3 -m venv stock-env #建立虛擬環境 #-m: module-name
source stock-env/bin/activate #啟動虛擬環境 for mac
```
- 下載所需套件
```shell
python -m pip install --upgrade pip #pip更新至最新版本
pip install -r requirements.txt
pip list
```
- 安裝完套件後複製 `.env.example` 的內容到 `.env`。
```shell
# for mac
cp .env.example .env
```
- 接著可以將 `.env` 當中的變數改成符合你電腦資料庫的值。
```shell
SECRET_KEY={aaaaaaaaa}
DEBUG=True
ALLOWED_HOSTS=.localhost,127.0.0.1
DATABASE_URL={postgres://USER:PASSWORD@127.0.0.1:5432/Stock}
```
- 最後，同步資料庫並啟動 backend server。
```shell
python manage.py migrate
python manage.py runserver
```

- 用瀏覽器打開  http://127.0.0.1:8000/api/stockinformation ，輸入 {"cname": "台積電"} 後點擊 POST，如果有順利拿到資源表示後端起成功。
![](img/api.png)

## Frontend
#### Step 0. 安裝 yarn
如果你還沒有安裝 yarn，請參考官網 https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable ，依照步驟安裝。

#### Step 1. 安裝 packages
第一次開啟專案請先用以下指令安裝所有需要的 packages，之後再次開啟專案跳過這個指令即可。
```shell
cd frontend
yarn
npm install
```

#### Step 2. 開啟前端
```shell
cd frontend
yarn start
```
#### Step 3. 開啟瀏覽器 
一般情況會自動開啟瀏覽器，若沒有請手動開啟 http://127.0.0.1:3000/ ，看到以下畫面即代表成功開啟前端且前後端連接成功。

#### 首頁
(<img width="1440" alt="截圖 2021-11-21 下午4 56 50" src="https://user-images.githubusercontent.com/92725965/142756484-537a9e31-019f-49f9-b16f-c4efc95491b6.png">
查詢選單、大盤資訊)


#### 個股查詢
[Uploading 截圖 2021-11-21 下午4.59.07.png…]()


#### 建立策略(RSI)
<img width="1440" alt="截圖 2021-11-21 下午4 57 21" src="https://user-images.githubusercontent.com/92725965/142756599-b921228f-04c7-489a-8f4e-af71e53855b7.png">

#### 策略結果
[Uploading 截圖 2021-11-21 下午4.57.40.png…]()

