import axios from 'axios';
import { useState, useEffect } from 'react';
import CreateStrategyEMA from './CreateStrategyEMA';
import CreateStrategyRSI from './CreateStrategyRSI';
import CreateStrategyMACD from './CreateStrategyMACD';
import CreateStrategyKD from './CreateStrategyKD';


const CreateStrategy = ({ company, indicator, num1, num2, stopProfit, stopLoss, budget }) => {

  const [strategy, setStrategy] = useState('')
  const [str, setStr] = useState('策略未創建成功')

  useEffect(() => {
    if(indicator == 'RSI'){
      axios.post('http://127.0.0.1:8000/api/create/rsi', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Length": num1,
        "Threshold": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setStrategy(res.data)
      })
      .catch((error) => { console.log(error) })
    }
    
      
  },[])

  return <>
  <h3>{strategy}</h3>
  </>
}

export default CreateStrategy