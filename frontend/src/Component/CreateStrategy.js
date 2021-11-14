import axios from 'axios';
import { useState, useEffect } from 'react';

const CreateStrategy = ({ company, indicator, num1, num2, stopProfit, stopLoss }) => {

  const [strategy, setStrategy] = useState([])

  useEffect(() => {
    axios.post('../strategy', {         //某種function，傳入各種數值進入策略的資料庫中
      "Company": company,
      "Indicator": indicator,
      "Num1": num1,
      "Num2": num2,
      "StopProfit": stopProfit, 
      "StopLoss": stopLoss
    })
    .then((res) => { 
      setStrategy(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])

  return <>
  </>
}

export default CreateStrategy