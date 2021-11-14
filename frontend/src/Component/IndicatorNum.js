import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { InputNumber } from 'antd';
import { Space } from 'antd';

const IndicatorNum = ({ str1, str2, setNum1, setNum2, setClickCheck }) => {

      const onChange1 = (value) => {
        console.log(`selected ${value}`);
        setNum1(value);
        setClickCheck(false);
      }

      const onChange2 = (value) => {
        console.log(`selected ${value}`);
        setNum2(value);
        setClickCheck(false);
      }
      
      return(
        <div>
            <Space className='num'>
                <h3>{str1}</h3>
                <InputNumber 
                min={0} 
                max={100} 
                defaultValue={5} 
                onChange={onChange1} />
                <h3>{str2}</h3>
                <InputNumber 
                min={0} 
                max={100} 
                defaultValue={30} 
                onChange={onChange2} />
            </Space>
        </div>
      );

}

export default IndicatorNum