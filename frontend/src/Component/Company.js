import { Select, Space } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const { Option } = Select;

const Companies = ({ setCompany, setClickCheck }) => {

    const onChange = (value) => {
        console.log(`selected ${value}`);
        setCompany(value)
        setClickCheck(false)
    }
      
    const onSearch = (val) => {
        console.log('search:', val);
    }
      
    return(
        <div>
            <Space className='company'>
                <h3 className='create_h3'>選擇個股</h3>
                <Select
                style={{ width: 300 }}
                onChange={onChange}
                filterOption={(input, option) =>
                    option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                }
                >
                <Option value="2330">台積電</Option>
                <Option value="2317">鴻海</Option>
                <Option value="2454">聯發科</Option>
                <Option value="6505">台塑化</Option>
                <Option value="2412">中華電</Option>
                </Select>
            </Space>
        </div>
      );
}



export default Companies
