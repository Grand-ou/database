import '../App.css'
import Companies from '../Component/Company';
import Indicators from '../Component/Indicators';
import StopLoss from '../Component/StopLoss';
import CreateStrategy from '../Component/CreateStrategy';
import { Space, Button } from 'antd'
import { useState } from 'react';

const CreateComplete = ({ company, indicator, num1, num2, stopProfit, stopLoss, setCreateComplete, setClickCreate }) => {

    return(
        <div className='create'>
            <h3>策略已創建</h3>
            <CreateStrategy company={company} indicator={indicator} num1={num1} num2={num2} stopProfit={stopProfit} stopLoss={stopLoss} />
            <Button onClick={()=>{setCreateComplete(false); setClickCreate(true);}}>回上頁</Button>
        </div>
    )
}

export default CreateComplete