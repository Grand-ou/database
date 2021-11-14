import axios from 'axios';
import { useState, useEffect } from 'react';

const Backtest = ({ company, indicator, num1, num2, stopProfit, stopLoss }) => {

  const [backtest, setBacktest] = useState([])

  useEffect(() => {
    axios.post('../backtest', {         //某種function，傳入各種數值並回傳回測分數
      "Company": company,
      "Indicator": indicator,
      "Num1": num1,
      "Num2": num2,
      "StopProfit": stopProfit, 
      "StopLoss": stopLoss
    })
    .then((res) => { 
      setBacktest(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])

  return <>
      <h3>回測分數: </h3>
      <p>{backtest}</p>
  </>
}

export default Backtest