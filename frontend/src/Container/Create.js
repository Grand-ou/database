import '../App.css'
import Companies from '../Component/Company';
import IndicatorNum from '../Component/IndicatorNum';
import StopLoss from '../Component/StopLoss';
import StopProfit from '../Component/StopProfit';
import Budget from '../Component/Budget';
import { Space, Button } from 'antd'
import { useState } from 'react';

const Create = ({ str1, str2, setCompany, setNum1, setNum2, setStopProfit, setBudget, setStopLoss, setClickCheck, setClickCreate, setClickInd, setCreateComplete, setWatchHistory }) => {

    return(
        <div >
            <Companies setCompany={setCompany} setClickCheck={setClickCheck} />
            <IndicatorNum str1={str1} str2={str2} setNum1={setNum1} setNum2={setNum2} setClickCheck={setClickCheck} />
            <StopLoss setStopLoss={setStopLoss} setClickCheck={setClickCheck} />
            <StopProfit setStopProfit={setStopProfit} setClickCheck={setClickCheck} />
            <Budget setBudget={setBudget} setClickCheck={setClickCheck} />
            <Button  className='create_h3' onClick={()=>{setClickCheck(true); setClickCreate(false); setClickInd(false);}}>進行回測</Button>
            <Button  className='create_h3' onClick={()=>{setCreateComplete(true); setClickCreate(false); setClickInd(false);}}>建立策略</Button>
            <Button  className='create_h3' onClick={()=>{setWatchHistory(true); setClickCreate(false); setClickInd(false);}}>觀看歷史策略</Button>
        </div>
    )
}

export default Create
// <IndicatorNum setRate={setRate} setClickCheck={setClickCheck} />