import { Select } from 'antd';
import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';
import { InputNumber } from 'antd';
import { Space } from 'antd';

const { Option } = Select;

const indicators = ['RSI', 'MACD', 'KD', 'EMA'];

const Indicators = ({ setIndicator, setStr1, setStr2, setClickCheck }) => {
    
    const decide = (indicator) => {
        if (indicator == 'RSI'){
          setStr1('設定長度(2~25): ');
          setStr2('設定閾值(10~40): ');
        }
        else if (indicator == 'KD'){
          setStr1('設定長度(2~30): ');
          setStr2('設定閾值(10~40): ');
        }
        else{
          setStr1('設定長線長度(1~90): ');
          setStr2('設定短線長度(1~90): ');
        }
    }

    const onChangeIndicator = (value) => {
        console.log(`selected ${value}`);
        setIndicator(value);
        decide(value);
        setClickCheck(false);
    }
      
    const onSearch = (val) => {
        console.log('search:', val);
    }
      
    return(
        <div>
            <Space className='indicators'>
                <h3>開關單指標</h3>
                <Select style={{ width: 120 }} 
                        onChange={onChangeIndicator}
                        filterOption={(input, option) =>
                            option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                        }>
                    {indicators.map(indicator => (
                        <Option key={indicator}>{indicator}</Option>
                    ))}
                </Select>
            </Space>
        </div>
    );
}



export default Indicators
//const onChangeRate = (value) => {
//    console.log(`selected ${value}`);
//}
//<InputNumber min={0} max={100} defaultValue={3} onChange={onChangeRate} />
/*  const onChangeIndNum = (value) => {
        console.log(`selected ${value}`);
        setIndNum(value);
        if (indName == 'RSI')
            setRate(value);
        else
            setRate(0);
        setClickCheck(false);
    }
    <InputNumber 
                    min={ind[1]} 
                    max={ind[2]} 
                    onChange={onChangeIndNum} />*/