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
      setStr1('長線:');
      setStr2('短線:');
    }
  },[])

  return <>
    <div className='create_s'>
      <h3  className='create_h3'>策略創建成功！</h3>
      <div className='strategy_div'>
      <p className='create_strategy'>選擇公司：</p><p className='create_strategy'>{company}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>選擇指標：</p><p className='create_strategy'>{indicator}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>{str1}</p><p className='create_strategy'>{num1}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>{str2}</p><p className='create_strategy'>{num2}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>停利點 : </p><p className='create_strategy'>{stopProfit}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>停損點 : </p><p className='create_strategy'>{stopLoss}</p>
      </div><div className='strategy_div'>
      <p className='create_strategy'>設置預算 : </p><p className='create_strategy'>{budget}</p>
      </div>
    </div>
  </>
}

export default CreateStrategy
