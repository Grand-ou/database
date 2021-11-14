import './App.css';
import MenuSet from './Container/MenuSet'
import Create from './Container/Create'
import Profit_Loss from './Container/Profit_Loss'
import Deal from './Container/Deal'
import DealInfo from './Container/DealInfo'
import ChooseInd from './Container/ChooseInd'
import { useState } from 'react';
import CreateComplete from './Container/CreateComplete';
import WatchHistory from "./Container/WatchHistory";
import Login_Register from './Container/Login_Register';
import Login_Succeed from './Container/LoginSucceed';
import Register_Succeed from './Container/RegisterSucceed'

const App = () => {

  const [company, setCompany] = useState('台積電')
  const [indicator, setIndicator] = useState('RSI')
  const [num1, setNum1] = useState(5)
  const [num2, setNum2] = useState(30)
  const [stopProfit, setStopProfit] = useState(0)
  const [stopLoss, setStopLoss] = useState(100)
  const [str1, setStr1] = useState('設定長度(2~25): ');
  const [str2, setStr2] = useState('設定閾值(10~40):');
  const [userID, setUserID] = useState('');
  const [password, setPassword] = useState('');

  const [LR, setLR] = useState(true)
  const [login, setLogin] = useState(false)
  const [register, setRegister] = useState(false)
  const [menuset, setMenuset] = useState(false)
  const [clickDeal, setClickDeal] = useState(false)
  const [clickCreate, setClickCreate] = useState(false)
  const [clickInd, setClickInd] = useState(false)         //選擇指標的確定鍵
  const [clickCheck, setClickCheck] = useState(false)     //創建投資組合頁面的回測鍵
  const [clickCompany, setClickCompany] = useState(false) //個股資訊頁面的選擇公司鍵
  const [createComplete, setCreateComplete] = useState(false)//創建策略
  const [watchHistory, setWatchHistory] = useState(false) //觀看歷史所設策略
  

  return <>
    {LR?
    <Login_Register setUserID={setUserID} setPassword={setPassword} setLogin={setLogin} setRegister={setRegister} setLR={setLR} />
    :<></>}
    {login?
    <Login_Succeed userID={userID} password={password} setLogin={setLogin} setMenuset={setMenuset} setLR={setLR} />
    :<></>}
    {register?
    <Register_Succeed userID={userID} password={password} setRegister={setLogin} setMenuset={setMenuset} setLR={setLR} />
    :<></>}
    {menuset?<MenuSet setClickDeal={setClickDeal} setClickCreate={setClickCreate} setMenuset={setMenuset} />
    :<></>}
    {clickCreate?
    <ChooseInd setIndicator={setIndicator}
               setStr1={setStr1}
               setStr2={setStr2}
               setClickInd={setClickInd}
               setMenuset={setMenuset}
               setClickCheck={setClickCheck} 
               setClickCreate={setClickCreate} />:<></>}
    {clickInd?
    <Create indicator={indicator}
            str1={str1}
            str2={str2}
            setCompany={setCompany}
            setNum1={setNum1}
            setNum2={setNum2}
            setStopProft={setStopProfit} 
            setStopLoss={setStopLoss}
            setClickCheck={setClickCheck}
            setClickCreate={setClickCreate}
            setClickInd={setClickInd}
            setCreateComplete={setCreateComplete}
            setWatchHistory={setWatchHistory} />: <></>}
    {clickCheck?
    <Profit_Loss company={company}
                 indicator={indicator}
                 num1={num1}
                 num2={num2}
                 stopProfit={stopProfit}
                 stopLoss={stopLoss} 
                 setClickCheck={setClickCheck}
                 setClickCreate={setClickCreate} />:<></>}
    {createComplete?
    <CreateComplete company={company}
                    indicator={indicator} 
                    num1={num1}
                    num2={num2}
                    stopProfit={stopProfit}
                    stopLoss={stopLoss}
                    setClickCreate={setClickCreate}
                    setCreateComplete={setCreateComplete} />:<></>}
    {watchHistory?
    <WatchHistory userID={userID}
                  setWatchHistory={setWatchHistory}
                  setClickCreate={setClickCreate} />:<></>}
    {clickDeal?
    <Deal setCompany={setCompany}
          setClickCompany={setClickCompany}
          setMenuset={setMenuset}
          setClickDeal={setClickDeal} />:<></>}
    {clickCompany?
    <DealInfo company={company} />:<></>}
  </>
}

export default App;
/*<Create setCompany={setCompany}
            setIndicator={setIndicator} 
            setRate={setRate} 
            setStopLoss={setStopLoss}
            setClickCheck={setClickCheck}
            setMenuset={setMenuset} 
            setClickCreate={setClickCreate} />: <></>*/
/*{LR?
   <Login_Register setUserID={setUserID} setPassword={setPassword} setLogin={setLogin} setRegister={setRegister} setLR={setLR} />
   :<></>}
  {Login?
   <Login_Succeed userID={userID} password={password} setLogin={setLogin} setMenuset={setMenuset} setLR={setLR} />
   :<></>}
  {Register?
   <Register_Succeed userID={userID} password={password} setRegister={setLogin} setMenuset={setMenuset} setLR={setLR} />
   :<></>}*/