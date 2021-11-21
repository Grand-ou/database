import '../App.css'
import Companies from '../Component/Company';
import Indicators from '../Component/Indicators';
import StopLoss from '../Component/StopLoss';
import { Space, Button } from 'antd'
import { useState } from 'react';

const ChooseInd = ({ setIndicator, setStr1, setStr2, setMenuset, setClickInd, setClickCheck, setClickCreate }) => {

    return(
        <div className='create'>
            <Indicators setIndicator={setIndicator} setStr1={setStr1} setStr2={setStr2} setClickCheck={setClickInd} />
            <Button className='create_h3' onClick={()=>{setClickInd(true); }}>選擇欲使用指標</Button>
            <Button className='create_h3' onClick={()=>{setClickCheck(false); setMenuset(true); setClickCreate(false); setClickInd(false);}}>回上頁</Button>
        </div>
    )
}

export default ChooseInd