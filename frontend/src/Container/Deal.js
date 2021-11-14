import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react';
import Companies from '../Component/Company';

const Deal = ({ setCompany, setClickCompany, setMenuset,  setClickDeal }) => {

    return(
        <div className='schedule'>
            <Companies setCompany={setCompany} setClickCheck={setClickCompany} />
            <Button onClick={()=>{setClickCompany(true);}}>確定</Button>
            <Button onClick={()=>{setMenuset(true); setClickDeal(false); setClickCompany(false);}}>回上頁</Button>
        </div>
    )
}

export default Deal