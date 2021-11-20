import axios from 'axios';
import { useState, useEffect } from 'react';

const CreateStrategy = ({ company, indicator, num1, num2, stopProfit, stopLoss, budget }) => {

  const [strategy, setStrategy] = useState('')
  const [str1, setStr1] = useState('長度: ')
  const [str2, setStr2] = useState('閾值: ')

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
    else if (indicator == 'MACD'){
      axios.post('http://127.0.0.1:8000/api/create/macd', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Fast_line": num1,
        "Slow_line": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setStrategy(res.data)
      })
      .catch((error) => { console.log(error) });
      setStr1('長線: ');
      setStr2('短線: ');
    }
    else if (indicator == 'KD'){
      axios.post('http://127.0.0.1:8000/api/create/kd', {         //某種function，傳入各種數值進入策略的資料庫中
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
    else if (indicator == 'EMA'){
      axios.post('http://127.0.0.1:8000/api/create/ema', {         //某種function，傳入各種數值進入策略的資料庫中
        "Company_id": company,
        "Fast_line": num1,
        "Slow_line": num2,
        "Profit": stopProfit, 
        "Loss": stopLoss,
        "Budget": budget
      })
      .then((res) => { 
        setStrategy(res.data)
      })
      .catch((error) => { console.log(error) });
      setStr1('長線: ');
      setStr2('短線: ');
    }
  },[])

  return <>
    <div>
      <h3>策略創建成功！</h3>
      <p>選擇公司：{company}</p>
      <p>選擇指標：{indicator}</p>
      <p>{str1}{num1}</p>
      <p>{str2}{num2}</p>
      <p>停利點: {stopProfit}</p>
      <p>停損點: {stopLoss}</p>
      <p>設置預算: {budget}</p>
    </div>
  </>
}

export default CreateStrategy
