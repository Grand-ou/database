import '../App.css'
import { Space, Button } from 'antd'
import Backtest from '../Component/Backtest'

const Profit_Loss = ({ company, indicator, num1, num2, stopProfit, stopLoss, setClickCheck, setClickCreate }) => {

    return(
        <div className='profit-loss'>
            <Backtest company={company} indicator={indicator} num1={num1} num2={num2} stopProfit={stopProfit} stopLoss={stopLoss} />
            <Button onClick={()=>{setClickCheck(false); setClickCreate(true);}}>回上頁</Button>
        </div>
    )
}

export default Profit_Loss