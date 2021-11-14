import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { InputNumber } from 'antd';
import { Space } from 'antd';

const StopLoss = ({ setStopLoss, setClickCheck }) => {
    
      const onChange = (value) => {
        console.log(`selected ${value}`);
        setStopLoss(value)
        setClickCheck(false)
      }
      
      return(
        <div>
            <Space className='stopLoss'>
                <h3>停損點</h3>
                <InputNumber 
                min={0} 
                max={100} 
                defaultValue={100} 
                onChange={onChange} />
                <p>%</p>
            </Space>
        </div>
      );

}

export default StopLoss