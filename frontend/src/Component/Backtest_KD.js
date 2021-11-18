import axios from 'axios';
import { useState, useEffect } from 'react';

const Backtest_KD = ({ company, num1, num2, stopProfit, stopLoss, setBacktest }) => {

  useEffect(() => {
    axios.post('http://127.0.0.1:8000/api/back_test_kd', {         //某種function，傳入各種數值進入策略的資料庫中
      "Company_id": company,
      "Length": num1,
      "Threshold": num2,
      "Profit": stopProfit, 
      "Loss": stopLoss
    })
    .then((res) => { 
      setBacktest(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])
  return <>
  </>
}

export default Backtest_KD