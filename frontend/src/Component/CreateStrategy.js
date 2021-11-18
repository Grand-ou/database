import axios from 'axios';
import { useState, useEffect } from 'react';
import CreateStrategyEMA from './CreateStrategyEMA';
import CreateStrategyRSI from './CreateStrategyRSI';
import CreateStrategyMACD from './CreateStrategyMACD';
import CreateStrategyKD from './CreateStrategyKD';


const CreateStrategy = ({ company, indicator, num1, num2, stopProfit, stopLoss, userID }) => {

  const [strategy, setStrategy] = useState([])

  return <>
  <script>
    if ({indicator} == 'RSI'){
      CreateStrategyRSI({ company, num1, num2, stopProfit, stopLoss, userID })
    }
    else if ({indicator} == 'MACD'){
      CreateStrategyMACD({ company, num1, num2, stopProfit, stopLoss, userID })
    }
    else if ({indicator} == 'KD'){
      CreateStrategyKD({ company, num1, num2, stopProfit, stopLoss, userID })
    }
    else{
      CreateStrategyEMA({ company, num1, num2, stopProfit, stopLoss, userID })
    }
  </script>
  </>
}

export default CreateStrategy