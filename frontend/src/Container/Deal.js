import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react';
import Companies from '../Component/Company';

const Deal = ({ setCompany, setClickCompany, setMenuset,  setClickDeal, setClickCreate, setClickInd }) => {

    return(
        <div className='schedule'>
            <Companies setCompany={setCompany} setClickCheck={setClickCompany} />
            <Button  className='create_h3' onClick={()=>{setClickCompany(true); setClickCreate(false); setClickInd(false);}}>確定</Button>
            <Button  className='create_h3' onClick={()=>{setMenuset(true); setClickDeal(false); setClickCompany(false);}}>回上頁</Button>
        </div>
    )
}

export default Deal