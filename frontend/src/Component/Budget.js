import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { InputNumber } from 'antd';
import { Space } from 'antd';

const Budget = ({ setBudget, setClickCheck }) => {

      const onChange = (value) => {
        console.log(`selected ${value}`);
        setBudget(value);
        setClickCheck(false);
      }
      
      return(
        <div>
            <Space className='num'>
                <h3>預算</h3>
                <InputNumber 
                min={0} 
                defaultValue={10000} 
                onChange={onChange} />
            </Space>
        </div>
      );

}

export default Budget