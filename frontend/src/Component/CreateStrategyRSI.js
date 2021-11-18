import axios from 'axios';
import { useState, useEffect } from 'react';

const CreateStrategyRSI = ({ company, num1, num2, stopProfit, stopLoss, userID }) => {

  const [strategy, setStrategy] = useState([])

  useEffect(() => {
    axios.post('http://127.0.0.1:8000/api/rsi_create', {         //某種function，傳入各種數值進入策略的資料庫中
      "Creator_id": userID,
      "Company_id": company,
      "Length": num1,
      "Threshold": num2,
      "Profit": stopProfit, 
      "Loss": stopLoss
    })
    .then((res) => { 
      setStrategy(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])
  return <>
  </>
}

export default CreateStrategyRSI