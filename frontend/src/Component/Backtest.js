import axios from 'axios';
import { useState, useEffect } from 'react';
import Backtest_RSI from './Backtest_RSI';
import Backtest_MACD from './Backtest_MACD';
import Backtest_KD from './Backtest_KD';
import Backtest_EMA from './Backtest_EMA';

const Backtest = ({ company, indicator, num1, num2, stopProfit, stopLoss }) => {

  const [backtest, setBacktest] = useState([])

  return <>
      <script>
        if ({indicator} == 'RSI'){
          Backtest_RSI({ company, num1, num2, stopProfit, stopLoss }, setBacktest={setBacktest} )
        }
        else if ({indicator} == 'MACD'){
          Backtest_MACD({ company, num1, num2, stopProfit, stopLoss }, setBacktest={setBacktest})
        }
        else if ({indicator} == 'KD'){
          Backtest_KD({ company, num1, num2, stopProfit, stopLoss }, setBacktest={setBacktest})
        }
        else{
          Backtest_EMA({ company, num1, num2, stopProfit, stopLoss }, setBacktest={setBacktest})
        }
      </script>
      <h3>回測分數: </h3>
      <p>{backtest}</p>
  </>
}

export default Backtest