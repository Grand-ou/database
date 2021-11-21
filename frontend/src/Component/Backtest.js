import axios from 'axios';
import { useState, useEffect } from 'react';

const Backtest = ({ company, indicator, num1, num2, stopProfit, stopLoss, budget }) => {

  const [backtest, setBacktest] = useState([])
  
  useEffect(() => {
    if(indicator == 'RSI'){
      axios.post('http://127.0.0.1:8000/api/backtest/rsi', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Length": num1,
        "Threshold": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setBacktest(res.data)
      })
      .catch((error) => { console.log(error) })
    }
    else if (indicator == 'MACD'){
      axios.post('http://127.0.0.1:8000/api/backtest/macd', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Fast_line": num1,
        "Slow_line": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setBacktest(res.data)
      })
      .catch((error) => { console.log(error) })
    }
    else if (indicator == 'KD'){
      axios.post('http://127.0.0.1:8000/api/backtest/kd', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Length": num1,
        "Threshold": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setBacktest(res.data)
      })
      .catch((error) => { console.log(error) })
    }
    else if (indicator == 'EMA'){
      axios.post('http://127.0.0.1:8000/api/backtest/ema', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Fast_line": num1,
        "Slow_line": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setBacktest(res.data)
      })
      .catch((error) => { console.log(error) })
    }
  },[])

  return <>
      <h3>回測分數: {backtest}</h3>
  </>
}

export default Backtest
